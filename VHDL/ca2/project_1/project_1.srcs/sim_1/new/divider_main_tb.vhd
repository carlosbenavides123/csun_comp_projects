----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 07:34:02 PM
-- Design Name: 
-- Module Name: divider_main_tb - Behavioral
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

entity divider_main_tb is
--  Port ( );
end divider_main_tb;

architecture Behavioral of divider_main_tb is

component divider_main is
    port(
            dividend:	in	std_logic_vector(7	downto	0);
            remainder:	out std_logic_vector(5	downto	0);	
            quotient:	out	std_logic_vector(2	downto	0)
         );	
end component divider_main;

signal dividend_signal: std_logic_vector(7 downto 0);
signal remainder_signal: std_logic_vector(5	downto	0);	
signal quotient_signal: std_logic_vector(2	downto	0);


begin

uut: divider_main port map(dividend => dividend_signal, remainder => remainder_signal, quotient => quotient_signal);

process
begin

dividend_signal <= "01111101";
wait for 10 ns;

--dividend_signal <= "01111101";
--wait for 10 ns;

--dividend_signal <= "01111101";
--wait for 10 ns;

--dividend_signal <= "01111101";
--wait for 10 ns;

--dividend_signal <= "10101010";
--wait for 10 ns;

--dividend_signal <= "01010101";
--wait for 10 ns;

--dividend_signal <= "01001000";
--wait for 10 ns;


end process;
end Behavioral;
