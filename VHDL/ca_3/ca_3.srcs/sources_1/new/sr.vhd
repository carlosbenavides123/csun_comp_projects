----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:10:15 AM
-- Design Name: 
-- Module Name: sr - Behavioral
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

entity sr is
    port( 
           sin, rst, clk : in std_logic;
           sout : out std_logic
        );
end sr;

architecture Behavioral of sr is
    signal r_reg: std_logic_vector(3 downto 0);
    signal r_next: std_logic_vector(3 downto 0);
begin
    process (rst, clk)
    begin
        if rst = '1' then
            r_reg <= (others=>'0');
        elsif rising_edge(clk) then
            r_reg <= r_next;
        end if;
    end process;
    r_next <= sin & r_reg(3 downto 1);
    sout <= r_reg(0);
end Behavioral;
