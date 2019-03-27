----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2019 10:21:59 AM
-- Design Name: 
-- Module Name: fa - Behavioral
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

entity fa is
    port( 
            a, b, cin, clk: in STD_LOGIC;
            sum:            out STD_LOGIC;
            cout:           out STD_LOGIC
         );
end fa;

architecture Behavioral of fa is

signal temp_sum, temp_cout: std_logic := '0';

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
process(clk) is
begin
    if rising_edge(clk) then
        temp_sum <= a xor b xor cin;
        temp_cout <= (a and b) or (a and cin) or (b and cin);
    end if;
--    report to_string(TOSLV(a));
--        report to_string(TOSLV(b));
--    report to_string(TOSLV(cin));
end process;
sum <= temp_sum;
cout <= temp_cout;
end Behavioral;