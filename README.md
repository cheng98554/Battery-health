# NASA 电池健康度估算

基于 Zynq-7000 与 LSTM 的电池健康度（SOH）估算工程。PS 端负责 INA226 数据采集、SD 文件读写、输入预处理、DMA 调度及串口屏控制，PL 端运行 HLS 实现的 LSTM 推理加速器。

支持两种使用方式：读取 SD 卡上的电压、电流序列进行推理，或先采集实际电池数据，再对采集文件进行推理。

## 目录结构

| 目录 | 内容 |
| --- | --- |
| `src/hls/` | 最终版 HLS 源码、模型权重、测试向量及 HLS 构建脚本 |
| `src/ps/` | Cortex-A9 裸机应用源码和链接脚本 |
| `src/hardware/` | Vivado Block Design 与引脚约束 |
| `src/uart_screen/` | TJC 串口屏工程及资源 |
| `sim/` | I2C、串口协议、SD 处理和推理集成测试 |
| `build/` | 完整构建入口、Vivado/Vitis 脚本及说明 |
| `board/` | 部署文件和 SD 启动、采集、推理操作说明 |
| `data/NASA_SD/` | NASA 测试数据 |
| `data/real_SD/` | 实测数据 |
| `report/` | 项目设计相关说明 |
| `work/` | 自动生成的工程、中间文件、日志和启动包，不纳入 Git |

## 环境要求

### 开发电脑

- Windows，使用 PowerShell 执行仓库中的 `.ps1` 脚本。
- AMD Vivado/Vitis **2026.1**，安装 Zynq-7000 器件支持，具备综合和实现所需的可用许可证。
- 目标器件为 **xc7z020clg400-2**，PS 使用 `ps7_cortexa9_0`，运行 standalone 裸机程序。
- 安装内容需包含 `vitis-run.bat`、`vivado.bat`、`vitis.bat` 和 `bootgen.bat`。默认安装根目录为 `C:/AMDDesignTools/2026.1`，可通过 `-Tools` 指定其他位置。
- Vitis Python 脚本由 Vitis 自带环境执行，无需给系统 Python 单独安装 `vitis` 包。平台构建时启用 `xilffs` 文件系统库。
- 仓库建议放在较短的英文路径下，例如 `C:/projects/battery-health`，减少 Windows 工具的路径长度问题。为 HLS、Vivado 和 Vitis 中间文件预留磁盘空间。

### 上板设备

- 与仓库硬件设计及引脚约束匹配的 Zynq 开发板。
- 支持 FAT32 的 SD 卡、读卡器及板卡电源。
- 使用采集功能时连接 INA226；交互使用 TJC 串口屏或串口收发工具，串口参数为 **115200、8N1**。
- I2C、UART 引脚及屏幕对象配置见 [上板使用说明](board/sd_usage.md)。不同板卡需先调整硬件设计和约束，再重新构建。

## 构建方法

以下命令在仓库根目录执行。

### 1. 检查工具路径

```powershell
./build/build.ps1 -Tools C:/AMDDesignTools/2026.1 -CheckOnly
```

`-CheckOnly` 仅检查所需工具文件是否存在，不执行综合、编译或下载。

### 2. 构建完整启动包

```powershell
./build/build.ps1 -Tools C:/AMDDesignTools/2026.1 -Jobs 4
```

| 参数 | 默认值 | 含义 |
| --- | --- | --- |
| `-Tools` | `C:/AMDDesignTools/2026.1` | AMD 工具安装根目录 |
| `-Jobs` | `4` | Vivado 运行并行任务数，范围 1～64，可按电脑资源调整 |
| `-CheckOnly` | 不启用 | 仅检查工具路径 |

构建依次执行：

1. HLS C 仿真、综合和 IP 导出。
2. 创建 Vivado 工程，导入 Block Design 与约束，执行综合、布局布线和 bitstream 生成。
3. 导出时序、资源、DRC 报告，检查建立与保持时序，再导出包含 bitstream 的 XSA。
4. 使用同次 XSA 创建 Vitis 平台，生成 FSBL，编译 `src/ps/` 应用。
5. 通过 Bootgen 打包 `boot.bin`，生成产物 SHA256 清单。

