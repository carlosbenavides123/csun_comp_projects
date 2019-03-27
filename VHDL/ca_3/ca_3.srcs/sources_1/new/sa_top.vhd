----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:10:15 AM
-- Design Name: 
-- Module Name: sa_top - Behavioral
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

entity sa_top is
  port( 
        x, y:        in STD_LOGIC;
        clk, rst:    in STD_LOGIC;
        s:           out std_logic_vector(7 downto 0)
       );
end sa_top;

architecture Behavioral of sa_top is

component sr is
    port(
            sin, rst, clk:  in std_logic;
            sout:           out std_logic
         );
end component;

component fa is
    port(
            a, b, cin, clk:      in std_logic;
            sum, cout:      out std_logic
         );
end component;

component dff is
    port(
            d, clk, rst:    in STD_LOGIC;
            q:              out std_LOGIC
         );
end component;

component op_sr is
    port(
            sin, rst, clk:  in std_logic;
            sout:           out std_logic_vector(7 downto 0)
         );
end component;

signal x_i, y_i, cin_sig, cout_sig, s_i: std_logic := '0';
signal start: unsigned(7 downto 0):= "00000000";
signal s_vector: std_logic_vector(7 downto 0):= "00000000";


begin

x_inp: sr port map(sin => x, rst => rst, clk => clk, sout => x_i);
y_inp: sr port map(sin => y, rst => rst, clk => clk, sout => y_i);

full_adder: fa port map(a => x_i, b => y_i, cin => cin_sig, clk => clk, sum => s_i, cout => cout_sig);

carry: dff port map(d => cout_sig, rst => rst, clk => clk, q => cin_sig);

result: op_sr port map(sin => s_i, clk => clk, rst => rst, sout => s_vector);

--process(clk, rst)
--    begin
--    if rst = '1' then
--        start <= (others => '0');
--    elsif rising_edge(clk) then
--        start <= start + 1;
--    end if;
--end process;
--process(start)
--    begin
--        if start = 8 then
--        else 
--            s <= (others => '0');
--        end if;
--end process;
            s <= s_vector;

end Behavioral;
