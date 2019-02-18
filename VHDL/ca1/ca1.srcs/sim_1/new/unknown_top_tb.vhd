----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2019 10:33:22 PM
-- Design Name: 
-- Module Name: unknown_top_tb - Behavioral
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

entity unknown_top_tb is
--  Port ( );
end unknown_top_tb;

architecture Behavioral of unknown_top_tb is
component unknown_top is
    Port ( xin : in STD_LOGIC_VECTOR (3 downto 0);
           yin : in STD_LOGIC_VECTOR (3 downto 0);
           pout : out STD_LOGIC_VECTOR (7 downto 0));
end component unknown_top;

signal xin_sig, yin_sig:  STD_LOGIC_VECTOR (3 downto 0);
signal pout_sig:  STD_LOGIC_VECTOR (7 downto 0);

begin

uut: unknown_top port map(xin =>xin_sig, yin=>yin_sig, pout =>pout_sig);

process
begin
xin_sig <= "0010";
yin_sig <="0010";
wait for 10ns;

xin_sig <= "0011";
yin_sig <= "0111";
wait for 10ns;

xin_sig <= "1111";
yin_sig <= "1111";
wait for 10ns;

xin_sig <= "0011";
yin_sig <= "0011";
wait for 10ns;

xin_sig <= "0000";
yin_sig <= "0100";
wait;


end process;



end Behavioral;