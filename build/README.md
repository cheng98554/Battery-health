# 构建说明

从当前 `src/` 源码生成启动包，以 `board/system_wrapper.xsa` 和 `board/system_wrapper.bit` 为硬件基准。

## 环境要求

- Windows PowerShell。
- AMD Vivado/Vitis **2026.1**，包含 Zynq-7000 器件支持及可用许可证。
- 目标器件：**xc7z020clg400-2**。
- 默认工具目录：`C:/AMDDesignTools/2026.1`；仓库建议使用较短的英文路径。

## 运行方法

在 **build 文件夹**中打开 PowerShell。

首次运行或提示禁止运行脚本时，执行：

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\build.ps1 -CheckOnly
```

如需确认，输入 `Y`。执行策略仅对当前窗口生效。`-CheckOnly` 检查工具及硬件基准文件是否存在，不执行构建。

**完整构建**：HLS → Vivado bit/XSA → FSBL、PS 应用 → 启动镜像。

```powershell
.\build.ps1 -Tools C:/AMDDesignTools/2026.1 -Jobs 4
```

**仅更新软件**：复用 board 的 XSA/bit，重新编译 FSBL 和当前 PS 源码，再打包。

```powershell
.\build.ps1 -SoftwareOnly
```

修改 HLS、BD 或引脚约束后，使用完整构建。工具安装位置不同时，为命令添加 `-Tools <安装根目录>`。从仓库根目录运行时，将 `.\build.ps1` 改为 `.\build\build.ps1`。

## 输出位置

每次构建生成独立的 `work/build_<id>/`，成功后终端打印具体路径。

| 输出 | 用途 |
| --- | --- |
| `system_wrapper.bit` / `system_wrapper.xsa` | FPGA 配置与硬件平台 |
| `fsbl.elf` / `app_component.elf` | 启动程序与 PS 应用 |
| `boot.bif` / `boot.bin` | 打包配置与启动镜像 |
| `manifest.json` | 主要产物的 SHA256 |
| `reports/` | 阶段日志、硬件基准比较与源码哈希；完整构建另含时序、资源及 DRC 报告 |

Vitis 中间工程位于 `work/v<id>/`；完整构建的 HLS、Vivado 工程位于本次输出目录。失败时查看对应阶段日志，重新运行会创建新目录，从头执行。

## 目录与注意事项

- `build.ps1`：统一入口；`scripts/`：内部辅助脚本。
- [reports/README.md](reports/README.md)：仓库保存的资源、时钟和性能摘要。新构建报告在 `work/`，不会自动覆盖这里。
- 构建前后不覆盖 `board/`，不自动下载板卡。输出文件可能因路径、时间戳或布局布线不同而与 board 的哈希不同。
- 软件阶段检查 XSA 的 PS 初始化及硬件配置；仅忽略生成元数据和未使用 MIO14/15 的指定描述。检查不能代替上板测试。
- `src/uart_screen/` 需通过串口屏工具单独编译、部署，不包含在 `boot.bin` 中。
- 上板时将同次构建的 `boot.bin` 复制到 SD 卡根目录，命名为 `BOOT.BIN`。详见 [上板说明](../board/sd_usage.md)。
