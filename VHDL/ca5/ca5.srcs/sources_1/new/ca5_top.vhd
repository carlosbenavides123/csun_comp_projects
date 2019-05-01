----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2019 09:33:29 PM
-- Design Name: 
-- Module Name: ca5_top - Behavioral
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

entity ca5_top is
  port(
            reqA, reqB, reqC, clk, rst, load: in std_logic  ;
            resA, resB, resC          : out std_logic
       );
end ca5_top;

architecture Behavioral of ca5_top is

    type StateType is (Idle, Grant_A, Grant_B, Grant_C);
    signal CurrentState, NextState: StateType:= Grant_A;
    signal count: integer := 0;
    signal tempA: std_logic;
    signal tempB: std_logic;
    signal tempC: std_logic;
begin


FSM: process(clk, rst)

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



report to_string(TOSLV(tempA));
report to_string(TOSLV(reqA));
report "reqA";
            report to_string(std_logic_vector(to_unsigned(count,10)));

    if rst = '1' then
        CurrentState <= Idle;
    elsif load = '1' then 
        tempA <= reqA;
        tempB <= reqB;
        tempC <= reqC;
    elsif rising_edge(clk) then
        case CurrentState is
            when Grant_A =>
                if count = 60 then
                    CurrentState <= NextState;
                    count <= 0;
                    tempA <= '0';
                    resA <= '0';
                    report "made it here";
                    report to_string(ToSLV(tempB));
                                        report to_string(ToSLV(tempA));
               else
                    count <= count + 1;
                    resA <= '1';
                    resB <= '0';
                    resC <= '0';
               end if;
               
            when Grant_B =>
                if count = 60 then
                    tempB <= '0';
                                        tempB <= '0';

                    tempB <= '0';
                    tempB <= '0';
                    tempB <= '0';

                    count <= 0;
                    resB <= '0';
                    CurrentState <= NextState;
                    CurrentState <= Grant_C;

                    report to_string(ToSLV(tempB));

                else
                    count <= count + 1;
                    resA <= '0';
                    resB <= '1';
                    resC <= '0';
                end if;
                
            when Grant_C =>
                if count = 60 then
                    CurrentState <= Idle;
                    count <= 0;
                    tempC <= '0';
                    resC <= '0';
                else
                    count <= count + 1;
                    resA <= '0';
                    resB <= '0';
                    resC <= '1';
                 end if;
                 
            when others => 
                CurrentState <= Idle;
              end case;
          end if;
    end process;
      NextState <= Grant_B when tempB = '1' else
             Grant_C when tempC = '1' else
             Idle;
                
end Behavioral;
