library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_1s is
	generic (
		N : natural := 26;
		CLKS_1SEG : natural := 50000000
	);
	port(
		rst : in std_logic;
		clk : in std_logic;
		cuenta_1s: out std_logic
	   );
end contador_1s;

architecture behavioral of contador_1s is
	signal aux_count: unsigned(N-1 downto 0);

begin
	process(clk,rst)
	begin
		if rst='1' then
			aux_count <= (others => '0');
			cuenta_1s <= '0';
		elsif clk = '1' and clk'event then
			if aux_count = CLKS_1SEG-1 then
				cuenta_1s <= '1';
				aux_count <= (others => '0');
			else
				aux_count <= aux_count + 1;
				cuenta_1s <= '0';
			end if;
		end if;
	end process;
end behavioral;
