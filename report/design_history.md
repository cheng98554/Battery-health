# LSTM FPGA 计算加速版

当前已整合I2C采集与SD推理：FE 21 低字节 高字节 FD采集4000点；FE 22 低字节 高字节 FD读取0:/编号.txt推理。
结果通过TJC屏幕输出：x1.val=SOH百分数×100，x2.val=容量Ah×1000，四舍五入为整数。
使用说明与文件下载见outputs/SD使用说明.md；本页其余部分记录此前加速实现。

工程：C:/Users/33827/Desktop/nasa/nasa.xpr；器件 xc7z020clg400-2；时钟100 MHz。

## 结果

原版HLS延迟239406周期（2.39406 ms），优化版28907周期（0.28907 ms），估算加速8.28194倍。
该数字是PL计算延迟比较，不包含PS预处理、DMA软件调度和串口发送时间，尚非板上计时。

HLS资源：DSP 25→56，BRAM18K 13→11，FF 1627→4003，LUT 2521→3684。
这些是加速IP的HLS估算，不是整个SoC的利用率。

423组C仿真逐位通过；8组代表输入各调用两次，共16次RTL协同仿真通过。
权重与Q12舍入、截断、激活查表、状态重置规则保持一致。
优化：16路循环乘法并行、平衡加法树、权重/状态存储分区、门循环流水线、输入拷贝流水线。

Vivado工程已接入优化IP；BD验证、整工程综合、布局布线通过。
100 MHz时钟约束满足，WNS=0.103ns，WHS=0.045ns。
实际布局布线时序优先于HLS估算频率；不要把HLS估算Fmax当作可直接使用的频率。

按用户要求，没有生成新的bit、XSA或BOOT.BIN，没有下载或验证板卡。
上板由用户执行；需要自行基于该工程生成和下载新bit，现有板上仍可能运行旧版本。

## 接口与使用

当前实例名lstm_axis_0，控制地址0x43C00000；DMA与PS预处理通路保持原接口。
PS源代码、当前紧凑LST1请求（32008字节）、LSR1响应（16字节）可继续使用。
优化只改变计算实现，不改变同一输入的Q12预测结果。

两个已验证样本的期望SOH：row001=93.6279296875%，row167=94.189453125%。
紧凑协议完整期望响应见outputs/lstm_fast_expected_responses.txt。

优化源码：deployment/hls_fast/soh_accel.cpp。
仓库仅保留最终版 src/hls_fast；原版源码已移除，本文性能对比为既有报告记录。
优化前工程和BD、原bit备份：deployment/backup/pre_fast/。
IP仓库：deployment/hls_fast/lstm_fast_hls/solution1/impl/ip。

从工程根目录运行deployment/build.ps1可重建优化IP并接入、综合、布局布线和生成报告。
脚本在验证阶段结束，不含bit、XSA或BIN生成步骤。
原deployment/integrate.tcl是历史CNN实例版本脚本，不适用于当前实例命名；当前使用integrate_fast.tcl。

## 报告

outputs/lstm_speed_comparison.json：原版和优化版周期、资源、验证及当前部署状态。
deployment/reports/fast_timing.rpt：布线后时序。
deployment/reports/fast_utilization_placed.rpt：整工程布局资源。
deployment/hls_fast/lstm_fast_hls/solution1/sim/report/lstm_axis_cosim.rpt：RTL仿真结果。
