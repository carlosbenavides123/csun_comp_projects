----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 12:49:20 PM
-- Design Name: 
-- Module Name: subtractor - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subtractor is
    port(
            main, divide_by: in std_logic_vector(7 downto 0);    
            result: out std_logic_vector(7 downto 0)
        );
end subtractor;

architecture Behavioral of subtractor is
    signal main_signed : signed(7 downto 0);
    signal divde_by_signed :  signed(7 downto 0);
begin
    main_signed <= signed(main);
    divde_by_signed <= signed(divide_by);
    process(main_signed) is begin
        if main_signed < divde_by_signed then
            result <= std_logic_vector(main_signed);
        else 
            result <= std_logic_vector(main_signed - divde_by_signed);
        end if;
    end process;
end Behavioral;
