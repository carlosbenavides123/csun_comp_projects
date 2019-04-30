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
            reqA, reqB, reqC, clk, rst: in std_logic  
       );
end ca5_top;

architecture Behavioral of ca5_top is

    type StateType is (Idle, Grant_A, Grant_B, Grant_C);
    signal CurrentState, NextState: StateType:= Idle;
    signal count: integer := 0;
    signal tempA: std_logic := reqA;
    signal tempB: std_logic := reqB;
    signal tempC: std_logic := reqC;
begin

FSM: process(clk, rst)
begin
    if rst = '1' then
        CurrentState <= Idle;
    elsif rising_edge(clk) then
        case CurrentState is
            when Grant_A =>
                if count = 60 then
                    CurrentState <= NextState;
                    count <= 0;
                    tempA <= '0';
               else
                    count <= count + 1;
               end if;
            when Grant_B =>
                if count = 60 then
                    CurrentState <= NextState;
                    count <= 0;
                    tempB <= '0';
                else
                    count <= count + 1;
                end if;
            when Grant_C =>
                if count = 60 then
                    CurrentState <= Idle;
                    count <= 0;
                    tempC <= '0';
                else
                    count <= count + 1;
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
