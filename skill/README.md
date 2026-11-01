# 技能包说明

本目录包含一个技能包 `zynq-soh-integration`，用于 Zynq 电池采集与 SOH 推理工程整合。验证记录见 [validation_20261101.md](validation_20261101.md)。

## 各项资源的适用范围、使用方法与失效条件

| 资源 | 适用范围 | 使用方法 | 失效条件或限制 |
| --- | --- | --- | --- |
| [技能入口](zynq-soh-integration/SKILL.md) | Zynq-7000 裸机、INA226、FatFs、TJC、DMA/HLS 整合与排错 | 向智能体提供入口及目标工程路径，说明修改目标、输入单位和允许的验证层级 | 换板卡、BSP、模型、地址或协议时需重新核对；不直接套用到 Linux 工程；本技能不构建 ELF/bit/XSA |
| [工程案例](zynq-soh-integration/references/cases.md) | 对照已有整合及优化经验 | 按问题选择案例，并与当前源码核对 | 历史路径、阈值、Q12、4000点及双次发送不是通用默认值；版本变化后旧结果不可直接沿用 |
| [排错清单](zynq-soh-integration/references/troubleshooting.md) | UART、SD、I²C、DMA 和预测差异排查 | 根据现象逐项检查，保留错误码和配置 | 主机模拟不能确定真实电气故障；持续总线故障可能无法由软件复位恢复 |
| [TXT 检查工具](zynq-soh-integration/scripts/check_txt.py) | V#I 文本点数、有限数值和可选字节一致性检查 | 按下方命令运行；退出码 0 表示全部通过，1 表示文件检查失败 | 不验证物理单位、曲线合理性或模型精度；忽略空行，只统计非空数据行；目录仅扫描当前层的 *.txt |
| [验证报告模板](zynq-soh-integration/assets/validation-report.md) | 记录变更、测试结果与未验证项 | 按实际执行情况填写，并记录版本及测量范围 | 模板本身不是通过证据；未执行、失败和历史通过须分开标注 |

## 使用方法

在仓库根目录运行，需有 Python 3；TXT 工具只使用标准库，不修改输入文件。

```powershell
python .\skill\zynq-soh-integration\scripts\check_txt.py .\src\sd --rows 4000
```

如需核对同名参考文件，在命令后增加 `--reference <参考目录>`；该选项比较原始字节，不按电池身份自动匹配重命名文件。

主机测试分别运行，分别查看退出结果；脚本使用的 GCC 路径需与本机安装一致：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\sim\integration\run.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\sim\i2c\run.ps1
```

官方基础校验需要 PyYAML 和 Codex skill-creator 提供的 `quick_validate.py`，后者不随本技能包分发。先确认 `python -c "import yaml"` 成功，再运行 `python <quick_validate.py路径> .\skill\zynq-soh-integration`。基础校验通过不等于工程或板上功能全部通过。
