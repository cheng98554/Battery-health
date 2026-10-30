# 综合与实现指标

目标器件：xc7z020clg400-2。工具：AMD Vivado/Vitis HLS 2026.1。以下数值取自同一构建的工具报告，报告生成日期为 2026-10-29；它们是综合与实现结果，不是板上测量结果。

## 报告索引

| 文件 | 内容 |
| --- | --- |
| [synthesis/hls.rpt](synthesis/hls.rpt) | LSTM 加速器 HLS 综合：时钟、延迟、调用间隔及资源估算 |
| [synthesis/ip/](synthesis/ip/) | Vivado 各 IP 单独综合的资源报告，包括 LSTM、DMA、FIFO 和 AXI 互连 |
| [implementation/utilization.rpt](implementation/utilization.rpt) | 整工程布线后资源占用 |
| [implementation/timing.rpt](implementation/timing.rpt) | 整工程布线后时钟、时序裕量及关键路径 |
| [implementation/drc.rpt](implementation/drc.rpt) | 实现后的设计规则检查 |

工程采用 IP 独立综合流程；默认顶层综合报告保留 IP 黑盒，不能用其中的零资源数代表整工程。综合阶段请查看各 IP 报告，整工程占用以布线后报告为准。各 IP 的占用不能简单相加替代最终实现结果。

## 整工程资源占用（布线后）

| 资源 | 已用 | 器件可用 | 占用率 |
| --- | ---: | ---: | ---: |
| LUT | 4466 | 53200 | 8.39% |
| FF | 5501 | 106400 | 5.17% |
| Block RAM Tile（36 Kb 等效） | 8 | 140 | 5.71% |
| DSP | 56 | 220 | 25.45% |

BRAM 实际组成是 7 个 RAMB36 和 2 个 RAMB18，即 8 个 36 Kb 等效 Tile。这是整工程 PL 资源统计，包含加速器及相关互连，不是单独 HLS IP 的估算。

## 时钟与时序

| 指标 | 数值 | 含义 |
| --- | ---: | --- |
| PL 时钟 clk_fpga_0 | 100 MHz | 配置时钟频率 |
| 时钟周期 | 10 ns | 对应 100 MHz |
| WNS | 0.227 ns | 最差建立时序裕量 |
| TNS | 0 ns | 建立时序总负裕量 |
| WHS | 0.042 ns | 最差保持时序裕量 |
| THS | 0 ns | 保持时序总负裕量 |
| WPWS | 3.870 ns | 最差脉宽裕量 |

报告显示用户指定的时序约束满足。100 MHz 是本设计使用的时钟，不是搜索得到的最高可运行频率。

## 加速器关键性能指标

| 指标 | 数值 | 统计范围 |
| --- | ---: | --- |
| HLS 顶层 | lstm_axis | 单次加速器调用 |
| 延迟 | 28907 周期 | HLS 综合估算，最小值与最大值相同 |
| 延迟换算 | 0.28907 ms | 28907 × 10 ns |
| 调用间隔 | 28908 周期 | HLS 顶层报告的 Interval |
| 理论调用吞吐率 | 约 3459 次/秒 | 100000000 / 28908，仅按 HLS 调用间隔换算 |
| HLS 估算周期 | 7.268 ns | HLS 内部时序估算，不能替代布局布线结果 |
| HLS DSP / BRAM_18K | 56 / 11 | 加速器资源估算 |
| HLS FF / LUT | 4003 / 3684 | 加速器资源估算 |

延迟和吞吐率不包含 SD 读取、PS 预处理、软件调度、系统传输等待或串口显示时间，不能作为整机端到端实测性能。板上耗时、功耗和 SOH 预测精度需另行测量，本报告不填入推测值。

## 来源与更新

原始构建目录：`work/build_933a316cbff345c6a8586e2430cdc15a/`。实现报告来自其 `reports/`，HLS 报告来自 `hls/solution1/syn/report/`，IP 综合报告来自 `vivado/nasa.runs/*_synth_1/`。

重新构建后，可用新构建的对应报告更新这些文件，并同步本摘要。自动构建只写入 work 输出目录，不自动覆盖本目录。

本目录只保留当前汇总对应的报告；综合报告放在 synthesis/，布线后报告放在 implementation/。
