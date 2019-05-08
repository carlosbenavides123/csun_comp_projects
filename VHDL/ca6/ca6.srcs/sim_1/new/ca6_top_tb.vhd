----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2019 07:14:24 PM
-- Design Name: 
-- Module Name: ca6_top_tb - Behavioral
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

entity ca6_top_tb is
--  Port ( );
end ca6_top_tb;

architecture Behavioral of ca6_top_tb is

component ca6_top is
    Port ( clk,rst : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal sum_out_sig: std_logic_vector(15 downto 0);
signal clk_sig, rst_sig: std_logic;


begin
uut: ca6_top port map(clk=> clk_sig, rst=>rst_sig, sum_out=>sum_out_sig);

process 
begin
clk_sig <='1';
wait for 5 ns;
clk_sig <= '0';
wait for 5ns;
end process;

process 
begin
rst_sig <='1';
wait for 10 ns;
rst_sig <= '0';
wait;
end process;


end Behavioral;
