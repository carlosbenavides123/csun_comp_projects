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

-- 500kHz
--din_steady :process
--begin
--x_input_sig <= std_logic_vector(to_signed(0, 16));
--wait for 10ns;     
--x_input_sig <= std_logic_vector(to_signed(19259, 16));
--wait for 10ns;    
--x_input_sig <= std_logic_vector(to_signed(31163, 16));
--wait for 10ns; 
--x_input_sig <= std_logic_vector(to_signed(31163, 16));  
--wait for 10ns;    
--x_input_sig <= std_logic_vector(to_signed(19259, 16)); 
--wait for 10ns;     
--x_input_sig <= std_logic_vector(to_signed(-1, 16));    
--wait for 10ns;
--x_input_sig <= std_logic_vector(to_signed(-19261, 16));  
--wait for 10ns;    
--x_input_sig <= std_logic_vector(to_signed(-31165, 16)); 
--wait for 10ns;     
--x_input_sig <= std_logic_vector(to_signed(-31165, 16));
--wait for 10ns;      
--x_input_sig <= std_logic_vector(to_signed(-19261, 16));      
--wait for 10ns;
--x_input_sig <= std_logic_vector(to_signed(-1, 16));      
--end process;

---- 1.25 Mhz
din_steady :process
begin
x_input_sig <= std_logic_vector(to_signed(0, 16));     
wait for 10ns; 
x_input_sig <= std_logic_vector(to_signed(29600, 16));     
wait for 10ns; 
x_input_sig <= std_logic_vector(to_signed(-25200, 16));     
wait for 10ns; 
x_input_sig <= std_logic_vector(to_signed(-8150, 16));     
wait for 10ns; 
x_input_sig <= std_logic_vector(to_signed(32200, 16));  
wait;
end process;



end Behavioral;
