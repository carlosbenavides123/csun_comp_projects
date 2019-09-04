library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;	

entity fsm_tb is
--  Port ( );
end fsm_tb;

architecture Behavioral of fsm_tb is

component fsm is
    port (
            clk : in std_logic;
            reset : in std_logic;
            input : in std_logic;
            output : out std_logic
          );
end component;

constant clk_period : time := 10 ns;
signal clk_sig: std_logic;
signal reset_sig: std_logic := '1';
signal input_sig: std_logic;
signal output_sig: std_logic;

begin

uut: fsm PORT MAP (
    clk => clk_sig,
    reset => reset_sig,
    input => input_sig,
    output => output_sig
);

clk_process :process
    begin
        clk_sig <= '1';
        wait for clk_period/2;
        clk_sig <= '0';
        wait for clk_period/2;
end process;

rst: process
    begin
        reset_sig <= '1';
        wait for clk_period;
        reset_sig <= '0';
        wait;
end process;

main_process :process
    begin
        input_sig <= '0';
        wait for clk_period;
        input_sig <= '1';
        wait for clk_period;
        input_sig <= '0';
        wait for clk_period;
        input_sig <= '1';
        wait for clk_period;
        input_sig <= '1';
        wait for clk_period;
        input_sig <= '0';
        wait;
end process;

end Behavioral;
