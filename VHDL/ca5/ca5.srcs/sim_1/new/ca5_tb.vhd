----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2019 07:40:36 PM
-- Design Name: 
-- Module Name: ca5_tb - Behavioral
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

entity ca5_tb is
--  port( );
end ca5_tb;

architecture Behavioral of ca5_tb is

component ca5_top is
  port(
            reqA, reqB, reqC, clk, rst, load: in std_logic;
            resA, resB, resC          : out std_logic
       );
end component;

signal clk_sig, reqA_sig, reqB_sig, reqC_sig, rst_sig, load_sig: std_logic := '0';
signal resA_sig, resB_sig, resC_sig: std_logic;

constant CP: time := 10 ns;

begin

uut: ca5_top port map(reqA => reqA_sig, reqB => reqB_sig, reqC => reqC_sig, rst => rst_sig, clk => clk_sig, resA => resA_sig, resB => resB_sig, resC => resC_sig, load => load_sig);

-- load
process
begin
    load_sig <= '1';
    wait for CP/2;
    load_sig <= '0';
    wait;
end process;

-- clock
process
begin

    clk_sig <= '1';
    wait for CP/2;
        clk_sig <= '0';
    wait for CP/2;
end process;

-- req
process
begin
--    reqA_sig <= '0';
--    reqB_sig <= '0';
--    reqC_sig <= '0';
--    wait for CP/2;
    reqA_sig <= '1';
    reqB_sig <= '0';
    reqC_sig <= '1';
    wait;
end process;

end Behavioral;
