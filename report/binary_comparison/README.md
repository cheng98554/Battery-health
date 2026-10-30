# board 与重新构建产物对比

## 结论

两套 ELF 不同不是因为应用源码或优化等级发生变化。已确认应用及 FSBL 的编译命令在归一化工作区路径后完全一致；PS 初始化代码相同。主要可解释差异是调试信息、BSP 源码绝对路径字符串及由只读段增长引起的数据地址变化。可执行段字节也不同，因此不能表述为“仅调试信息不同”或已证明二进制等价。

## 对比对象与来源

- 部署文件：board/app_component.elf、board/fsbl.elf。
- 重新构建文件：work/build_933a316cbff345c6a8586e2430cdc15a/ 下同名文件。
- 原配置：C:/Users/33827/Desktop/nasa/vitis。
- 新配置：work/v9c934f3f。

board 两个 ELF 的 SHA256 分别与原工程 app_component/build/app_component.elf、platform/export/platform/sw/boot/fsbl.elf 完全相同，确认原工程配置具有对应的产物来源。当前目录中的源码配置是现存快照，不是对原构建时刻所有输入的不可变证明。

## 配置逐项比较

| 项目 | 结果 |
| --- | --- |
| 应用 6 个编译单元 | 相同；归一化路径后实际 compile_commands.json 命令一致 |
| FSBL 12 个编译单元 | 相同；归一化路径后实际编译命令一致 |
| 应用 CPU / ABI | 两者均 Cortex-A9、vfpv3、hard float |
| 应用优化 / 调试 | 两者均 -O0、-g3，含 -Wall、-Wextra、-DSDT |
| 应用 C、H、链接脚本 | 两个应用 src 目录中对应文件内容一致 |
| 应用 UserConfig.cmake | 原配置显式列出 i2c.c/lstm_protocol.c/usart.c，新配置由目录收集；实际编译单元相同 |
| 显式链接库 | 原配置为 m；新配置额外列出 xilffs、xiltimer，平台生成 CMake 已包含这些库，存在重复列出 |
| 应用生成 CMakeLists.txt | 相同 |
| 应用 BSP 导出头文件 | 对应 .h 内容一致，包含硬件参数与库配置 |
| FSBL 目录直接包含的 C/H 文件 | 对应文件内容一致 |
| ps7_init.c / ps7_init.h | 字节完全相同 |
| XSA 内 ps7_init.c/h/tcl、GPL 初始化文件 | 字节完全相同 |
| BSP libxil.a / libxilffs.a / libxiltimer.a | 文件字节不同；未将归档中全部对象逐个做重定位归一化 |

配置差异原文见 app_component_src_UserConfig.cmake.diff。编译命令归一化后的两个 commands.diff 文件为空，表示命令一致。

## ELF 段与符号

| 指标 | board 应用 | 新应用 | board FSBL | 新 FSBL |
| --- | ---: | ---: | ---: | ---: |
| 文件大小（字节） | 839944 | 843324 | 581640 | 583896 |
| 入口地址 | 0x100000 | 0x100000 | 0x0 | 0x0 |
| .text 大小 | 119852 | 119852 | 73316 | 73316 |
| .rodata 大小 | 64126 | 64350 | 1137 | 1257 |
| .data 大小 | 1800 | 1800 | 8056 | 8056 |
| 内容字节变化的函数符号数 | — | 148 | — | 81 |

.text 大小相同但内容不同；函数字节变化数量不代表逻辑修改数量，地址常量变化也计入其中。详细地址、各段 SHA256、函数大小与 SHA256 见 elf_details.json。

应用 .rodata 增加 224 字节，FSBL 增加 120 字节。对其中长度不少于 8 的可打印字符串比较，独有字符串分别为 12 对和 6 对，均对应原工作区与新工作区的 BSP 源文件绝对路径。调试行号、字符串等非加载段也随路径变化增长。

反汇编示例：应用 sample_and_record 引用常量从 0x12cecc 改为 0x12cfac，偏移 224 字节；FSBL ps7_post_config 引用初始化表地址从 0x141cc 改为 0x14244，偏移 120 字节，与各自 .rodata 增量吻合。对应 diff 与完整反汇编均保存在本目录。此证据支持“路径字符串扩展导致布局与地址变化”，但未对每条机器指令进行语义等价证明。

## 硬件平台与 bitstream

system_wrapper.bit 字节不同；它们来自不同综合和布局布线运行，不能仅根据文件长度或哈希判断逻辑等价。

对原工程 system_wrapper.xsa 与新 XSA 内部文件比较：

- HLS 驱动文件与 PS 初始化文件相同。
- SmartConnect HWH 差异仅为时间戳。
- system.hwh 包含时间戳、HLS IP 修订号和组件名变化（system_lstm_axis_0_1 → system_lstm_axis_0_0）。
- PS 的 MIO14/15 描述从 in/out、LVCMOS 3.3V、pullup enabled、slow 变为未选择；但生成的 ps7_init.c/h/tcl 完全一致，不能据此断言初始化寄存器发生变化。该描述差异仍需结合实际使用的 UART 引脚及上板测试确认。
- sysdef.xml 和 xsa.xml 元数据也不同，详见 xsa_*.diff。

## 使用建议

当前证据未发现应用源码、编译优化等级或 PS 初始化寄存器序列改变，不能把文件大小差异等同于功能变化。但尚未证明所有库对象、可执行指令和 PL 逻辑完全等价，也未进行板上对照测试。部署时保留同一次构建的 FSBL、bitstream、应用和启动镜像配套，不混用不同批次产物。

本次只进行读取和生成对比材料，未替换 board 文件，也未改动构建脚本。
