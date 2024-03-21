library IEEE;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

	entity main IS 
	PORT
	(
		CLOCK_50 	:  IN  STD_LOGIC;
		reset 		:  IN  STD_LOGIC;

		num1 			:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		num2 			:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		num3 			:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		
	);
	END entity;
	
	architecture syn of main is
	
	begin
	
	
	process(CLOCK_50)

	begin
		if (rising_edge(CLOCK_50)) then
			if reset = '1' then

				num3<=(others => '0');
			else

				num3<=num1+num2;
				
			end if;
		end if;
	
	end process;



	
	
	end architecture syn;