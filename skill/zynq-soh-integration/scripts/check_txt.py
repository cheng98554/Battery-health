"""Read-only V#I TXT validation; exits 1 on any failure."""
import argparse
import hashlib
import math
from pathlib import Path


def check(path, rows, reference=None):
    data = path.read_bytes()
    lines = data.decode('utf-8-sig').splitlines()
    count = 0
    for n, line in enumerate(lines, 1):
        if not line.strip():
            continue
        fields = line.split('#')
        if len(fields) != 2:
            raise ValueError(f'line {n}: expected voltage#current')
        values = [float(x) for x in fields]
        if not all(math.isfinite(x) for x in values):
            raise ValueError(f'line {n}: non-finite value')
        count += 1
    if count != rows:
        raise ValueError(f'expected {rows} points, got {count}')
    if reference and data != (reference / path.name).read_bytes():
        raise ValueError('reference bytes differ')
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('path', type=Path)
    parser.add_argument('--rows', type=int, default=4000)
    parser.add_argument('--reference', type=Path)
    args = parser.parse_args()
    if args.rows <= 0:
        parser.error('--rows must be positive')
    paths = sorted(args.path.glob('*.txt')) if args.path.is_dir() else [args.path]
    if not paths:
        parser.error('no TXT files')
    failed = 0
    for path in paths:
        try:
            digest = check(path, args.rows, args.reference)
            print(f'PASS {path.name} {digest}')
        except (OSError, ValueError, UnicodeError) as error:
            failed += 1
            print(f'FAIL {path.name}: {error}')
    print(f'{len(paths)-failed} passed, {failed} failed; no files modified')
    return int(failed != 0)


if __name__ == '__main__':
    raise SystemExit(main())
