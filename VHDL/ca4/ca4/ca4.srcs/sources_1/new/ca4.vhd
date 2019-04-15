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
    port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           prod : out STD_LOGIC_VECTOR (31 downto 0)
         );
end ca4;

architecture Behavioral of ca4 is
signal y_reg, op1, op2 : STD_LOGIC_VECTOR (15 downto 0);
signal prod_sig: std_logic_vector(32 downto 0):= (others=>'0');
signal op1_sel: std_logic;

component sr is
    port(   
            data_in:   in std_logic_vector(15 downto 0);
            rst, clk:  in std_logic;
            sout:      out std_logic
         );
end component;

component test_sr is
    port(   
            data_in: in std_logic_vector(32 downto 0);
            rst, clk : in std_logic;
            sout : out std_logic_vector(15 downto 0)
         );
end component;

begin

x_inp: sr port map(data_in => x, rst => rst, clk => clk, sout => op1_sel);
prod_inp: test_sr port map(data_in => prod_sig, rst => rst, clk => clk, sout => op2);

process(clk, rst)
begin
    if (rising_edge(clk)) then
        y_reg <= y;
        prod <= prod_sig(31 downto 0);
    end if;
end process;

op1 <= y_reg when op1_sel = '1' else (others=> '0');
--MAY NOT BE RIGHT AMOUNT OF 0s
prod_sig <= std_logic_vector(unsigned("00000000000000000" & op1) + unsigned("00000000000000000" & op2));


end Behavioral;
