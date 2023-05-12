
#
## This file is a general .xdc for the Nexys A7-100T
### Clock Signal
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk -period 10.00 -waveform {0 5} [get_ports { clk }];

### Button(s)
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { reset }];
set_property -dict { PACKAGE_PIN P17 IOSTANDARD LVCMOS33 } [get_ports { recordBtnEN }];
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { playbackBtnEN }];


set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { micGenCLK }]; #IO_25_35 Sch=m_clk
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { micDataPDM }]; #IO_L24N_T3_35 Sch=m_data
set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { micLRselPDM }]; #IO_0_35 Sch=m_lrsel

set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { audDataPWM }]; #IO_L4N_T0_15 Sch=aud_pwm
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { audEnPWM }]; #IO_L6P_T0_15 Sch=aud_sd

