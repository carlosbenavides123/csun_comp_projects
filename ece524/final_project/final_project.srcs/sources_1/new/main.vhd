library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
  port(
    clk:    in std_logic;
    rst:    in std_logic;
    AD0P_R   : in std_logic;
    JA1:    in std_logic_vector(7 downto 0);
    cntr :  out std_logic_vector (7 downto 0)
  );
end main;

architecture Behavioral of main is

COMPONENT xadc_wiz_0
  PORT (
    di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    den_in : IN STD_LOGIC;
    dwe_in : IN STD_LOGIC;
    drdy_out : OUT STD_LOGIC;
    do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    dclk_in : IN STD_LOGIC;
    reset_in : IN STD_LOGIC;
    vp_in : IN STD_LOGIC;
    vn_in : IN STD_LOGIC;
    vauxp0 : IN STD_LOGIC;
    vauxn0 : IN STD_LOGIC;
    user_temp_alarm_out : OUT STD_LOGIC;
    vccint_alarm_out : OUT STD_LOGIC;
    vccaux_alarm_out : OUT STD_LOGIC;
    vccpint_alarm_out : OUT STD_LOGIC;
    vccpaux_alarm_out : OUT STD_LOGIC;
    vccddro_alarm_out : OUT STD_LOGIC;
    ot_out : OUT STD_LOGIC;
    channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    muxaddr_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    eoc_out : OUT STD_LOGIC;
    alarm_out : OUT STD_LOGIC;
    eos_out : OUT STD_LOGIC;
    busy_out : OUT STD_LOGIC
  );
END COMPONENT;

component downscaler 
    port
    (
        clk: in std_logic;
        clock_out: out std_logic
    );
end component;

signal hz_clock: std_logic;

signal XADC_DATA: std_logic_vector(15 downto 0);
signal drdy_out,busy_out,eoc_out,eos_out,alarm_out : std_logic;
signal channel_out : std_logic_vector (4 downto 0);

signal user_temp_alarm_out, vccint_alarm_out, vccaux_alarm_out, vccpint_alarm_out, vccpaux_alarm_out, vccddro_alarm_out, ot_out: std_logic;

signal vauxp0: std_logic;

signal mux_out: std_logic_vector(4 downto 0);

begin

clk_downscaler: downscaler port map(
clk => clk,
clock_out => hz_clock
);

ADC : xadc_wiz_0
  PORT MAP (
    di_in => "0000000000000000",
    daddr_in => "0010111",
    den_in => eoc_out,
    dwe_in => '0',
    drdy_out => drdy_out,
    do_out => XADC_DATA,
    dclk_in => clk,
    reset_in => rst,
    vp_in => '0',
    vn_in => '0',
    vauxp0 => vauxp0,
    vauxn0 => '0',
    user_temp_alarm_out => user_temp_alarm_out,
    vccint_alarm_out => vccint_alarm_out,
    vccaux_alarm_out => vccaux_alarm_out,
    vccpint_alarm_out => vccpint_alarm_out,
    vccpaux_alarm_out => vccpaux_alarm_out,
    vccddro_alarm_out => vccddro_alarm_out,
    ot_out => ot_out,
    channel_out => channel_out,
    muxaddr_out => mux_out,
    eoc_out => eoc_out,
    alarm_out => alarm_out,
    eos_out => eos_out,
    busy_out => busy_out
  );


--process(hz_clock)
--begin
--    if rising_edge(hz_clock) then
--        if JA1 = "00100000" then
--            cntr <= (others => '1');
--        end if;
--    end if;
--end process;

cntr <= XADC_DATA (15 downto 8);
end Behavioral;
