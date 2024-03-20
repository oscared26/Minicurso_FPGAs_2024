Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity simp is
port(
	r,t,g,h: in	std_logic;
	qb:		out std_logic
);
end entity;

architecture logic of simp is
	signal qa: std_logic;
begin

	qa<=r or t;
	qb<=(qa and not (g xor h));

end architecture logic;
