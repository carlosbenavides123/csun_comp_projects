set_property PACKAGE_PIN    Y9 [get_ports {   clk100 } ]
set_property PACKAGE_PIN	Y21	[get_ports {	vga_blue[0]	}	]
set_property PACKAGE_PIN	Y20	[get_ports {	vga_blue[1]	}	]
set_property PACKAGE_PIN	AB20	[get_ports {	vga_blue[2]	}	]
set_property PACKAGE_PIN	AB19	[get_ports {	vga_blue[3]	}	]
set_property PACKAGE_PIN	AB22	[get_ports {	vga_green[0]	}	]
set_property PACKAGE_PIN	AA22	[get_ports {	vga_green[1]	}	]
set_property PACKAGE_PIN	AB21	[get_ports {	vga_green[2]	}	]
set_property PACKAGE_PIN	AA21	[get_ports {	vga_green[3]	}	]
set_property PACKAGE_PIN	V20	[get_ports {	vga_red[0]	}	]
set_property PACKAGE_PIN	U20	[get_ports {	vga_red[1]	}	]
set_property PACKAGE_PIN	V19	[get_ports {	vga_red[2]	}	]
set_property PACKAGE_PIN	V18	[get_ports {	vga_red[3]	}	]
set_property PACKAGE_PIN	AA19	[get_ports {	vga_hsync	}	]
set_property PACKAGE_PIN	Y19	[get_ports {	vga_vsync	}	]
					
					
set_property PACKAGE_PIN	Y11	[get_ports {	OV7670_PWDN	}	]
set_property PACKAGE_PIN	AB11	[get_ports {	OV7670_RESET	}	]
set_property PACKAGE_PIN	AA11	[get_ports {	OV7670_D[0]	}	]
set_property PACKAGE_PIN	AB10	[get_ports {	OV7670_D[1]	}	]
set_property PACKAGE_PIN	Y10	[get_ports {	OV7670_D[2]	}	]
set_property PACKAGE_PIN	AB9	[get_ports {	OV7670_D[3]	}	]
set_property PACKAGE_PIN	AA9	[get_ports {	OV7670_D[4]	}	]
set_property PACKAGE_PIN	AA8	[get_ports {	OV7670_D[5]	}	]
					
set_property PACKAGE_PIN	W12	[get_ports {	OV7670_D[6]	}	]
set_property PACKAGE_PIN	V12	[get_ports {	OV7670_D[7]	}	]
set_property PACKAGE_PIN	W11	[get_ports {	OV7670_XCLK	}	]
set_property PACKAGE_PIN	W10	[get_ports {	OV7670_PCLK	}	]
set_property PACKAGE_PIN	V10	[get_ports {	OV7670_HREF	}	]
set_property PACKAGE_PIN	V9	[get_ports {	OV7670_VSYNC	}	]
set_property PACKAGE_PIN	W8	[get_ports {	OV7670_SIOD	}	]
set_property PACKAGE_PIN	V8	[get_ports {	OV7670_SIOC	}	]
set_property PACKAGE_PIN	V12	[get_ports {	OV7670_PCLK	}	]
					
set_property PACKAGE_PIN	T22	[get_ports {	LED[0]	}	]
set_property PACKAGE_PIN	T21	[get_ports {	LED[1]	}	]
set_property PACKAGE_PIN	U22	[get_ports {	LED[2]	}	]
set_property PACKAGE_PIN	U21	[get_ports {	LED[3]	}	]
set_property PACKAGE_PIN	V22	[get_ports {	LED[4]	}	]
set_property PACKAGE_PIN	W22	[get_ports {	LED[5]	}	]
set_property PACKAGE_PIN	U19	[get_ports {	LED[6]	}	]
set_property PACKAGE_PIN	U14	[get_ports {	LED[7]	}	]
					
set_property PACKAGE_PIN	T18	[get_ports {	btn	}	]


# Voltage levels
set_property IOSTANDARD LVTTL [get_ports btn]
set_property IOSTANDARD LVTTL [get_ports {LED[*]}]

set_property IOSTANDARD LVTTL [get_ports OV7670_PCLK]
set_property IOSTANDARD LVTTL [get_ports OV7670_SIOC]
set_property IOSTANDARD LVTTL [get_ports OV7670_VSYNC]
set_property IOSTANDARD LVTTL [get_ports OV7670_RESET]
set_property IOSTANDARD LVTTL [get_ports OV7670_PWDN]
set_property IOSTANDARD LVTTL [get_ports OV7670_HREF]
set_property IOSTANDARD LVTTL [get_ports OV7670_XCLK]
set_property IOSTANDARD LVTTL [get_ports OV7670_SIOD]
set_property IOSTANDARD LVTTL [get_ports {OV7670_D[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports vga_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports clk100]

# Magic
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets OV7670_PCLK_IBUF]