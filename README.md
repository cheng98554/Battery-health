# NASA 电池健康度估算

基于 Zynq xc7z020clg400-2 的 LSTM SOH 推理工程，包含 PS 端 I2C 采集、SD 文本读取、DMA 调度及 HLS 加速器。

## 目录

- src/hls：最终版 HLS 源码、权重、测试向量和构建脚本；仓库仅保留此实现。
- src/ps：Vitis 裸机应用源码。
- src/hardware：Vivado block design 和引脚约束。
- sim：I2C 和集成验证脚本及桩实现。
- build：重建脚本与原工程综合、实现报告。
- board：SD 使用说明和原工程已有 ELF。
- data：SD 测试数据、串口样本、参考结果及验证记录。
- report：原工程设计记录及文件重命名对照。

暂不包含 skill。README.md 和 LICENSE 沿用仓库惯例，其余文件名使用英文；中文图表文件已改为 reference 编号，见 report/filename_mapping.txt。

## 复现

使用 AMD Vivado/Vitis 2026.1（原工程版本），在仓库根目录执行：

```powershell
./sim/i2c/run.ps1
./sim/integration/run.ps1
./build/build.ps1 -Tools C:/AMDDesignTools/2026.1
```

前两项使用该安装目录附带的 GCC。构建脚本先生成优化 HLS IP，再从 system.bd 创建 Vivado 工程并运行综合、布局布线；输出工程位于 work/vivado。需要安装对应器件支持。

上板：在 Vivado 中生成 bitstream 并导出包含 bitstream 的 XSA；使用 Vitis 创建 standalone Cortex-A9 平台，启用 xilffs，建立应用并导入 src/ps 的源文件，生成 FSBL 和应用，然后打包启动镜像。SD 文件见 data/sd_card，协议及接线说明见 board/sd_usage.md。

board 中 ELF 和 build/reports、data 中验证结果来自原工程，不能视为此次重新构建或上板验证的结果。此次整理未执行完整 HLS/Vivado 构建或硬件验证。历史记录中的桌面绝对路径和旧目录仅供追溯，以本 README 的目录为准。

源工程的 IDE 缓存、临时 Python 依赖、历史备份和生成的中间文件未纳入仓库。保留源工程不变。

本次整理验证：I2C 主机测试、集成测试全部通过（硬件接口使用模拟桩），包括 SD 样本 1、167 的预处理及 HLS C 模型输出校验。

