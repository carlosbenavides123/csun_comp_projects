library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    port(
        A :     IN std_logic_vector(15 downto 0);
        B :     IN std_logic_vector(15 downto 0);
        Cin :   IN std_logic;
        sum :     OUT std_logic_vector(19 downto 0);
        Cout :  OUT std_logic
    );
end adder;

architecture Behavioral of adder is
begin
    sum <= ('0' & unsigned(A) + ('0' & unsinged(B)) + Cin;
    
    F      <= result(15 downto 0);
    Cout   <= result(16);

end Behavioral;
