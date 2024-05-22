library ieee;
library work;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.tp1_pkg.all;

entity contador_3_30 is
    port(
        rst : in std_logic;
        clk : in std_logic;
        cuenta_1s: in std_logic;
        estado_actual: in t_semaforo_state;
        pasar_estado: out std_logic
        );
end contador_3_30;

architecture behavioral of contador_3_30 is
    constant VALOR_MAXIMO_30S : natural := 29;
    constant VALOR_MAXIMO_3S : natural := 2;
	signal cuenta_3s: unsigned(1 downto 0);
    signal cuenta_30s: unsigned(4 downto 0);

begin
	process(clk,rst)
	begin
		if rst = '1' then
			cuenta_3s <= (others => '0');
			cuenta_30s <= (others => '0');
			pasar_estado <= '0';
		elsif clk = '1' and clk'event then
                case estado_actual is
                    when S0 | S3 =>
                         if cuenta_1s = '1' and cuenta_30s = VALOR_MAXIMO_30S then
                             pasar_estado <= '1';
                         else       
                             pasar_estado <= '0';
                         end if;
                         if cuenta_1s = '1' then
                             if cuenta_30s = VALOR_MAXIMO_30S then
                                 cuenta_30s <= (others=>'0');
                             else
                                 cuenta_30s <= cuenta_30s + 1;
                             end if;
                         end if;
                    when others =>
                         if cuenta_1s = '1' and cuenta_3s = VALOR_MAXIMO_3S then
                             pasar_estado <= '1';
                         else
                             pasar_estado <= '0';
                         end if;
                         if cuenta_1s = '1' then
                             if cuenta_3s = VALOR_MAXIMO_3S then
                                 cuenta_3s <= (others=>'0');
                             else
                                 cuenta_3s <= cuenta_3s + 1;
                             end if;
                         end if;
                end case;
        end if;
	end process;
end behavioral;
