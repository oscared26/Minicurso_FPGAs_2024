Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity sistema is
port(
	clk	: 	in	std_logic;
	chamar:	in std_logic;
	cancelar:	in std_logic;
	lampada:	out std_logic
	
);
end entity;

architecture logic of sistema is
	signal q,d: std_logic;
begin

	d<=chamar or ((not cancelar) and q);
	
	process(clk)
	begin
		if rising_edge(clk) then
			q<=d;
		end if;
	
	end process;

		lampada<=q;
end architecture logic;