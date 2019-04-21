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

function to_string ( a: std_logic_vector) return string is
variable b : string (1 to a'length) := (others => NUL);
variable stri : integer := 1; 
begin
    for i in a'range loop
        b(stri) := std_logic'image(a((i)))(2);
    stri := stri+1;
    end loop;
return b;
end function;

function ToSLV(i:std_logic) return std_logic_vector is 
variable O:std_logic_vector(0 to 0):=(0=>i); 
begin 
return (0 => i);
end function ToSLV;


begin
    process(clk, rst, temp_reg)
    begin
--    report to_string(data_in);
--    report to_string(reg);
--    report to_string(temp_reg);
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