请通过 `build.ps1` 入口运行，入口负责设置各阶段使用的输出目录。构建成功时终端打印 `Build complete: <输出目录>`；失败时保留工作目录和日志，按报错定位对应阶段。

## 输出位置

每次构建创建独立的 `work/build_<id>/`，不覆盖已有构建或 `board/` 文件。

```text
work/build_<id>/
├── hls/                  HLS 工程及生成的 IP
├── vivado/               Vivado 工程及综合、实现中间文件
├── lstm_ip.zip           HLS IP 导出包
├── system_wrapper.bit    FPGA 配置文件
├── system_wrapper.xsa    包含 bitstream 的硬件平台
├── fsbl.elf              第一阶段启动程序
├── app_component.elf     PS 应用程序
├── boot.bif              本次启动镜像打包配置
├── boot.bin              SD 启动镜像
├── manifest.json         五项主要产物的 SHA256 校验值
└── reports/
    ├── hls.log           HLS 阶段日志
    ├── vivado.log        Vivado 阶段日志
    ├── software.log      Vitis 阶段日志
    ├── bootgen.log       镜像打包日志
    ├── timing.rpt        时序报告
    ├── utilization.rpt   资源利用率报告
    └── drc.rpt           设计规则检查报告
```

Vitis 中间工作区单独位于 `work/v<id>/`，用于缩短路径；生成的 FSBL 和应用 ELF 会复制到本次 `work/build_<id>/`。`build/reports/` 中已保存的报告不会被本次构建更新，应查看本次输出目录的 `reports/`。

## 板上运行

1. 使用本次构建输出的 `boot.bin`，复制到 FAT32 SD 卡根目录，并在卡上命名为 **`BOOT.BIN`**。也可使用已准备好的 `board/flash/boot.bin`，注意选择与所需程序版本对应的镜像。
2. 将所需 `data/NASA_SD/` 下的 TXT 文件直接复制到卡根目录，例如 `1.txt`、`167.txt`。程序读取 `0:/<编号>.txt`，不读取外层目录。
3. 按板卡手册设置 SD 启动模式，断电插卡、连接外设后上电。
4. 通过屏幕按钮或串口工具发送二进制十六进制命令，不能发送对应的 ASCII 字符串。

| 命令 | 操作 |
| --- | --- |
| `FE 22 01 00 FD` | 读取 `1.txt` 并推理 |
| `FE 22 A7 00 FD` | 读取 `167.txt` 并推理 |
| `FE 21 E8 03 FD` | 使用编号 1000 等待电流触发采集；同名文件不覆盖 |
| `FE 22 E8 03 FD` | 采集完成后读取 `1000.txt` 并推理 |

帧格式为 `FE 命令 编号低字节 编号高字节 FD`，编号范围 0～65535。推理输入要求恰好 4000 行，每行格式为 `电压V#电流A`。SOH 通过屏幕对象 `x1` 显示，`t0` 显示操作状态；结合状态判断本次推理是否完成。

采集触发、停止条件、重采样、接线、屏幕配置及故障排查详见 [board/sd_usage.md](board/sd_usage.md)。构建脚本仅生成文件，不自动下载板卡或操作 SD 卡。

## 主机测试运行方法

无需连接开发板，可执行模拟硬件接口的主机测试：

```powershell
./sim/i2c/run.ps1
./sim/integration/run.ps1
```

两个脚本目前固定使用以下 GCC 路径；安装位置不同时，需修改对应 `run.ps1` 中的编译器路径，构建入口的 `-Tools` 参数不会影响它们：

```text
C:/AMDDesignTools/2026.1/tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe
```

测试结果打印到终端，可执行文件分别生成于 `work/tmp/test_i2c.exe` 和 `work/tmp/test_integration.exe`。集成测试读取 `data/NASA_SD/` 中的样本文件；这些主机测试不需要启动板卡。
