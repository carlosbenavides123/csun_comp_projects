library	IEEE;	
use	IEEE.std_logic_1164.all;	
use	IEEE.std_logic_unsigned.all;	
use	IEEE.numeric_std.all;	

entity up_down_counter is
  Port ( 
  clk: in std_logic;
  rst: in std_logic;
  enb: in std_logic;
  load: in signed(9 downto 0);
  dir: in std_logic;
  output_counter: out signed(9 downto 0)
  );
end up_down_counter;

architecture Behavioral of up_down_counter is
signal op_sig: signed(9 downto 0);
begin

    process(clk, rst)
    begin
        if load /= "0000000000" then
            op_sig <= load;
        end if;
        if rst = '1' then
            op_sig <= (others => '0');
            output_counter <= op_sig;
        elsif enb = '1' then
            if rising_edge(clk) then
                if dir = '1' then
                    op_sig <= op_sig + 1;
                else
                    op_sig <= op_sig - 1;
                end if;
                output_counter <= op_sig;
            end if;
        end if;
    end process;

end Behavioral;
