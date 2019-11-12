library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiplier is
  port 
    (
        h: in std_logic_vector(15 downto 0);
        x: in std_logic_vector(15 downto 0);
        conv: out std_logic_vector(31 downto 0)
    );
end multiplier;

architecture Behavioral of multiplier is

begin

conv <= std_logic_vector(signed(h) * signed(x));

end Behavioral;
