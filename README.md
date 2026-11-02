# 基于 Zynq 的电池健康度估算系统

本项目将电池采集、SD 存储、LSTM 推理和串口屏显示集成到 Zynq-7020 平台，实现电池健康度（SOH）估算。PS 端运行裸机程序，负责 INA226 采集、数据预处理和 DMA 调度；PL 端运行 Q12 定点 LSTM 加速器。

支持读取已有电压、电流数据进行单文件或批量推理，也支持采集实际电池数据后再推理。输入文件为 4000 行 `电压V#电流A`，预处理后形成 100 个时间步、每步 2 个特征。

## 目录结构

| 路径 | 内容 |
| --- | --- |
| [src/](src/) | 最终版源码：`ps/` 裸机应用、`hls/` 加速器、`hardware/` 硬件工程、`uart_screen/` 屏幕工程 |
| [src/sd/](src/sd/) | **上板使用的 SD 测试 TXT 文件** |
| [sim/](sim/) | IIC 与协议、SD、推理集成主机测试 |
| [build/](build/README.md) | 构建脚本、运行说明及综合与实现报告 |
| [board/](board/sd_usage.md) | 基准 XSA、bit、FSBL、应用 ELF、启动镜像及上板说明 |
| [data/](data/) | NASA 数据、实采数据与结果对比；`nasa_sd/nasa_data.xlsx` 为预测及耗时对比表 |
| [skill/](skill/README.md) | 技能包、适用范围、使用方法及验证边界 |
| [report/](report/) | 设计报告 |
| `work/` | 构建产物、日志及临时文件，运行时生成，不纳入 Git |

## 复现步骤

以下命令均在**仓库根目录**执行。建议将完整仓库放在较短的英文路径，例如 `C:/work/Battery-health`。

### 1. 准备环境

- Windows PowerShell。
- AMD Vivado/Vitis **2026.1**，安装 Zynq-7000 器件支持及可用许可证；默认路径为 `C:/AMDDesignTools/2026.1`。
- 与工程约束匹配的 Zynq 开发板，目标器件 **xc7z020clg400-2**。
- 板卡支持的 FAT32 SD 卡、读卡器及电源。
- INA226 采集电路、TJC4832T135_011C_A01 串口屏；屏幕工程使用 USART HMI 单独部署。

### 2. 检查与构建

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\build\build.ps1 -CheckOnly
.\build\build.ps1 -Tools C:/AMDDesignTools/2026.1 -Jobs 4
```

执行策略仅对当前窗口生效。`-CheckOnly` 检查工具与 `board/` 硬件基准文件是否存在，不执行构建。完整构建依次完成 HLS、Vivado、Vitis 和 Bootgen，生成启动镜像。

只修改 PS 软件时，可复用 `board/` 的 XSA 和 bit，重新编译 FSBL 与应用：

```powershell
.\build\build.ps1 -SoftwareOnly -Tools C:/AMDDesignTools/2026.1
```

修改 HLS、Block Design 或引脚约束后应执行完整构建。工具安装位置不同，调整 `-Tools` 参数。详细说明见 [build/README.md](build/README.md)。

### 3. 准备 SD 卡与屏幕

1. 从本次成功构建的 `work/build_<id>/` 取出 `boot.bin`，复制到 SD 卡根目录并命名为 **`BOOT.BIN`**。
2. 将 **`src/sd/` 中的 TXT 文件**直接复制到 SD 卡根目录，不复制外层 `sd` 文件夹。批量运行需要 `100.txt`～`265.txt`。
3. 使用 USART HMI 打开 `src/uart_screen/test.HMI`，检查 `song.zi` 字体资源并编译、下载至屏幕。屏幕工程不包含在 `BOOT.BIN` 中。
4. 屏幕通信设为 **115200、8N1**；对象 `n0/n1/n2` 显示电压、电流和点数，`t0` 显示状态，`x1` 显示 SOH（两位小数），`s0` 显示批量波形。

### 4. 接线与启动

断电后接线并插卡，按所用开发板手册设置 SD 启动模式，再上电。

| 接口 | 主控管脚/连接要求 |
| --- | --- |
| INA226 I²C | SCL → Y7，SDA → U5；3.3 V 逻辑，地址 `0x40` |
| TJC UART | 屏幕 RX → T5，屏幕 TX → Y6；双方共地 |
| TJC 电源 | 5 V 供电，通信电平为 3.3 V TTL |

I²C0 与 UART0 通过 EMIO 引出，本工程不使用 MIO14/15 通信。换板卡时需先核对硬件设计和引脚约束。

### 5. 运行功能

通过屏幕按钮或串口工具发送以下**二进制十六进制字节**，不发送 ASCII 文本，不加回车。帧格式为 `FE 命令 编号低字节 编号高字节 FD`。

| 命令 | 功能与预期 |
| --- | --- |
| `FE 22 01 00 FD` | 读取 `1.txt` 推理；配套样本参考输出为 SOH 93.63% |
| `FE 23 00 00 FD` | 顺序读取 `100.txt`～`265.txt`，显示批量波形 |
| `FE 21 E8 03 FD` | 以编号 1000 等待电流触发采集；须确认同名文件不存在 |
| `FE 22 E8 03 FD` | 采集完成后读取 `1000.txt` 推理 |

采集以拟合后的有符号电流 **>1.6 A** 为启动条件，连续 **8 个有效点 ≤−0.7 A** 时停止；正常采样间隔约 1100 ms。完成后保存原始记录 `1000.raw`，并生成重采样至 4000 点的 `1000.txt`，状态显示 `done`。

推理结果通过 `x1` 显示，需结合 `t0` 判断本次操作是否成功；失败时可能保留上一次结果。接线、文件格式、状态码和故障排查详见 [board/sd_usage.md](board/sd_usage.md)。SD 部署数据以本页的 `src/sd/` 路径为准。

## 输出位置

| 输出位置 | 内容 |
| --- | --- |
| `work/build_<id>/` | 本次 `system_wrapper.bit`、`system_wrapper.xsa`、`fsbl.elf`、`app_component.elf`、`boot.bif`、`boot.bin` 和 `manifest.json` |
| `work/build_<id>/reports/` | 阶段日志；完整构建还包含资源、时序和 DRC 报告 |
| `work/v<id>/` | Vitis 中间工程 |
| SD 卡根目录 | 采集生成的 `<编号>.raw` 与 `<编号>.txt` |

每次构建创建独立目录，不覆盖 `board/`，也不自动下载板卡或写入 SD 卡。构建失败时查看本次 `reports/`；仓库 [build/reports/](build/reports/README.md) 中的归档报告不会自动更新。

## 可选的主机检查

两项测试分别执行，结果输出到终端：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\sim\integration\run.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\sim\i2c\run.ps1
```

脚本默认使用 `C:/AMDDesignTools/2026.1/tps/mingw/10.0.0/win64.o/nt/bin/gcc.exe`；路径不同需修改对应脚本。测试程序生成于 `work/tmp/`。主机测试采用模拟硬件接口，不替代上板验证。
