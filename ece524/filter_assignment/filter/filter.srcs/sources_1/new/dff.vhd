library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dff is
  port 
    ( 
        d:      in std_logic_vector(36 downto 0);
        clk:    in std_logic;
        q:      out std_logic_vector(36 downto 0)
    );
end dff;

architecture Behavioral of dff is
signal d_sig: std_logic_vector(36 downto 0):= (others => '0');
begin

process(clk)
begin
        report "The value of 'a' is " & integer'image(to_integer(unsigned(d)));

    if rising_edge(clk) then
        d_sig <= d;
    end if;
end process;

q <= d_sig;

end Behavioral;
