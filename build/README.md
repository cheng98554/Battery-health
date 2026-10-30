# 构建说明

本目录提供从 HLS、硬件设计和 PS 源码生成 Zynq SD 启动镜像的自动构建流程。统一入口为 `build.ps1`。


```text
build/
├── README.md             使用说明
├── build.ps1             唯一构建入口
├── scripts/              内部辅助脚本
│   ├── rebuild.tcl       Vivado 硬件构建
│   ├── software.py       Vitis 软件构建
│   └── check_hardware.py 硬件基准检查
└── reports/              综合与实现报告
    ├── README.md         资源、频率及性能摘要
    ├── synthesis/        HLS 与各 IP 综合报告
    └── implementation/   资源、时序与 DRC 报告
```
## 文件说明

| 文件 | 用途 |
| --- | --- |
| `build.ps1` | 检查工具路径、创建输出目录、依次运行构建阶段并生成 SHA256 清单 |
| `scripts/rebuild.tcl` | 创建 Vivado 工程，执行综合、布局布线、bitstream 生成、时序检查和 XSA 导出 |
| `scripts/software.py` | 根据新 XSA 创建 Vitis 平台，启用 xilffs，生成 FSBL 并编译 PS 应用 |
| `reports/` | 仓库已有报告；自动构建的新报告写入本次输出目录 |

HLS 构建脚本位于 [`../src/hls/build.tcl`](../src/hls/build.tcl)，由总入口调用。

## 环境要求

- Windows 与 PowerShell。
- AMD Vivado/Vitis **2026.1**，安装 **xc7z020clg400-2** 所需的 Zynq-7000 器件支持，并具备可用的综合、实现许可证。
- 安装目录中包含下列工具：

```text
<工具根目录>/Vitis/bin/vitis-run.bat
<工具根目录>/Vivado/bin/vivado.bat
<工具根目录>/Vitis/bin/vitis.bat
<工具根目录>/Vitis/bin/bootgen.bat
```

默认工具根目录为 `C:/AMDDesignTools/2026.1`。使用其他安装位置时通过 `-Tools` 指定。

`scripts/software.py` 使用 Vitis 自带 Python 环境和 API，不使用系统 Python。软件平台为 `ps7_cortexa9_0` 上的 standalone，脚本自动启用 `xilffs` 并配置长文件名支持。

将仓库放在较短的英文路径下，例如 `C:/projects/battery-health`，减少 Windows 工具的路径长度问题；为生成的 HLS、Vivado 和 Vitis 工程预留磁盘空间。构建过程不需要连接开发板。

## 运行方法

以下命令均在**仓库根目录**执行。

### 检查工具路径

```powershell
./build/build.ps1 -Tools C:/AMDDesignTools/2026.1 -CheckOnly
```

此命令仅检查四个工具文件是否存在，不检查许可证，也不执行仿真、综合或编译。

### 构建完整启动包

```powershell
./build/build.ps1 -Tools C:/AMDDesignTools/2026.1 -Jobs 4
```

使用默认参数时可简写为：

```powershell
./build/build.ps1
```

如果终端当前位于 `build/`，使用 `./build.ps1` 调用即可，脚本会自动定位仓库根目录。

| 参数 | 默认值 | 含义 |
| --- | --- | --- |
| `-Tools` | `C:/AMDDesignTools/2026.1` | AMD 工具安装根目录 |
| `-Jobs` | `4` | Vivado 并行任务数，允许 1～64，按电脑资源调整 |
| `-CheckOnly` | 不启用 | 仅检查工具路径后退出 |

总入口设置环境变量 `NASA_BUILD_DIR`，供 HLS 和 Vitis 阶段获取本次输出目录，结束后恢复原值。正常使用时无需手动设置，也无需分别运行子脚本。

## 构建流程

1. **HLS**：使用 `src/hls/` 中的源码和测试向量运行 C 仿真、综合，导出 LSTM 加速器 IP。
2. **Vivado**：创建目标器件工程，导入 `src/hardware/system.bd` 的副本并添加 `n.xdc`，生成顶层封装，运行综合、布局布线和 bitstream 生成。
3. **硬件导出**：输出时序、资源和 DRC 报告；建立或保持时序裕量为负、或找不到时序路径时停止。检查通过后汇总 bitstream，并导出包含 bitstream 的 XSA。
4. **Vitis**：从同次 XSA 创建新平台及 BSP，生成 FSBL，将 `src/ps/` 的 C、头文件和链接脚本复制到新应用并编译。
5. **Bootgen**：按 FSBL → bitstream → 应用 ELF 的顺序打包启动镜像，检查主要产物非空并生成 SHA256 清单。

