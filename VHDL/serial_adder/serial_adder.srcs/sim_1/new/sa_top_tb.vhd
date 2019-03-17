----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2019 11:38:03 AM
-- Design Name: 
-- Module Name: sa_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sa_top_tb is
--  Port ( );
end sa_top_tb;

architecture Behavioral of sa_top_tb is

component sa_top is
  port( 
        x:      in STD_LOGIC;
        y:      in STD_LOGIC;
        clk:    in STD_LOGIC;
        rst:    in STD_LOGIC;
        s:      in STD_LOGIC;
        ou:     out STD_LOGIC
       );
end component sa_top;

constant CP: time := 10 ns;
signal xin_sig, yin_sig, clk_sig, rst_sig, sin_sig, ou_sig: std_logic := '0';

begin
uut: sa_top port map(x => xin_sig, y => yin_sig, clk => clk_sig, rst => rst_sig, s => sin_sig, ou => ou_sig);

-- clock signal test
process
begin
    clk_sig <= '1';
     wait;
end process;


end Behavioral;
