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
        x:      in STD_LOGIC;
        y:      in STD_LOGIC;
        clk:    in STD_LOGIC;
        rst:    in STD_LOGIC;
        s:      in STD_LOGIC;
        ou:     out STD_LOGIC
       );
end sa_top;

architecture Behavioral of sa_top is

---- shift register
--component sr is
--    port( 
--          sin:  in STD_LOGIC;
--          sout: out STD_LOGIC;
--          clk:  in STD_LOGIC;
--          rst:  in STD_LOGIC
--         );
--end component sr;

---- d flip/flop
--component dff is 
--    port( 
--           d:   in STD_LOGIC;
--           q:   in STD_LOGIC;
--           clk: in STD_LOGIC;
--           rst: in STD_LOGIC
--           );
--end component dff;

---- full adder
--component fa is
--    port( 
--            a:     in STD_LOGIC;
--            b:     in STD_LOGIC;
--            cin:   in STD_LOGIC;
--            sum:   out STD_LOGIC;
--            cout:  out STD_LOGIC
--         );
--end component fa;

--signal xi, yi, si: std_logic;

begin

--inp_x_instance:  sr port map(sin => x, sout => xi, clk => clk, rst => rst);
--inp_y_instance:  sr port map(sin => y, sout => yi, clk => clk, rst => rst);
--op_s_instance:   sr port map(sin => s, sout => si, clk => clk, rst => rst);

    process(clk) is
    begin
--        xi <= xi xor yi xor si;
--        si <= (xi and yi) or (xi and si) or (yi and si);
       ou <= '1';
    end process;
end Behavioral;
