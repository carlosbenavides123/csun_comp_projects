----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/31/2019 01:04:19 AM
-- Design Name: 
-- Module Name: Binary_TB - Behavioral
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

entity Binary_TB is 
end Binary_TB;

architecture Behavioral of Binary_TB is

component Binary_Counter
    Port (ce: in std_logic;
          clk: in std_logic; 
          rst: in std_logic;
          cntr: out std_logic_vector(3 downto 0));
          
end component;
signal ce_sig, clk_sig, rst_sig: std_logic; 
signal cntr_sig: std_logic_vector(3 downto 0);

begin
utt: Binary_Counter port map(ce => ce_sig, clk => clk_sig, rst => rst_sig, cntr => cntr_sig);


end Behavioral;
