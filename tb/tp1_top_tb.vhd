library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tp1_pkg.all;

entity tb_tp1_top is

end entity tb_tp1_top;


architecture behavioral of tb_tp1_top is
	signal tb_clk : std_logic := '0';
	signal tb_rst : std_logic ;
	
	
    component tp1_top is
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
    end component;



begin
	tb_rst <= '0', '1' after 1 ns, '0' after 20 ns;
	tb_clk <= not tb_clk after 10 ns;
	
	dut: tp1_top
	generic map( 		
		CLKS_1SEG => 10
	)
	port map(
	    rst => tb_rst,
		clk => tb_clk,
		amarillo_1  => open,
		rojo_1      => open,
		verde_1     => open,
		amarillo_2  => open,
		rojo_2      => open,
		verde_2     => open
	);
	
end behavioral;
