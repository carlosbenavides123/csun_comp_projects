vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../final_project.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_sim_netlist.vhdl" \


