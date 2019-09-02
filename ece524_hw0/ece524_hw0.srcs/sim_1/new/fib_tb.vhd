library	IEEE;	           
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;

entity fib_tb is
--  Port ( );
end fib_tb;

architecture Behavioral of fib_tb is

component fib
GENERIC (N: INTEGER := 8); ------number of bits     
    PORT (                                          
    clk, rst : IN std_logic;                        
    fibo_series : OUT INTEGER RANGE 0 TO 2**N-1     
);                                                  
end component;                                            

constant clk_period : time := 10 ns;

signal clk_sig: std_logic := '1';
signal reset_sig: std_logic := '1';
signal fib_sig: integer;
begin

uut: fib PORT MAP (
    clk => clk_sig,
    rst => reset_sig,
    fibo_series => fib_sig
);

clk_process :process
begin
clk_sig <= '1';
wait for clk_period/2;
clk_sig <= '0';
wait for clk_period/2;
end process;


rst :process
begin
reset_sig <= '1';
wait for clk_period * 2;
reset_sig <= '0';
wait;
end process;


end Behavioral;
