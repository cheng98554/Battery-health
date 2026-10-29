$ErrorActionPreference = 'Stop'
$iicRoot = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
Push-Location $iicRoot
try {
    New-Item -ItemType Directory -Force work/tmp | Out-Null
    # Use register definitions from this project's real BSP.
    Get-Content sim/i2c/xiicps_hw.h |
        Where-Object { $_ -match '^#define XIICPS_\w+\s+0x[0-9A-Fa-f]+U' } |
        ForEach-Object { ($_ -split '/\*')[0] } | Set-Content work/tmp/iic_registers.h
    & 'C:/AMDDesignTools/2026.1/tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe' -std=c11 -O2 -Wall -Wextra -Werror -I sim/i2c/stubs -I work/tmp sim/i2c/test_i2c.c -o work/tmp/test_i2c.exe
    if ($LASTEXITCODE -ne 0) { throw 'IIC test compilation failed' }
    & './work/tmp/test_i2c.exe'
    if ($LASTEXITCODE -ne 0) { throw 'IIC tests failed' }
} finally { Pop-Location }
