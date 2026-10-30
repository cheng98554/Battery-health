"""Compare rebuilt hardware against the board's authoritative XSA."""
from pathlib import Path
import hashlib
import json
import zipfile
import xml.etree.ElementTree as ET

# These pins are not used by this board design. All other hardware parameters
# and connectivity remain part of the comparison.
UNUSED_MIO = {'PCW_MIO_%d_%s' % (pin, field) for pin in (14, 15)
              for field in ('DIRECTION', 'IOTYPE', 'PULLUP', 'SLEW')}

def canonical(element):
    if element.tag == 'PARAMETER' and element.get('NAME') in UNUSED_MIO | {'Component_Name'}:
        return None
    attrs = tuple(sorted((k, v) for k, v in element.attrib.items()
                         if k not in ('TIMESTAMP', 'COREREVISION')))
    children = [canonical(c) for c in element]
    return (element.tag, attrs, (element.text or '').strip(),
            tuple(c for c in children if c is not None))

def check(reference, rebuilt, board_bit):
    checks = []
    with zipfile.ZipFile(reference) as a, zipfile.ZipFile(rebuilt) as b:
        bits = [n for n in a.namelist() if n.endswith('.bit')]
        if len(bits) != 1 or a.read(bits[0]) != Path(board_bit).read_bytes():
            raise RuntimeError('Reference XSA bitstream does not match board/system_wrapper.bit')
        checks.append('reference bitstream matches board')
        for name in ('ps7_init.c', 'ps7_init.h', 'ps7_init.tcl'):
            if a.read(name) != b.read(name):
                raise RuntimeError('PS initialization mismatch: ' + name)
            checks.append(name + ': identical')
        for name in ('system.hwh', 'system_axi_smc_0.hwh'):
            if canonical(ET.fromstring(a.read(name))) != canonical(ET.fromstring(b.read(name))):
                raise RuntimeError('Hardware configuration mismatch: ' + name)
            checks.append(name + ': equivalent under documented normalization')
    return {'reference_sha256': hashlib.sha256(Path(reference).read_bytes()).hexdigest(),
            'checks': checks, 'ignored': ['TIMESTAMP', 'COREREVISION', 'Component_Name'] + sorted(UNUSED_MIO),
            'scope': 'Hardware handoff and PS initialization checks; not PL formal equivalence or board testing'}

if __name__ == '__main__':
    import sys
    result = check(*sys.argv[1:4])
    print(json.dumps(result, indent=2))