构建不依赖原桌面工程或旧 BSP，不会自动覆盖 `board/`、写入 SD 卡或下载开发板。

## 输出位置

每次运行都会创建新的 `work/build_<id>/`。成功时终端显示：

```text
Build complete: <本次输出目录>
```

主要输出如下：

```text
work/build_<id>/
├── hls/                  HLS 工程；IP 位于 solution1/impl/ip/
├── vivado/               Vivado 工程及综合、实现中间文件
├── lstm_ip.zip           导出的 HLS IP 包
├── system_wrapper.bit    FPGA 配置文件
├── system_wrapper.xsa    包含 bitstream 的硬件平台
├── fsbl.elf              第一阶段启动程序
├── app_component.elf     PS 应用程序
├── boot.bif              本次打包配置，引用同目录的三个输入文件
├── boot.bin              SD 启动镜像
├── manifest.json         bit、XSA、两个 ELF 和 boot.bin 的 SHA256
└── reports/
    ├── hls.log           HLS 日志
    ├── vivado.log        Vivado 日志
    ├── software.log      Vitis 软件构建日志
    ├── bootgen.log       Bootgen 日志
    ├── timing.rpt        时序报告
    ├── utilization.rpt   资源利用率报告
    └── drc.rpt           设计规则检查报告
```

Vitis 工作区单独生成于 `work/v<id>/`，用于缩短路径；其中保留平台、BSP、FSBL 和应用工程，最终 ELF 会汇总到本次 `work/build_<id>/`。整个 `work/` 目录不纳入 Git。

`build/reports/` 与上述输出目录不是同一位置，查看本次构建结果时应使用 `work/build_<id>/reports/`。

## 使用构建结果

将本次输出的 `boot.bin` 复制到 FAT32 SD 卡根目录，在卡上命名为 `BOOT.BIN`，再准备测试 TXT 文件并按板卡要求设置启动模式。完整操作见 [`../board/sd_usage.md`](../board/sd_usage.md)。

需要更新仓库部署文件时，应从同一次构建中选取 FSBL、bitstream、应用 ELF 和启动镜像，保持版本配套。

## 构建失败排查

| 错误或阶段 | 检查方法 |
| --- | --- |
| `Missing ...` | 检查 `-Tools` 指定目录及工具安装内容 |
| HLS 失败或 `HLS IP export missing` | 查看 `reports/hls.log`，检查 C 仿真、综合及 IP 导出错误 |
| Vivado 失败或 `Vivado XSA export missing` | 查看 `reports/vivado.log`；进一步查看 `vivado/nasa.runs/` 中对应运行的 `runme.log` |
| `Timing failed` | 查看 `reports/timing.rpt`，处理时序问题后重新构建 |
| 软件编译失败 | 查看 `reports/software.log`，检查 BSP、头文件、链接和文件路径错误 |
| 打包前缺少 ELF 或 bit | 先处理硬件或软件阶段错误，不要混入其他构建的文件继续打包 |
| Bootgen 失败 | 查看 `reports/bootgen.log`，检查 `boot.bif` 及其引用的文件 |
| 路径过长或临时依赖文件无法创建 | 将仓库移至更短的英文路径后重新运行 |

失败后保留工作目录便于排查。重新执行入口会创建新的构建目录，从头运行，不会自动续接失败阶段。

## 综合与实现报告

资源占用、时钟频率与关键性能指标见 [reports/README.md](reports/README.md)。其中包含各 IP 综合报告、整工程布线后资源和时序报告，以及 HLS 加速器延迟、调用间隔与资源估算；各类统计的范围在摘要中分别注明。

## 与 board 基准保持一致

硬件基准为 `board/system_wrapper.xsa`，来自指定的原 NASA 工程 XSA。脚本仍从 HLS、BD 和 PS 源码构建，不复制 board 的 ELF 作为构建输出。

在软件构建前，`scripts/check_hardware.py` 检查：基准 XSA 内 bitstream 与 board/system_wrapper.bit 字节一致；重建 XSA 的 ps7_init.c/h/tcl 与基准一致；硬件交接文件中的参数及连接一致。仅忽略时间戳、IP 修订号、自动生成组件名，以及未使用 MIO14/15 的方向、电平、上拉、转换速率描述。其余差异会停止软件构建。比较摘要写入本次 reports/hardware_comparison.json。

应用继续使用原工程的 -O0/-g3 默认配置，显式链接库与原工程对齐为 m；xilffs 和 xiltimer 由生成的平台 CMake 引入。配置比对不等同于 PL 逻辑形式等价证明或实体板卡测试；生成文件可以因路径、时间戳及布局布线变化而与 board 的 SHA256 不同。
