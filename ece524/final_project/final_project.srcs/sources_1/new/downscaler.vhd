----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2019 10:42:32 AM
-- Design Name: 
-- Module Name: downscaler - Behavioral
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

entity downscaler is
  port
  ( 
  clk: in std_logic;
  clock_out: out std_logic
  );
end downscaler;

architecture Behavioral of downscaler is

signal count: integer:=1;
signal tmp : std_logic := '0';

begin

process(clk)
    begin
    if(rising_edge(clk)) then
        count <=count+1;
        if (count = 50000) then
            tmp <= NOT tmp;
            count <= 1;
        end if;
    end if;
    clock_out <= tmp;
end process;

end Behavioral;
