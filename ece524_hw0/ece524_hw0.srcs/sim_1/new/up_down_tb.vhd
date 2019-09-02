library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;

entity up_down_tb is
--  Port ( );
end up_down_tb;

architecture Behavioral of up_down_tb is

component up_down_counter
  Port ( 
  clk: in std_logic;
  rst: in std_logic;
  enb: in std_logic;
  load: in signed(9 downto 0);
  dir: in std_logic;
  output_counter: out signed(9 downto 0)
  );
end component;

constant clk_period : time := 10 ns;

signal clk_sig : std_logic := '0';
signal rst_sig : std_logic := '0';
signal enb_sig: std_logic := '0';
signal load_sig: signed(9 downto 0) := "0101010101";
signal dir_sig: std_logic := '1';
signal op_counter_sig : signed(9 downto 0);

begin

uut: up_down_counter port map(
    clk => clk_sig,
    rst => rst_sig,
    enb => enb_sig,
    load => load_sig,
    dir => dir_sig,
    output_counter => op_counter_sig
);

clk_process :process
begin
clk_sig <= '0';
wait for clk_period/2;
clk_sig <= '1';
wait for clk_period/2;
end process;

enable :process
begin
wait for clk_period *5;
enb_sig <= '1';
wait;
end process;

dir: process
begin
dir_sig <= '1';
wait for clk_period * 10;
dir_sig <= '0';
wait for clk_period * 10;
end process;

load :process
begin
wait for clk_period;
load_sig <= (others => '0');
wait;
end process;

end Behavioral;
