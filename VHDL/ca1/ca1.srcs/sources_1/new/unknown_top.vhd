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

signal sig1, sig2, sig3: std_logic;
signal and2: std_logic;
signal c11, c12: std_logic;
signal s12: std_logic;

begin

sig1 <= xin(3) and yin(0);


u00: ha port map(a => a_sig, b => b_sig, cin => cin_sig, sum => sum_sig, cout => cout_sig);
u01: fa port map(a => and2, b => sig1, cin => c11, sum => s12, cout => c12);
u02: fa port map(a => a_sig, b => b_sig, cin => cin_sig, sum => sum_sig, cout => cout_sig);
u03: ha port map(a => a_sig, b => b_sig, cin => cin_sig, sum => sum_sig, cout => cout_sig);


end behavioral;
