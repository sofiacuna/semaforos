library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tp1_pkg.all;


entity tp1_top is
	generic( 		
		CLKS_1SEG : natural := 50000000
	);
	port(
		rst : in std_logic;
		clk : in std_logic;
		amarillo_1  : out std_logic;
		rojo_1      : out std_logic;
		verde_1     : out std_logic;
		amarillo_2  : out std_logic;
		rojo_2      : out std_logic;
		verde_2     : out std_logic
	);
end tp1_top;

architecture nose of tp1_top is

	constant BITS_COUNTER : natural := 26;
	
	signal cuenta_1s : std_logic;
	signal estado_actual : t_semaforo_state;
	signal pasar_estado : std_logic;
	
	component contador_1s is
        generic (
            N : natural := 26;
            CLKS_1SEG : natural := 50000000
        );
        port(
            rst : in std_logic;
            clk : in std_logic;
            cuenta_1s: out std_logic
        );
	end component;
	
	component contador_3_30 is
        port(
            rst         : in std_logic;
            clk         : in std_logic;
            cuenta_1s   : in std_logic;
            estado_actual: in t_semaforo_state;
            pasar_estado: out std_logic
        );
	end component;
	
	component semaforos is
	   port(
            rst         : in std_logic;
            clk         : in std_logic;
            pasar_estado: in std_logic;
            amarillo_1  : out std_logic;
            rojo_1      : out std_logic;
            verde_1     : out std_logic;
            amarillo_2  : out std_logic;
            rojo_2      : out std_logic;
            verde_2     : out std_logic;
            estado_actual: out t_semaforo_state
        );
	end component;
	
begin
	
	I1: contador_1s
	generic map (
		N => BITS_COUNTER,
		CLKS_1SEG => CLKS_1SEG
	)
	port map(
		rst => rst,
		clk => clk,
		cuenta_1s => cuenta_1s
	);
	
	I2: contador_3_30
	port map(
		rst => rst,
		clk => clk,
		cuenta_1s  => cuenta_1s,
		estado_actual => estado_actual,
		pasar_estado => pasar_estado
	);
	
	I3: semaforos
	port map(
		rst => rst,
		clk => clk,
		pasar_estado => pasar_estado,
		amarillo_1 => amarillo_1,
		rojo_1      => rojo_1,
		verde_1     => verde_1,
		amarillo_2  => amarillo_2,
		rojo_2      => rojo_2,
		verde_2     => verde_2,
		estado_actual => estado_actual
	);
end nose;