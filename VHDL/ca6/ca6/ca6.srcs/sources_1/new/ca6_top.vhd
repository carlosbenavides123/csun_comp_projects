----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2019 09:48:49 AM
-- Design Name: 
-- Module Name: ca6_top - Behavioral
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

entity ca6_top is
       port(
                clk, rst: in std_logic;
                sum_out: out std_logic_vector(15 downto 0)
            );
end ca6_top;

architecture Behavioral of ca6_top is
signal counter: unsigned(9 downto 0);
signal sum_sig, ram_out: std_logic_vector(15 downto 0);
signal re: std_logic;
signal we: std_logic_vector(0 downto 0);
signal add_out: std_logic_vector(16 downto 0);

begin

sum_out <= sum_sig;
re <= '1';
we <= '1';

process (clk)
begin
    if rst = '1' then
       counter <= (others=>'0');
   elsif rising_edge(clk) then
      counter <= counter + 1;
   end if;
end process;



process (clk)
begin
    if rst = '1' then
       counter <= (others=>'0');
   elsif rising_edge(clk) then
      sum_sig <= add_out;
      ram_out_sig <= ram_out;
   end if;
end process;

add_out <= std_logic_vector(unsigned(ram_out) + unsigned(ram_out_reg));

end Behavioral;
