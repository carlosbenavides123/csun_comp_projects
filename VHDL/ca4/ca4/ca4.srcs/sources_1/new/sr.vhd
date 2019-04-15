----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2019 06:33:31 PM
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sr is
    port( 
           data_in: in std_logic_vector(15 downto 0);
           rst, clk : in std_logic;
           sout : out std_logic
        );
end sr;

architecture Behavioral of sr is

signal temp_reg, reg: std_logic_vector(15 downto 0) := data_in;

begin
    process(clk, rst)
    begin
        if(rst = '1') then
            temp_reg <= (others=>'0');
        elsif rising_edge(clk) then
            reg <= temp_reg;
        end if;
    end process;

temp_reg <= '0' & reg(15 downto 1);
--temp_reg <= sin & reg(3 downto 1);
sout <= reg(0);

end Behavioral;
