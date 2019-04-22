----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 10:31:54 AM
-- Design Name: 
-- Module Name: ca4 - Behavioral
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

entity ca4 is
  port(
            x:      in std_logic_vector(15 downto 0);
            y:      in std_logic_vector(15 downto 0);
            clk:    in std_logic;
            rst:    in std_logic;
            prod:   out std_logic_vector(31 downto 0)    
       );
end ca4;

architecture Behavioral of ca4 is
signal prod_sig: std_logic_vector(32 downto 0);
signal y_reg, op1, op2: std_logic_vector(15 downto 0);
signal op1_sel: std_logic;

begin
    process(clk, rst)
    begin
        if rising_edge(clk) then
            y_reg <= y;
        end if;
    end process;

op1 <= y_reg when op1_sel =  '1' else (others => '0');

prod_sig <= std_logic_vector(unsigned("0000000000000000"&op1) + unsigned("00000000000000000"&op2));


end Behavioral;
