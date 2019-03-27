----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2019 11:38:03 AM
-- Design Name: 
-- Module Name: sa_tb - Behavioral
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

entity sa_top_tb is
--  Port ( );
end sa_top_tb;

architecture Behavioral of sa_top_tb is

component sa_top is
      port( 
            x, y:        in STD_LOGIC;
            clk, rst:    in STD_LOGIC;
            s:            out std_logic_vector(7 downto 0)
         );
end component sa_top;

constant CP: time := 10 ns;
signal xin_sig, yin_sig: std_logic := '0';
signal clk_sig, rst_sig: std_logic := '0';
signal s_op: std_logic_vector(7 downto 0);
begin

uut: sa_top port map(x => xin_sig, y => yin_sig, clk => clk_sig, rst => rst_sig, s => s_op);

-- clock signal test
process
begin
    clk_sig <= '1';
wait for CP/2;
    clk_sig <= '0';
    wait for CP/2;

end process;

-- clock signal test
--process
--begin
--    rst_sig <= '1';
--    wait for CP;
--    rst_sig <= '0';
--    wait;
--end process;

-- x
process
begin
    xin_sig <= '1';
    wait for CP;
    xin_sig <= '0';
    wait for CP;
    xin_sig <= '1';
    wait for CP;
    xin_sig <= '1';
    wait for CP;
    xin_sig <= '0';
    wait for CP;
    xin_sig <= '1';
    wait for CP;
    xin_sig <= '1';
    wait for CP;
    xin_sig <= '1';
    wait for CP;
    xin_sig <= '0';

    wait;
end process;

-- y
process
begin
    yin_sig <= '1';
    wait for CP;
    yin_sig <= '1';
    wait for CP;
    yin_sig <= '0';
    wait for CP;
    yin_sig <= '0';
    wait for CP;
    yin_sig <= '1';
    wait for CP;
    yin_sig <= '1';
    wait for CP;
    yin_sig <= '1';
    wait for CP;
    yin_sig <= '0';
    wait for CP;
    yin_sig <= '0';

    wait;
end process;

end Behavioral;
