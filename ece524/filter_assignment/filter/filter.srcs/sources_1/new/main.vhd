library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
  port(
        clk:        in std_logic;
        x_input:    in std_logic_vector(15 downto 0);
        dsp:        out std_logic_vector(36 downto 0)
      );
end main;

architecture Behavioral of main is

component multiplier
  port 
  (
      h: in std_logic_vector(15 downto 0);
      x: in std_logic_vector(15 downto 0);
      conv: out std_logic_vector(31 downto 0)
  );
end component;

component adder
    port(
        A   :     IN std_logic_vector(36 downto 0);
        B   :     IN std_logic_vector(31 downto 0);
        sum :     OUT std_logic_vector(36 downto 0)
    );
end component;

component dff is
  port 
    ( 
        d:      in std_logic_vector(36 downto 0);
        clk:    in std_logic;
        q:      out std_logic_vector(36 downto 0)
    );
end component;

-- ARRAY
type t_Memory is array (0 to 20) of std_logic_vector(15 downto 0);
signal r_Mem : t_Memory;

type d_Memory is array (0 to 20) of std_logic_vector(36 downto 0);
signal dff_op: d_Memory := (others => (others => '0'));

type dsp_Memory is array (0 to 20) of std_logic_vector(31 downto 0);
signal dsp_cache: dsp_Memory := (others => (others => '0'));



 
-- SIGNALS
signal first_one_z: std_logic_vector(36 downto 0);


begin

r_Mem(0 to 20) <= (
0 => x"0",
1 => x"51",
2 => x"0",
3 => x"fee8",
4 => x"0",
5 => x"31d",
6 => x"0",
7 => x"f822",
8 => x"0",
9 => x"1c9c",
10 => x"2e00",
11 => x"1c9c",
12 => x"0",
13 => x"f822",
14 => x"0",
15 => x"31d",
16 => x"0",
17 => x"fee8",
18 => x"0",
19 => x"51",
20 => x"0"
);

generate_everything_lol: for i in 0 to 20 generate

    first: if i = 0 generate
      multiply: multiplier port map
         (
             r_Mem(20 - i),
             x_input,
             dsp_cache(i)
         );
         first_one_z <= "00000" & dsp_cache(i);
         z_delay: dff port map
         (
            first_one_z,
            clk,
            dff_op(i)
         );
     end generate first;

    middle: if i >= 1 and i < 20 generate
        multiply: multiplier port map
         (
             r_Mem(20 - i),
             x_input,
             dsp_cache(i)
         );

         add: adder port map
         (
            dff_op(i - 1),
            dsp_cache(i),
            dff_op(i)
         );

         z_delay: dff port map
         (
            dff_op(i),
            clk,
            dff_op(i + 1)
         );
         

     end generate middle;

     last_one: if i = 20 generate
     
          multiply: multiplier port map
          (
              r_Mem(20 - i),
              x_input,
              dsp_cache(i)
          );
          
          add: adder port map
          (
             dff_op(i),
             dsp_cache(i),
             dsp
          );
     
     end generate last_one;

end generate generate_everything_lol;


end Behavioral;
