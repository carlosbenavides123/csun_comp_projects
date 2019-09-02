library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fix_num_cycles_tb is
--  Port ( );
end fix_num_cycles_tb;

architecture Behavioral of fix_num_cycles_tb is
component fix_num_cycles
    generic ( num_cycles : integer := 5); --at least 1
    Port ( 
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out : inout STD_LOGIC
       );
end component;

  signal enable: STD_LOGIC := '1';
  signal reset: STD_LOGIC := '0';
  signal clk_out_sig: STD_LOGIC;
  signal num_cycles: INTEGER := 5;
begin

  uut: fix_num_cycles generic map ( num_cycles =>  num_cycles)
                      port map ( enable     => enable,
                                 reset      => reset,
                                 clk_out        => clk_out_sig );

  stimulus: process
  begin
    reset<='1';
    enable<='1';
    wait for 50 ns;
    reset <= '0';
    wait for 50 ns;
    reset <= '1';
    wait;
  end process;
end Behavioral;
