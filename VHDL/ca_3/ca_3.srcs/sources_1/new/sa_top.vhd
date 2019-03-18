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
          sin:  in STD_LOGIC_VECTOR(7 downto 0);
          sout: out STD_LOGIC;
          clk:  in STD_LOGIC;
          rst:  in STD_LOGIC
         );
end component sr;

-- shift register
component op_sr is
    port( 
          sin:  in STD_LOGIC;
          sout: out STD_LOGIC_VECTOR(7 downto 0);
          clk:  in STD_LOGIC;
          rst:  in STD_LOGIC
         );
end component op_sr;

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
            clk:    in STD_LOGIC;
            sum:   out STD_LOGIC;
            cout:  out STD_LOGIC
         );
end component fa;

function to_string ( a: std_logic_vector) return string is
variable b : string (1 to a'length) := (others => NUL);
variable stri : integer := 1; 
begin
    for i in a'range loop
        b(stri) := std_logic'image(a((i)))(2);
    stri := stri+1;
    end loop;
return b;
end function;

function ToSLV(i:std_logic) return std_logic_vector is 
variable O:std_logic_vector(0 to 0):=(0=>i); 
begin 
return (0 => i);
end function ToSLV;

signal xi, yi, so: std_logic_vector(7 downto 0);
signal xo, yo: STD_LOGIC;

signal si: STD_LOGIC;

signal s_temp: std_logic;
signal carry: std_logic;

begin
xi(7 downto 0) <= x(7 downto 0);
yi(7 downto 0) <= y(7 downto 0);

inp_x_instance:  sr port map(sin => xi, sout => xo, clk => clk, rst => rst);
inp_y_instance:  sr port map(sin => yi, sout => yo, clk => clk, rst => rst);

adder_instace:   fa port map(a => xo, b=> yo, cin => carry, clk => clk, sum => si, cout => carry);

op_s_instance:   op_sr port map(sin =>  si, sout => so, clk => clk, rst => rst);

--df_instance: dff port map(d => s_temp, q => s_temp, clk => clk, rst => rst);

    process(clk, xo) is
    begin
--        report to_string(so);
--        report to_string(ToSLV(xo));
--        report to_string(ToSLV(yo));

        if rst = '1' then
            s <= (others => '0');
        elsif rising_edge(clk) then
            s <= so;
         end if;
    end process;
end Behavioral;
