----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:10:15 AM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sr is
    port( 
           sin : in STD_LOGIC_VECTOR(7 downto 0);
           sout : out std_logic;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC
        );
end sr;

architecture Behavioral of sr is

constant WIDTH: integer := 8;
signal tmp_sig: std_logic_vector(WIDTH-1 downto 0);
signal tmp_top: std_logic;
begin

process (clk, tmp_top, tmp_sig)

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

tmp_sig(7 downto 0) <= sin(7 downto 0);

   if (rising_edge(clk)) then
      if rst ='1' then
         tmp_sig <= (others => '0');
      else
      tmp_top <= tmp_sig(7);
         for i in 0 to WIDTH-2 loop
            tmp_sig(i+1) <= tmp_sig(i);
         end loop;
         tmp_sig(0) <= tmp_top;
      end if;
   end if;
--   report to_string(tmp_sig);
--   report to_string(ToSLV(tmp_top));

end process;

sout <= tmp_top;

end Behavioral;
