library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;	

entity	BARREL_SHIFT	is	
     port(
        DIN	: in std_logic_vector(15 downto	0);	
        SHIFT_AMT: in std_logic_vector(3 downto	0);	
        CLK, ENB : in std_logic;
        DOUT : out std_logic_vector	(15	downto	0)
        );	
end	BARREL_SHIFT;	

architecture Behavioral of BARREL_SHIFT is
signal DIN_BIT, DOUT_BIT : bit_vector (15 downto 0);
signal num_shift : integer;
begin
DIN_BIT <= to_bitvector(DIN);
num_shift <= CONV_INTEGER(SHIFT_AMT);
process(CLK)
    begin
        if(CLK' event and CLK='1') then
            if(ENB = '0') then
                DOUT <= DIN;
            else
                DOUT_BIT <= DIN_BIT ror num_shift;
                DOUT <= to_stdlogicvector(DOUT_BIT);
            end if;
        end if;
    end process;
end Behavioral;
