----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2019 01:50:00 PM
-- Design Name: 
-- Module Name: ha_tb - behavioral
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

entity ha_tb is
end ha_tb;

architecture Behavioral of ha_tb is

    component ha is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               sum : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component ha;

signal a_sig, b_sig, sum_sig, cout_sig: std_logic;

begin

uut: ha port map(a => a_sig, b => b_sig, sum => sum_sig, cout => cout_sig);

process
begin
a_sig <= '0';
b_sig <= '0';
wait for 10 ns;

a_sig <= '0';
b_sig <= '1';
wait for 10 ns;

a_sig <= '1';
b_sig <= '0';
wait for 10 ns;

a_sig <= '1';
b_sig <= '1';
wait;

end process;

end Behavioral;
