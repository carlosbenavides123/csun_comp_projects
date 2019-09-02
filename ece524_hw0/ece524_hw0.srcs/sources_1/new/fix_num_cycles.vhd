library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;	

entity fix_num_cycles is
    generic ( num_cycles : integer := 5); --at least 1
    Port ( 
        enable : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out : inout STD_LOGIC
       );
end fix_num_cycles;

architecture Behavioral of fix_num_cycles is

begin
    process(enable, reset)
    begin
        if(reset='1') then
            clk_out<='0';
        elsif(enable='1') then
            for I in 1 to num_cycles*2 loop
                 clk_out<=not clk_out;
            end loop;
        end if;
    end process;

end Behavioral;
