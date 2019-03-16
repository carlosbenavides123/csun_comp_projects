----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2019 12:43:37 PM
-- Design Name: 
-- Module Name: divider_main - Behavioral
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
use STD.textio.all;                     -- basic I/O
use IEEE.std_logic_textio.all;          -- I/O for logic types

entity divider_main is
    port(
            dividend: in std_logic_vector(7 downto 0);
            remainder: out std_logic_vector(5 downto 0);	
            quotient: out std_logic_vector(2 downto 0)
         );	
end divider_main;

architecture Behavioral of divider_main is

signal dividend_signal: signed(7 downto 0);
signal remainder_signal: std_logic_vector(5 downto 0);
signal fifty_three: signed(7 downto 0);
signal count: unsigned(2 downto 0);

begin
    dividend_signal <= signed(dividend);
    fifty_three <= "00011101";
    count <= "000";
    process(dividend, dividend_signal) is 
        begin
        if dividend_signal < fifty_three then
            remainder(5 downto 0) <= std_logic_vector(dividend_signal(5 downto 0));
            quotient <= std_logic_vector(count);
            dividend_signal <= "00000000";
            count(2 downto 0) <= "000";
        else
            count <= count + 1;
            dividend_signal <= dividend_signal - fifty_three;
            quotient(2 downto 0) <= "000";
            remainder <= "000000";
        end if;
    end process;
end Behavioral;
--            write(my_line, std_logic_vector(count(2 downto 0)));   -- formatting
--writeline(output, my_line);
--        variable sttr : line;
--file dataout : text open write_mode is "abc";
--        variable my_line : line;  -- type 'line' comes from textio
