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
           load: in std_logic;
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
            rst, clk, load:  in std_logic;
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

signal res :    std_logic_vector (31 downto 0) := (others=>'0');
signal temp_x : std_logic_vector(15 downto 0);
signal temp_sum : std_logic_vector(16 downto 0) := (others => '0');

begin
    temp_x <= x;

    prod_inp:   test_sr port map(data_in => res, rst => rst, clk => clk, sout => res, sout_temp => temppp);
    x_inp:      sr      port map(data_in => temp_x, rst => rst, clk => clk, load => load, sout => op1_sel);

    process(clk, rst, res, y)
    begin
        if (rising_edge(clk)) then
            if op1_sel = '1' then
                op1 <= y_reg;
            else
                op1 <= (others => '0');
             end if;
           temp_sum <= '0' & std_logic_vector(unsigned(op1) + unsigned(temppp));
           res <= "000000000000000" & temp_sum;
        end if;
    end process;
    y_reg <= y;
    prod <= res;
end Behavioral;
