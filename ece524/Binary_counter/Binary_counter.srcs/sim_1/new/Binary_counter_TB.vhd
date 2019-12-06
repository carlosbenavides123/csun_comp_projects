----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2019 03:18:41 PM
-- Design Name: 
-- Module Name: Binary_counter_TB - Behavioral
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

entity Binary_counter_TB is
end Binary_counter_TB;

architecture Behavioral of Binary_counter_TB is

component Binary_Counter 
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cntr : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk_sig, rst_sig: std_logic;
signal cntr_sig: std_logic_vector(7 downto 0);

begin
uut: Binary_Counter port map(clk => clk_sig, rst => rst_sig, cntr => cntr_sig);
    
process 
    begin 
    clk_sig <= '0';
    wait for 10 ns;
    clk_sig <= '1';
    wait for 10 ns;
end process;

process 
    begin 
    rst_sig <= '1';
    wait for 20 ns;
    rst_sig <= '0';
    wait;
 end process;
 
end Behavioral;