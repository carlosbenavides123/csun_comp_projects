----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:10:15 AM
-- Design Name: 
-- Module Name: sa_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sa_top is
  port( 
        x:      in STD_LOGIC_VECTOR(7 downto 0);
        y:      in STD_LOGIC_VECTOR(7 downto 0);
        clk:    in STD_LOGIC;
        rst:    in STD_LOGIC;
        s:      out STD_LOGIC_VECTOR(7 downto 0)
       );
end sa_top;

architecture Behavioral of sa_top is

-- shift register
component sr is
    port( 
          sin:  in STD_LOGIC;
          sout: out STD_LOGIC;
          clk:  in STD_LOGIC;
          rst:  in STD_LOGIC
         );
end component sr;

-- d flip/flop
component dff is 
    port( 
           d:   in STD_LOGIC;
           q:   in STD_LOGIC;
           clk: in STD_LOGIC;
           rst: in STD_LOGIC
           );
end component dff;

-- full adder
component fa is
    port( 
            a:     in STD_LOGIC;
            b:     in STD_LOGIC;
            cin:   in STD_LOGIC;
            sum:   out STD_LOGIC;
            cout:  out STD_LOGIC
         );
end component fa;

signal xi, yi, si: std_logic;
signal xo, yo, so: std_logic;


signal s_temp: std_logic;
signal carry: std_logic;

begin
xi <= x(0);
yi <= y(0);


inp_x_instance:  sr port map(sin => xi, sout => xo, clk => clk, rst => rst);
inp_y_instance:  sr port map(sin => yi, sout => yo, clk => clk, rst => rst);

adder_instace:   fa port map(a => xo, b=> yo, cin => carry, sum => si, cout => carry);

op_s_instance:   sr port map(sin => si, sout => so, clk => clk, rst => rst);

--df_instance: dff port map(d => s_temp, q => s_temp, clk => clk, rst => rst);

    process(clk, s_temp) is
    begin
        if rst = '1' then
            s <= (others=>'0');
        elsif rising_edge(clk) then
            s(0) <= so;
         end if;
    end process;
end Behavioral;
