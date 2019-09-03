----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2019 11:25:10 PM
-- Design Name: 
-- Module Name: Binary_Counter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Binary_Counter is
    Port (clk: in std_logic; 
          rst: in std_logic;
          cntr: out std_logic_vector(7 downto 0));
end Binary_Counter;

architecture Behavioral of Binary_Counter is

signal cntr_sig: std_logic_vector(7 downto 0);
begin
    process (clk,rst)
        begin
           if (clk = '1' and rising_edge(clk)) then
              if (rst ='1') then
                 cntr_sig <= (others => '0');
              else
                 cntr_sig <= (cntr_sig + 1);
              end if;
           end if;
    end process;
    cntr <= cntr_sig;
end Behavioral;
