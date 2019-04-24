----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2019 10:12:22 AM
-- Design Name: 
-- Module Name: ca6_tb - Behavioral
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

entity ca6_tb is
--  Port ( );
end ca6_tb;

architecture Behavioral of ca6_tb is

component ca6_top is
    port ( clk, rst: in std_logic;
           sum_out : out std_logic_vector(15 downto 0)
           );
end component;


begin

uut: ca6_top port map (clk => clk_sig, res => res_sig

process
begin
rst_sig

end Behavioral;
