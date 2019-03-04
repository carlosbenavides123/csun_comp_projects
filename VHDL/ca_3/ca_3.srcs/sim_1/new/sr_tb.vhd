----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:20:02 AM
-- Design Name: 
-- Module Name: sr_tb - Behavioral
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

entity sr_tb is
--  Port ( );
end sr_tb;

architecture Behavioral of sr_tb is

component sr is
    port ( sin : in STD_LOGIC;
           sout : out STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component sr;

constant CP: time := 10 ns;
signal sin_sig, sout_sig, clk_sig, rst_sig: std_logic := '0';

begin

uut: sr port map(sin => sin_sig, sout => sout_sig, clk => clk_sig, rst => rst_sig);

-- clock signal test
process
begin
clk_sig <= '1';
wait for CP/2;
clk_sig <= '0';
wait for CP/2;
end process;

-- reset signal test
process
begin
rst_sig <= '1';
wait for CP;
rst_sig <= '0';
wait;
end process;

-- reset signal test
process
begin
wait for CP/4;
sin_sig <= '0';
wait for 2*CP;
sin_sig <= '1';
wait for 2*CP;
sin_sig <= '0';
wait for CP;
sin_sig <= '1';
wait for CP;
sin_sig <= '0';
wait for 2*CP;
sin_sig <= '1';
wait for 2*CP;
sin_sig <= '0';
wait;

end process;

end Behavioral;
