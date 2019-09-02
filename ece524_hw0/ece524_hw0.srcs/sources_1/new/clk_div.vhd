 library ieee;
 use ieee.std_logic_1164.all;
 
 entity clk_div is
     port (
         clkhalf   :out std_logic;
         enable :in  std_logic;
         clk    :in  std_logic;
         reset  :in  std_logic
     );
 end entity;
 
 architecture rtl of clk_div is
     signal clk_div :std_logic;
 begin
     process (clk, reset) begin
             if (reset = '1') then
             clk_div <= '0';
         elsif (rising_edge(clk)) then
             if (enable = '1') then
                 clk_div <= not clk_div;
             end if;
         end if;
     end process;
     clkhalf <= clk_div;
end architecture;
