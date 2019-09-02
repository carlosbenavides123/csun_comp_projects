library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_barrel is
--  Port ( );
end test_barrel;

architecture Behavioral of test_barrel is


component BARREL_SHIFT	
     port(
        DIN	: in std_logic_vector(15 downto	0);	
        SHIFT_AMT: in std_logic_vector(3 downto	0);	
        CLK, ENB : in std_logic;
        DOUT : out std_logic_vector	(15	downto	0)
        );	
end	component;	

signal din_sig: std_logic_vector(15 downto 0) := "0001000100010001";
signal dout_sig: std_logic_vector(15 downto 0) := "0000000000000000";
signal shift_amt_sig: std_logic_vector(3 downto 0):= "0010";
signal clk : std_logic := '0';
signal enb_sig: std_logic := '0';
constant clk_period : time := 10 ns;
begin
uut: BARREL_SHIFT PORT MAP (
DIN => din_sig,
SHIFT_AMT => shift_amt_sig,
CLK => clk,
ENB => enb_sig,
DOUT => dout_sig
);   

clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;

enable :process
begin
wait for clk_period *5;
enb_sig <= '1';
wait for clk_period *5;
end process;


end Behavioral;
