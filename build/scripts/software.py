import os
import uuid
import json
import sys
from pathlib import Path
import shutil
import vitis
sys.path.insert(0, str(Path(__file__).resolve().parent))
from check_hardware import check
root = Path(__file__).resolve().parents[2]
out = Path(os.environ['NASA_BUILD_DIR']).resolve()
workspace = root / 'work' / ('v' + uuid.uuid4().hex[:8])
comparison = check(root / 'board/system_wrapper.xsa', out / 'system_wrapper.xsa', root / 'board/system_wrapper.bit')
(out / 'reports/hardware_comparison.json').write_text(json.dumps(comparison, indent=2), encoding='utf-8')
client = vitis.create_client()
try:
    client.set_workspace(path=str(workspace))
    platform = client.create_platform_component(name='platform', hw_design=str(out / 'system_wrapper.xsa'), os='standalone', cpu='ps7_cortexa9_0', domain_name='standalone_ps7_cortexa9_0', compiler='gcc')
    domain = platform.get_domain(name='standalone_ps7_cortexa9_0')
    domain.set_lib(lib_name='xilffs')
    domain.set_config(option='lib', param='XILFFS_use_lfn', value='1', lib_name='xilffs')
    platform.build()
    exported = workspace / 'platform/export/platform'
    if not (exported / 'platform.xpfm').is_file():
        raise RuntimeError('Platform build failed')
    app = client.create_app_component(name='app_component', platform=str(exported / 'platform.xpfm'), domain='standalone_ps7_cortexa9_0')
    for source in (root / 'src/ps').iterdir():
        if source.suffix in ('.c', '.h', '.ld'):
            shutil.copy2(source, workspace / 'app_component/src' / source.name)
    app.set_app_config(key='USER_LINK_LIBRARIES', values=['m'])
    app.build()
    for source, name in [(exported / 'sw/boot/fsbl.elf', 'fsbl.elf'), (workspace / 'app_component/build/app_component.elf', 'app_component.elf')]:
        if not source.is_file() or source.stat().st_size == 0:
            raise RuntimeError(f'Missing artifact: {source}')
        shutil.copy2(source, out / name)
finally:
    vitis.dispose()
