----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 09:49:53 AM
-- Design Name: 
-- Module Name: unknown_top - behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unknown_top is
    Port ( xin : in STD_LOGIC_VECTOR (3 downto 0);
           yin : in STD_LOGIC_VECTOR (3 downto 0);
           pout : out STD_LOGIC_VECTOR (7 downto 0));
end unknown_top;

architecture behavioral of unknown_top is
-- declaration part
-- components, signals
-- aka parameters 
component fa is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end component fa;

-- TODO, make half adder
component ha is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end component ha;


signal sig_p00, sig_p10, sig_p11, sig_p20, sig_p21, sig_p22, sig_p23: std_logic;
signal sig_p30, sig_p31, sig_p32, sig_p33, sig_p40, sig_p41, sig_p42: std_logic;
signal sig_p50, sig_p51, sig_p52, sig_p53, sig_p60, sig_p61, sig_p62: std_logic;

signal and2: std_logic;
signal c10, c11, c12, c13, c20, c21, c22, c23, c30, c31, c32, c33: std_logic;
signal s10, s11, s12, s13, s20, s21, s22, s23, s30, s31, s32, s33: std_logic;

signal c40, c41, c42, c50, c51, c60: std_logic;
signal s40, s41, s42, s50, s51, s60: std_logic;

begin

-- top level from right to left

-- p0
sig_p00 <= xin(0) and yin(0);

pout(0) <= sig_p00;

-- p1
sig_p10 <= xin(1) and yin(0);
sig_p11 <= xin(0) and yin(1);
s10 <= sig_p10 and sig_p11;
c10 <= sig_p10 and sig_p11;

u10: ha port map(a => sig_p10, b => sig_p11, sum => s10, cout => s10);

pout(1) <= s10;

-- p2
sig_p20 <= xin(2) and yin(0);
sig_p21 <= xin(1) and yin(1);

u20: fa port map(a => sig_p20, b => sig_p21, cin => c10, sum => s11, cout => c11);

sig_p22 <= xin(0) and yin(2);

u21: ha port map(a => sig_p22, b => s11, sum => s20, cout => c20);

pout(2) <= s20;

--p3

sig_p30 <= xin(3) and yin(0);
sig_p31 <= xin(2) and yin(1);

u30: fa port map(a => sig_p30, b => sig_p31, cin => c11, sum => s12, cout => c12);

sig_p32 <= xin(1) and yin(2);

u31: fa port map(a => s12, b => sig_p32, cin => c20, sum => s21, cout => c21);

sig_p33 <= xin(0) and yin(3);

u32: ha port map(a => s21, b => sig_p33, sum => s30, cout => c30);

pout(3) <= s30;

--p4

sig_p40 <= xin(3) and yin(1);

u40: ha port map( a => c12, b => sig_p40, sum => s13, cout => c13 );

sig_p41 <= xin(2) and yin(2);

u41: fa port map ( a => sig_p41, b => s13, cin => c21, sum => s22, cout => c22 );

sig_p42 <= xin(1) and yin(3);

u42: fa port map ( a => sig_p42, b => s22, cin => c30, sum => s31, cout => c31 );

pout(4) <= s31;

--p5

sig_p50 <= xin(3) and yin(2);

u50: fa port map ( a => sig_p50, b => c13, cin => c22, sum => s23, cout => c23 );

sig_p51 <= xin(2) and yin(3);

u51: fa port map ( a => sig_p51, b => s23, cin => c31, sum => s32, cout => c32 );

pout(5) <= s32;

-- p6

sig_p60 <= xin(3) and yin(3);

u60: fa port map ( a => sig_p60, b => c23, cin => c32, sum => s33, cout => c33 );

pout(6) <= s33;


-- p7

pout(7) <= c33;


--u00: ha port map(a => a_sig, b => b_sig, cin => cin_sig, sum => sum_sig, cout => cout_sig);
--u01: fa port map(a => and2, b => sig1, cin => c11, sum => s12, cout => c12);
--u02: fa port map(a => a_sig, b => b_sig, cin => cin_sig, sum => sum_sig, cout => cout_sig);
--u03: ha port map(a => a_sig, b => b_sig, cin => cin_sig, sum => sum_sig, cout => cout_sig);


end behavioral;
