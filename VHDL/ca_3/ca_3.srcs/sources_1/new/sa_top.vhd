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
  Port ( x: in STD_LOGIC;
         y: in STD_LOGIC;
         clk: in STD_LOGIC;
         rst: in STD_LOGIC;
         s: in STD_LOGIC );
end sa_top;

architecture Behavioral of sa_top is

component sr is
    port ( sin : in STD_LOGIC;
           sout : out STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component sr;

component dff is 
    port ( d: in STD_LOGIC;
           q: in STD_LOGIC;
           clk: in STD_LOGIC;
           rst: in STD_LOGIC
           )
end component;

signal xi, yi, si: std_logic;

begin

inpx_instance: sr port map(sin => x, sout => xi, clk => clk, rst => rst);
inpy_instance: sr port map(sin => y, sout => yi, clk => clk, rst => rst);
ops_instance: sr port map(sin => s, sout => si, clk => clk, rst => rst);

end Behavioral;
