library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;	

entity fib is
GENERIC (N: INTEGER := 8); ------number of bits
    PORT (
    clk, rst : IN std_logic;
    fibo_series : OUT INTEGER RANGE 0 TO 2**N-1
);
end fib;

architecture Behavioral of fib is
SIGNAL a,b,c: INTEGER RANGE 0 TO 2**N-1;

begin

PROCESS (clk,rst)
BEGIN
    IF (rst='1') THEN
        b <= 1;
        c <= 0;
    ELSIF (rising_edge(clk)) THEN
        c <= b;
        b <= a;
    END IF;
    a <= b +c;
END PROCESS;
fibo_series <= c;

end Behavioral;
