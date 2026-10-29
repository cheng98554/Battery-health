param([string]$Tools='C:/AMDDesignTools/2026.1')
$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
& "$Tools/Vitis/bin/vitis-run.bat" --mode hls --tcl "$root/src/hls_fast/build.tcl"
if ($LASTEXITCODE -ne 0) {throw 'HLS failed'}
& "$Tools/Vivado/bin/vivado.bat" -mode batch -source "$PSScriptRoot/rebuild.tcl"
if ($LASTEXITCODE -ne 0) {throw 'Vivado failed'}
