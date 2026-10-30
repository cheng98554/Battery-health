param([string]$Tools='C:/AMDDesignTools/2026.1',[ValidateRange(1,64)][int]$Jobs=4,[switch]$CheckOnly)
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
foreach($tool in @('Vitis/bin/vitis-run.bat','Vivado/bin/vivado.bat','Vitis/bin/vitis.bat','Vitis/bin/bootgen.bat')){if(!(Test-Path "$Tools/$tool")){throw "Missing $tool"}}
foreach($reference in @('board/system_wrapper.xsa','board/system_wrapper.bit')){if(!(Test-Path (Join-Path $root $reference))){throw 'Board hardware reference missing'}}
if($CheckOnly){Write-Host 'Tool preflight passed';return}
$out=Join-Path $root ('work/build_'+[guid]::NewGuid().ToString('N').Substring(0,8))
New-Item -ItemType Directory "$out/reports" -Force | Out-Null
function Run-Stage($name,$exe,$arguments){
 # Windows PowerShell 5.1 wraps native stderr in ErrorRecord objects.
 # Keep draining stderr so a traceback is recorded in full before failing.
 $savedPreference=$ErrorActionPreference
 try {
  $ErrorActionPreference='Continue'
  & $exe @arguments 2>&1 | ForEach-Object { $_.ToString() } | Tee-Object "$out/reports/$name.log"
  $code=$LASTEXITCODE
 } finally { $ErrorActionPreference=$savedPreference }
 if($code -ne 0){throw "$name failed (exit $code); see $out/reports/$name.log"}
}
$previous=$env:NASA_BUILD_DIR
$env:NASA_BUILD_DIR=$out
Push-Location $out
try {
 Run-Stage hls "$Tools/Vitis/bin/vitis-run.bat" @('--mode','hls','--tcl',"$root/src/hls/build.tcl")
 if(!(Test-Path "$out/hls/solution1/impl/ip/component.xml")){throw "HLS IP export missing"}
 Run-Stage vivado "$Tools/Vivado/bin/vivado.bat" @('-mode','batch','-source',"$root/build/scripts/rebuild.tcl",'-tclargs',$root,$out,"$Jobs")
 if(!(Test-Path "$out/system_wrapper.xsa")){throw "Vivado XSA export missing"}
 Run-Stage software "$Tools/Vitis/bin/vitis.bat" @('-s',"$root/build/scripts/software.py")
 "the_ROM_image:`n{`n [bootloader] fsbl.elf`n system_wrapper.bit`n app_component.elf`n}" | Set-Content "$out/boot.bif" -Encoding ascii
 foreach($required in @('fsbl.elf','app_component.elf','system_wrapper.bit')){if(!(Test-Path $required)){throw "Missing artifact before packaging: $required"}}
 Run-Stage bootgen "$Tools/Vitis/bin/bootgen.bat" @('-arch','zynq','-image','boot.bif','-o','boot.bin','-w','on')
 $hashes=foreach($name in @('system_wrapper.bit','system_wrapper.xsa','fsbl.elf','app_component.elf','boot.bin')){
 $p=Join-Path $out $name
 if(!(Test-Path $p) -or (Get-Item $p).Length -eq 0){throw "Missing artifact $name"}
 Get-FileHash $p | Select-Object @{n='file';e={$name}},Hash
 }
 $hashes | ConvertTo-Json | Set-Content "$out/manifest.json"
 Write-Host "Build complete: $out"
} finally {Pop-Location;$env:NASA_BUILD_DIR=$previous}
