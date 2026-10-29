from pathlib import Path
import sys, json, hashlib
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'work/tmp/fit_packages'))
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
OUT=Path(__file__).resolve().parent
source=Path('C:/Users/33827/Desktop/3.txt')
base=Path('C:/Users/33827/Desktop/nasa数据')
x=np.loadtxt(source,delimiter='#',comments=None)
assert x.ndim==2 and x.shape[1]==2 and np.isfinite(x).all()
v=np.loadtxt(base/'7_32_38_46_V_Test.txt');i=np.loadtxt(base/'7_32_38_46_I_Test.txt')
assert v.shape==i.shape==(323,4002) and np.array_equal(v[:,:2],i[:,:2])
# First two NASA columns identify battery/cycle; they are NOT measurements.
ref=np.stack([v[:,2:],i[:,2:]],axis=2)
median=np.median(ref,axis=0)
q=np.linspace(0,1,101)
result=np.empty_like(x)
knots=[]
for ch in range(2):
    a=np.quantile(x[:,ch],q);b=np.quantile(median[:,ch],q)
    # Quantized sensor readings can create duplicate input quantiles.
    unique,inv=np.unique(a,return_inverse=True)
    target=np.bincount(inv,weights=b)/np.bincount(inv)
    assert np.all(np.diff(target)>=0)
    result[:,ch]=np.interp(x[:,ch],unique,target)
    knots.append((unique,target))
    np.savetxt(OUT/('voltage_mapping.csv' if ch==0 else 'current_mapping.csv'),
               np.column_stack([unique,target]),delimiter=',',header='measured_value,nasa_style_value',comments='',fmt='%.10g')
np.savetxt(OUT/'3_nasa_style.txt',result,delimiter='#',fmt=['%.6f','%.6f'])
check=np.loadtxt(OUT/'3_nasa_style.txt',delimiter='#',comments=None)
assert check.shape==x.shape and np.isfinite(check).all()
assert np.allclose(check,result,atol=5.01e-7,rtol=0)
for ch in range(2):
    assert np.all(np.diff(result[:,ch])[np.diff(x[:,ch])>0]>=0)
    assert np.all(np.diff(result[:,ch])[np.diff(x[:,ch])<0]<=0)
p=np.linspace(0,1,len(x));rp=np.linspace(0,1,4000)
fig,axes=plt.subplots(2,2,figsize=(13,8),sharex=True)
for ch,label in enumerate(['Voltage (V)','Current (A)']):
    low,high=np.quantile(ref[:,:,ch],[.1,.9],axis=0)
    for row,data,name,color in [(0,x,'Measured', '#2575b9'),(1,result,'NASA-style transformed','#e27724')]:
        ax=axes[row,ch]
        ax.fill_between(rp*100,low,high,color='#aaaaaa',alpha=.3,label='NASA 10-90% band')
        ax.plot(rp*100,median[:,ch],color='#333333',lw=1.6,label='NASA pointwise median')
        ax.plot(p*100,data[:,ch],color=color,lw=.75,alpha=.85,label=name)
        ax.set_ylabel(label);ax.grid(alpha=.2);ax.legend(fontsize=8)
        ax.set_title(name+' vs NASA reference')
        ax.set_xlabel('Sample progress (%) - not synchronized time')
fig.suptitle('4345 points preserved | monotone quantile mapping | NOT sensor calibration',fontsize=13)
fig.tight_layout(rect=[0,0,1,.96]);fig.savefig(OUT/'comparison.png',dpi=160);fig.savefig(OUT/'comparison.svg');plt.close(fig)
metrics={
 'source':str(source),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
 'rows':len(x),'reference_rows':323,'reference_batteries':[7,32,38,46],
 'method':'101-quantile piecewise-linear monotone mapping to the NASA pointwise-median curve; duplicate source knots averaged',
 'scope':'Artificial distribution alignment, NOT validated sensor calibration or SOH accuracy improvement. No time resampling, smoothing, extrapolated tail, firmware change or label transfer.',
 'quantile_levels':[0,.01,.1,.5,.9,.99,1],
 'raw_quantiles':np.quantile(x,[0,.01,.1,.5,.9,.99,1],axis=0).tolist(),
 'transformed_quantiles':np.quantile(result,[0,.01,.1,.5,.9,.99,1],axis=0).tolist(),
 'reference_median_quantiles':np.quantile(median,[0,.01,.1,.5,.9,.99,1],axis=0).tolist(),
 'raw_first100_median':np.median(x[:100],axis=0).tolist(),
 'raw_last100_median':np.median(x[-100:],axis=0).tolist(),
 'transformed_first100_median':np.median(result[:100],axis=0).tolist(),
 'transformed_last100_median':np.median(result[-100:],axis=0).tolist(),
 'validation':{'row_count_preserved':True,'finite':True,'monotone_mapping':True,'max_export_rounding_error':float(np.max(np.abs(check-result)))}}
(OUT/'fit_report.json').write_text(json.dumps(metrics,indent=2,ensure_ascii=False),encoding='utf-8')
print(json.dumps(metrics,ensure_ascii=True,indent=2))
