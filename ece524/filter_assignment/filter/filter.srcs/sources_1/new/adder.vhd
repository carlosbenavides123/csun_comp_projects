library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    port(
        A   :     IN std_logic_vector(36 downto 0);
        B   :     IN std_logic_vector(31 downto 0);
        sum :     OUT std_logic_vector(36 downto 0)
    );
end adder;

architecture Behavioral of adder is
begin
    sum <= std_logic_vector( signed(A) + signed(B) );
end Behavioral;
