----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2019 10:40:40 AM
-- Design Name: 
-- Module Name: dff - Behavioral
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

entity dff is
    port(
            d:in STD_LOGIC;
            q:out std_LOGIC;
            clk:in STD_LOGIC;
            rst:in STD_LOGIC
         );
end dff;

architecture Behavioral of dff is

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
    
    signal temp_q: std_logic := '0';
begin
    process (clk)
    begin
        if (rst = '1') then
            temp_q <= '0';
        elsif rising_edge(clk) then
            temp_q <= d;
         end if;
--         report to_string(TOSLV(d));
    end process;
    q<=temp_q; 
end Behavioral;
