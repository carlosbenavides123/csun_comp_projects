----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 03:48:18 PM
-- Design Name: 
-- Module Name: subtractor_tb - Behavioral
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

entity subtractor_tb is
--  Port ( );
end subtractor_tb;

architecture Behavioral of subtractor_tb is

component subtractor is
    port(
            main, divide_by: in std_logic_vector(7 downto 0);    
            result: out std_logic_vector(7 downto 0)
        );
end component subtractor;

signal main_sig, divide_by_sig, result_sig: std_logic_vector(7 downto 0);

begin

uut: subtractor port map(main => main_sig, divide_by => divide_by_sig, result => result_sig);

process
begin
main_sig <= "11011101";
divide_by_sig <= "11111111";
wait for 10 ns;

main_sig <= "00001000";
divide_by_sig <= "00000010";
wait for 10 ns;

main_sig <= "00000010";
divide_by_sig <= "00001000";
wait for 10 ns;

end process;

end Behavioral;
