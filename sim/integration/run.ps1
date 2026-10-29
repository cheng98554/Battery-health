$ErrorActionPreference = 'Stop'
$integrationRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '../..')).Path
Push-Location $integrationRoot
try {
    New-Item -ItemType Directory -Path 'work/tmp' -Force | Out-Null
    & 'C:/AMDDesignTools/2026.1/tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe' -std=c11 -O2 -Wall -Wextra -Werror -I sim/integration/stubs sim/integration/test_integration.c -lm -o work/tmp/test_integration.exe
    if ($LASTEXITCODE -ne 0) { throw 'Integration test compilation failed' }
    & './work/tmp/test_integration.exe'
    if ($LASTEXITCODE -ne 0) { throw 'Integration test failed' }
} finally {
    Pop-Location
}
