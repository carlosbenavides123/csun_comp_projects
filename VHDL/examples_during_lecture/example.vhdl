library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fadder_tb
end entity fadder_tb;

architecture arch of fadder_tb is

component fadder_tb is 
	port(a, b, cin: in std_logic;
		 sum, cout: out std_logic);
end component

signal a_sig,b_sig,cin_sig,sum_sig,cout_sig : std_logic;
constant PulseWidth: integer := 10ns;
begin 

uut: fadder_tb port map(a=> a_sig, b=> b_sig, cin=> cin_sig, sum=> sum_sig, cout=> cout_sig);

process 
	begin
		a_sig <= '0';
		b_sig <= '0';
		cin_sig <= '0';
		wait for PulseWidth;
		
		a_sig <= '0';
		b_sig <= '0';
		cin_sig <= '1';
		wait for PulseWidth;
		
		a_sig <= '0';
		b_sig <= '1';
		cin_sig <= '0';
		wait for PulseWidth;
		
		a_sig <= '0';
		b_sig <= '1';
		cin_sig <= '1';
		wait for PulseWidth;
		
		a_sig <= '1';
		b_sig <= '0';
		cin_sig <= '0';
		wait for PulseWidth;
		
		a_sig <= '1';
		b_sig <= '0';
		cin_sig <= '1';
		wait for PulseWidth;
		
		a_sig <= '1';
		b_sig <= '1';
		cin_sig <= '0';
		wait for PulseWidth;
		
		a_sig <= '1';
		b_sig <= '1';
		cin_sig <= '1';
		wait;		
end process

end architecture arch;