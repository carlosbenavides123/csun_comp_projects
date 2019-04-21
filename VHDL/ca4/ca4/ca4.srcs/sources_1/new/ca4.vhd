----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2019 10:31:54 AM
-- Design Name: 
-- Module Name: ca4 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ca4 is
    port (
           x    : in std_logic_vector (15 downto 0);
           y    : in std_logic_vector (15 downto 0);
           clk  : in std_logic;
           rst  : in std_logic;
           prod : out std_logic_vector (31 downto 0)
         );
end ca4;

architecture Behavioral of ca4 is

signal y_reg, op1, op2, temppp :    std_logic_vector (15 downto 0) := (others=>'0');
signal prod_sig:            std_logic_vector(31 downto 0) := (others=>'0');
signal temp_sr:             std_logic_vector(31 downto 0) := (others=>'0');
signal op1_sel:             std_logic := '0';

component sr is
    port(
            data_in:   in std_logic_vector(15 downto 0);
            rst, clk:  in std_logic;
            sout:      out std_logic
         );
end component;

component test_sr is
    port(
            data_in:    in std_logic_vector(31 downto 0);
            rst, clk :  in std_logic;
            sout :      out std_logic_vector(31 downto 0);
            sout_temp:   out std_logic_vector(15 downto 0)
         );
end component;


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

signal res :    std_logic_vector (31 downto 0) := (others=>'0');

begin

    x_inp:      sr      port map(data_in => x, rst => rst, clk => clk, sout => op1_sel);
--    prod_inp:   test_sr port map(data_in => prod_sig, rst => rst, clk => clk, sout => res);
     prod_inp:   test_sr port map(data_in => prod_sig, rst => rst, clk => clk, sout => res, sout_temp => temppp);

--     op1 <= y_reg when op1_sel = '1' else (others=> '0');

    process(clk, rst, temppp, res, y_reg)

    begin
--        report to_string(temppp);
--    report to_string(res);
--    report to_string(prod_sig);
    report to_string(op1);
--    report to_string(x);
--    report to_string(op1);
    report to_string(TOSLV(op1_sel));
        if rising_edge(clk) then
        if op1_sel = '1' then
            op1 <= y_reg;
        else
            op1 <= (others => '0');
         end if;
        res <= std_logic_vector(unsigned("0000000000000000" & op1) + unsigned("0000000000000000" & temppp));
--            res <= std_logic_vector("0000000000000000" & temppp);
            prod_sig <= res;
--            prod_sig <= '1' & prod_sig(31 downto 1);

        end if;
     end process;

    process(clk, rst, prod_sig, res, y)
    begin
        if (rising_edge(clk)) then
            y_reg <= y;
            prod <= res;
        end if;
    end process;



--


end Behavioral;
