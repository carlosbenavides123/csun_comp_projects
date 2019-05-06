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

entity op_sr is
    port( 
           sin : in STD_LOGIC;
           sout : out std_logic_vector(7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC
        );
end op_sr;

architecture Behavioral of op_sr is

constant WIDTH: integer := 8;
signal tmp_sig: std_logic_vector(WIDTH-1 downto 0);
signal tmp_top: std_logic;
begin

process (clk, tmp_sig, sin)

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
--report to_string(ToSLV(sin));
tmp_sig(7 downto 0) <= (others => '0');

   if (rising_edge(clk)) then
      if rst ='1' then
         tmp_sig <= (others => '0');
      else
         for i in 0 to WIDTH-2 loop
            tmp_sig(i+1) <= tmp_sig(i);
         end loop;
      end if;
   end if;
   tmp_sig(0) <= sin;
   report to_string(tmp_sig);

end process;

sout <= tmp_sig;

end Behavioral;
