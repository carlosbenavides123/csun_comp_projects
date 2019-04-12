-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Mon Mar 18 08:53:11 2019
-- Host        : carlos-MS-7994 running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/carlos/csun/csun_comp_projects/VHDL/ca_3/ca_3.sim/sim_2/synth/func/xsim/sa_top_tb_func_synth.vhd
-- Design      : sa_top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbv676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sa_top is
  port (
    x : in STD_LOGIC_VECTOR ( 7 downto 0 );
    y : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    s : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sa_top : entity is true;
end sa_top;

architecture STRUCTURE of sa_top is
begin
\s_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(0)
    );
\s_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(10)
    );
\s_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(1)
    );
\s_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(2)
    );
\s_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(3)
    );
\s_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(4)
    );
\s_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(5)
    );
\s_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(6)
    );
\s_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(7)
    );
\s_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(8)
    );
\s_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => s(9)
    );
end STRUCTURE;
