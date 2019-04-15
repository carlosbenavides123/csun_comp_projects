library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ca4_tb is
--  Port ( );
end ca4_tb;

architecture Behavioral of ca4_tb is

component ca4 is
    port (
               x : in STD_LOGIC_VECTOR (15 downto 0);
               y : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               prod : out STD_LOGIC_VECTOR (31 downto 0)
          );
end component ca4;

constant CP: time := 10 ns;
signal xin_sig, yin_sig: std_logic_vector(15 downto 0) := "0101010101010101";
signal clk_sig, rst_sig: std_logic;
signal s_op: std_logic_vector(31 downto 0);
begin

uut: ca4 port map(x => xin_sig, y => yin_sig, clk => clk_sig, rst => rst_sig, prod => s_op);

-- clock signal test
process
begin
    clk_sig <= '1';
    wait for CP/2;
    clk_sig <= '0';
    wait for CP/2;
end process;

-- clock signal test
process
begin
    rst_sig <= '0';
    wait;
end process;

---- x
--process
--begin
--    wait for CP;
--    xin_sig <= '0';
--    wait for CP;
--    xin_sig <= '1';
--    wait for CP;
--    xin_sig <= '1';
--    wait for CP;
--    xin_sig <= '0';
--    wait for CP;
--    xin_sig <= '1';
--    wait for CP;
--    xin_sig <= '1';
--    wait for CP;
--    xin_sig <= '0';
--    wait;
--end process;

---- y
--process
--begin
--    yin_sig <= '0';
--    wait for CP;
--    yin_sig <= '1';
--    wait for CP;
--    yin_sig <= '0';
--    wait for CP;
--    yin_sig <= '0';
--    wait for CP;
--    yin_sig <= '1';
--    wait for CP;
--    yin_sig <= '1';
--    wait for CP;
--    yin_sig <= '1';
--    wait for CP;
--    yin_sig <= '0';
--    wait;
--end process;

end Behavioral;