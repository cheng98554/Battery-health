# 构建完整启动包

环境：Windows PowerShell、AMD Vivado/Vitis 2026.1、xc7z020clg400-2 器件支持及可用许可证。

```powershell
./build/build.ps1 -CheckOnly
./build/build.ps1 -Tools C:/AMDDesignTools/2026.1 -Jobs 4
```

`-CheckOnly` 仅检查工具文件存在，不代表许可证、综合或编译通过。

流程：HLS C 仿真与综合、IP 导出 → Vivado BD 验证、综合、布局布线、bitstream、含 bit 的 XSA → Vitis standalone 平台与 FSBL、启用 xilffs、编译 src/ps 应用 → Bootgen 打包。

每次运行使用新的 `work/build_<id>/`。不会覆盖 board 中现有部署文件，也不连接或下载板卡。日志和时序、资源、DRC 报告位于输出目录的 reports。失败时抛出错误并保留工作目录排查。设置和保持时序存在负裕量时停止，不继续打包。

完整成功后包含：system_wrapper.bit、system_wrapper.xsa、fsbl.elf、app_component.elf、boot.bif、boot.bin 及 SHA256 manifest.json。确认构建与上板测试通过后再更新 board；复制到 SD 卡时使用 BOOT.BIN 文件名。

HLS 脚本通过入口设置的 NASA_BUILD_DIR 获取输出目录，请使用 build.ps1 入口。软件构建通过同次生成的 XSA 创建全新平台，不依赖原桌面工程或旧 BSP。

build/reports 中原有报告是历史构建记录，新流程报告保存在本次 work 输出目录，不能混为一次构建结果。

Vitis 中间工作区使用 work/v<id> 短路径，避免 Windows 工具的路径长度限制；最终产物仍汇总到本次 build 输出目录。

## 本次验证（2026-10-29）

HLS C 仿真 423 组通过，IP 导出、整工程综合、布局布线、bitstream 和 XSA 导出成功。WNS=0.227 ns，WHS=0.042 ns，bitstream 前 DRC 为 0 错误。Vitis 首次因 Windows 长路径失败，修复为短工作目录后复用本次 XSA 重试，FSBL、应用 ELF 编译及 Bootgen 打包均成功。未在修复后再次从头重复硬件综合；未进行上板验证。

本次产物：`work/build_933a316cbff345c6a8586e2430cdc15a/`。`manifest.json` 保存五项产物的 SHA256。该目录被 Git 忽略，board 中现有文件未被替换。
