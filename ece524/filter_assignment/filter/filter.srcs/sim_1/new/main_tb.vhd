library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main_tb is

end main_tb;

architecture Behavioral of main_tb is


-- COMPONENTS

component main is
  port(
      clk:        in std_logic;
      x_input:    in std_logic_vector(15 downto 0);
      dsp:        out std_logic_vector(36 downto 0)
    );
end component;

-- CONST

constant clk_period : time := 10 ns;


-- SIGNALS

signal clk_sig: std_logic;
signal x_input_sig: std_logic_vector(15 downto 0);
signal dsp_sig: std_logic_vector(36 downto 0):= (others => '0');

begin

main_comp: main port map
(
    clk => clk_sig,
    x_input => x_input_sig,
    dsp => dsp_sig
);



clk_process :process
begin
clk_sig <= '0';
wait for clk_period/2;
clk_sig <= '1';
wait for clk_period/2;
end process;


-- 8 Mhz
din_steady :process
begin
--wait for clk_period;
x_input_sig <= std_logic_vector(to_signed(0, 16));      
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(77041, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(124655, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(124655, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(77041, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(0, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(-77041, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(-124655, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(-124655, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(-77041, 16));
wait for 10ns;
x_input_sig <= std_logic_vector(to_signed(0, 16));
end process;

-- 16Mhz

--din_steady_v2 :process
--begin
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(0, 18));      
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(498627, 18));
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(-308168, 18));
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(-308168, 18));
--wait for 12.5ns;
--end process;


-- 24Mhz

--din_steady_v3 :process
--begin
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(0, 18));      
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(498627, 18));
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(308168, 18));
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(-308168, 18));
--wait for 12.5ns;
--d_sig <= std_logic_vector(to_signed(58882, 18));
--wait for 12.5ns;
--end process;


end Behavioral;
