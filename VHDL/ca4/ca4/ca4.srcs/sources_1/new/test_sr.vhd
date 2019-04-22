----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2019 07:33:14 PM
-- Design Name: 
-- Module Name: test_sr - Behavioral
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

entity test_sr is
    port(
       data_in:     in std_logic_vector(31 downto 0);
       rst, clk :   in std_logic;
       sout :       out std_logic_vector(31 downto 0);
       sout_temp:   out std_logic_vector(15 downto 0)
    );
end test_sr;

architecture Behavioral of test_sr is

signal data_in_temp, res : std_logic_vector(31 downto 0) := (others => '0');
begin
        process (clk,rst,data_in, data_in_temp) is
        begin
            if (rst='1') then
                data_in_temp <= (others=>'0');
            elsif (rising_edge (clk)) then
                res <= data_in_temp;
                data_in_temp <= '0' & data_in_temp(31 downto 1);
            end if;
        end process;
data_in_temp(31 downto 15) <= data_in(16 downto 0);
sout <= res;
sout_temp <= res(31 downto 16);

end Behavioral;
