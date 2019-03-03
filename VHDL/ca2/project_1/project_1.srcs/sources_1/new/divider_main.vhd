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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_main is
    port(
            dividend:	in	std_logic_vector(7	downto	0);	
            remainder:	out std_logic_vector(5	downto	0);	
            quotient:	out	std_logic_vector(2	downto	0)
         );	
end divider_main;

architecture Behavioral of divider_main is

signal SEL: STD_LOGIC;
signal quotient_signal: unsigned(2 downto 0);

-- for subtractor
signal input_signal, const_signal: std_logic_vector(7 downto 0);
signal res_signal: std_logic_vector(7 downto 0);

component subtractor  is
    port( 
            input: in STD_LOGIC;
            const: in STD_LOGIC;
            res: out STD_LOGIC
        );
end component subtractor;

component mux is
    Port( 
        SEL: in STD_LOGIC;
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        X: out STD_LOGIC
       );
end component mux;
signal count: unsigned(2 downto 0);
signal test: signed(7 downto 0);
signal te: std_logic_vector(5 downto 0);
begin
--      u00: subtractor port a(input_signal => input, const_signal => const, res_signal => res);

--    process(SEL, dividend) is begin
--        if SEL = '1' then
--        else
--            quotient_signal <= quotient_signal + 1;
test <= signed(dividend);

    process(test) is begin
        if signed(test) < 00000101 then
            for i in te'range loop
                te(i) <= test(i);
            end loop;
            remainder <= te;
--            remainder <= std_logic_vector(test);
            quotient <= std_logic_vector(count);
        else
            count <= count + 1;
            test <= signed(test) - 5;
        end if;
    end process;

end Behavioral;
