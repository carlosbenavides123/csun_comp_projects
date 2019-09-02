library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;

entity clk_div_tb is
--  Port ( );
end clk_div_tb;

architecture Behavioral of clk_div_tb is
    component clk_div
      Port (
              clk : in std_logic;
              clkhalf: out std_logic;
              enable :in  std_logic;
              reset:in  std_logic
            );
    end component;

constant clk_period : time := 10 ns;
signal clk_sig: std_logic := '1';
signal clkhalf_sig: std_logic := '0';
signal enable_sig: std_logic := '1';
signal reset_sig: std_logic := '0';

begin

uut: clk_div PORT MAP (
    clk => clk_sig,
    clkhalf => clkhalf_sig,
    enable => enable_sig,
    reset => reset_sig
);

clk_process :process
begin
clk_sig <= '1';
wait for clk_period/2;
clk_sig <= '0';
wait for clk_period/2;
end process;

--main :process
--begin
--wait for clk_period * 2;
--reset_sig <= '1';
--wait for clk_period * 2;
--reset_sig <= '0';
--wait;
--end process;

end Behavioral;
