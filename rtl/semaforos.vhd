library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.tp1_pkg.all;

entity semaforos is
	port(
		rst : in std_logic;
		clk : in std_logic;
		pasar_estado: in std_logic;
		amarillo_1  : out std_logic;
		rojo_1      : out std_logic;
		verde_1     : out std_logic;
		amarillo_2  : out std_logic;
		rojo_2      : out std_logic;
		verde_2     : out std_logic;
		estado_actual: out t_semaforo_state	
		);
end semaforos;

architecture behavioral of semaforos is
	signal estado : t_semaforo_state;

begin
	process(clk,rst)
	begin
		if rst='1' then
			estado <= S0;
			amarillo_1  <= '0';
            rojo_1		<= '0';
            verde_1  	<= '1';
            amarillo_2  <= '0';
            rojo_2 		<= '1';
            verde_2 	<= '0';
            estado_actual <= S0;
		elsif clk = '1' and clk'event then
			case estado is
				when S0 =>
					if pasar_estado = '1' then
						estado <= S1;
						amarillo_1  <= '1';
                        rojo_1		<= '0';
                        verde_1  	<= '0';
                        amarillo_2  <= '0';
                        rojo_2 		<= '1';
                        verde_2 	<= '0';
                        estado_actual <= S1;
					end if;
				when S1 =>
					if pasar_estado = '1' then
						estado <= S2;
					    amarillo_1  <= '0';
					    rojo_1		<= '1';
					    verde_1  	<= '0';
					    amarillo_2  <= '1';
					    rojo_2 		<= '0';
					    verde_2 	<= '0';
					    estado_actual <= S2;
					end if;
				when S2 =>
					if pasar_estado = '1' then
						estado <= S3;
                        amarillo_1  <= '0';
                        rojo_1		<= '1';
                        verde_1  	<= '0';
                        amarillo_2  <= '0';
                        rojo_2 		<= '0';
                        verde_2 	<= '1';
                        estado_actual <= S3;
					end if;
				when S3 =>
					if pasar_estado = '1' then
						estado <= S4;
                        amarillo_1  <= '0';
                        rojo_1		<= '1';
                        verde_1  	<= '0';
                        amarillo_2  <= '1';
                        rojo_2 		<= '0';
                        verde_2 	<= '0';
                        estado_actual <= S4;
					end if;
				when S4 =>
					if pasar_estado = '1' then
						estado <= S5;
                        amarillo_1  <= '1';
                        rojo_1		<= '0';
                        verde_1  	<= '0';
                        amarillo_2  <= '0';
                        rojo_2 		<= '1';
                        verde_2 	<= '0';
                        estado_actual <= S5;
					end if;
				when S5 =>
					if pasar_estado = '1' then
						estado <= S0;
                        amarillo_1  <= '0';
                        rojo_1		<= '0';
                        verde_1  	<= '1';
                        amarillo_2  <= '0';
                        rojo_2 		<= '1';
                        verde_2 	<= '0';
                        estado_actual <= S0;
					end if;
			end case;
		end if;
	end process;
end behavioral;
