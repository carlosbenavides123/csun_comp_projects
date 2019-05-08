#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/carlos/SDK/2018.2/bin:/home/carlos/Vivado/2018.2/ids_lite/ISE/bin/lin64:/home/carlos/Vivado/2018.2/bin
else
  PATH=/home/carlos/SDK/2018.2/bin:/home/carlos/Vivado/2018.2/ids_lite/ISE/bin/lin64:/home/carlos/Vivado/2018.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/carlos/Vivado/2018.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/carlos/Vivado/2018.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/carlos/csun/csun_comp_projects/VHDL/ca6/ca6.runs/blk_mem_gen_1_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log blk_mem_gen_1.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source blk_mem_gen_1.tcl