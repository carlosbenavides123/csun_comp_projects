----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2019 06:27:15 PM
-- Design Name: 
-- Module Name: ca6_top - Behavioral
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

entity ca6_top is
    port (
            clk, rst:   in std_logic;
            sum_out:    out std_logic_vector(15 downto 0)   
         );
end ca6_top;

architecture Behavioral of ca6_top is

component blk_mem_gen_0
  port (
    clka :          IN STD_LOGIC;
    ena :           IN STD_LOGIC;
    wea :           IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra :         IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina :          IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta :         OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
end component;

component blk_mem_gen_1 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END component;


signal cntrl, cntrb:       unsigned(9 downto 0);
signal addr, addrb:        std_logic_vector(9 downto 0);
signal sum_sig, ram_out, ram_out_b, add_out, ram_out_sig: std_logic_vector(15 downto 0);
signal re, reb:          std_logic;
signal we, web:          std_logic_vector(0 downto 0);
signal sum_sig_b: std_logic_vector(15 downto 0);
type STATE_TYPE is (s0, s1, s2, s3);
signal state, next_state: state_type;

begin

--ram_instance: blk_mem_gen_0
--    port map(
--        clka    =>       clk,
--        ena     =>       re,
--        wea     =>       we,
--        addra   =>       addr,
--        dina    =>       sum_sig,
--        douta   =>       ram_out
--       );


dual_port_instance: blk_mem_gen_1
    port map(
        clka =>       clk,
        ena =>       re,
        wea =>       we,
        addra =>       addr,
        dina  =>       sum_sig,
        douta   => ram_out,
        clkb    =>       clk,
        enb     =>  reb,
        web     =>  web,
        addrb   => addrb,
        dinb    =>  (others => '0'),
        doutb   => ram_out_b
    );

output_decode: process(state)
       begin
           if state = s0 then
               re <= '1';
               reb <= '0';
               we <= "0";
               web <= "0";
           elsif state = s1 then
               re <= '1';
               reb <= '1';
               we <= "0";
               web <= "0";
           elsif state = s2 then
               re <= '0';
               reb <= '0';
               web <= "0";
               we <= "0";
           elsif state = s3 then
               re <= '0';
               we <= "1";
           else
               re <= '0';
               we <= "0";
           end if;
       end process;

next_state_decode: process(state)
begin

    next_state <= state;

    case(state) is
        when s0 =>
            next_state <= s1;
        when s1 =>
            next_state <= s2;
        when s2 =>
            next_state <= s3;
        when s3 =>
            next_state <= s0;
        when others =>
            next_state <= s0;
        end case;
    end process;

process(clk)
begin
    if rising_edge(clk) then
        if rst='1' then
            state <= next_state;
        end if;
   end if;
end process;

sum_out <= sum_sig;

process(clk, rst)
begin
    if rst = '1' then
        cntrl <= (others => '0');
    elsif rising_edge(clk) then
        cntrl <= cntrl + 1;
        cntrb <= cntrl + 1;
    end if;
end process;

addr <= std_logic_vector(cntrl);
addrb <= std_logic_vector(cntrb);

process(clk, rst)
begin
    if rst='1' then
        sum_sig <= (others => '0');
        ram_out_sig <= (others => '0');
    elsif rising_edge(clk) then
        sum_sig <= add_out;
        ram_out_sig <= ram_out;
    end if;
end process;

add_out <= std_logic_vector(unsigned(ram_out) + unsigned(ram_out_sig));

end Behavioral;
