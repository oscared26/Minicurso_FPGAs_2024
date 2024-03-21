--*****************************************************************************
--*  DEFINE: Library                                                          *
--*****************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--*****************************************************************************
--*  DEFINE: Entity                                                           *
--*****************************************************************************

entity wrapper_avalon is
	port (
		clk        				: in  std_logic := '0';
		reset      				: in  std_logic := '0';
		avs_s0_chipselect 	: in  std_logic := '0';
		avs_s0_address    	: in  std_logic_vector(3 downto 0) := (others => '0');
		avs_s0_write      	: in  std_logic := '0';
		avs_s0_writedata  	: in  std_logic_vector(31 downto 0) := (others => '0');
		avs_s0_read       	: in  std_logic := '0';	 
		avs_s0_readdata   	: out std_logic_vector(31 downto 0)
		
	     );
end entity wrapper_avalon;

--*****************************************************************************
--*  DEFINE: Architecture                                                     *
--*****************************************************************************

architecture syn of wrapper_avalon is

   --------------------------------------------------------------------------------
   -- Define all components which are included here
   --------------------------------------------------------------------------------

	
	component main IS 
	PORT
	(
		CLOCK_50 	:  IN  STD_LOGIC;
		reset 		:  IN  STD_LOGIC;

		num1 			:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		num2 			:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		num3 			:  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		
	);
	END component main;
	
--------------------------------------------------------------------------------
-- Define all local signals (like static data) here
--------------------------------------------------------------------------------
signal 	to_num1 			: std_logic_vector(7 downto 0):= (others => '0');
signal 	to_num2 			: std_logic_vector(7 downto 0):= (others => '0');
signal 	to_num3 			: std_logic_vector(7 downto 0):= (others => '0');

----------------------------------------------------------------------------------	
	
begin

process(clk)
begin

	if rising_edge(clk) then
	
		if reset='1' then

			to_num1 	<=(others => '0');	
			to_num2 			<=(others => '0');	

----------------------------------------------------------------------------------	
			
		else

			if (avs_s0_write = '1') then

				case avs_s0_address is
				 
					when "0000" => 
						to_num1<=avs_s0_writedata(7 downto 0);--from NIOS II	
							
					when "0001" => 	

						to_num2<=avs_s0_writedata(7 downto 0);--from NIOS II
						
					when others =>----pause
					
						to_num1<=(others => '0');
						to_num2<=(others => '0');			
				 end case;
			end if;


			
			if (avs_s0_read = '1') then	
				case avs_s0_address is
				
					when "0000" =>
						avs_s0_readdata <= X"000000" & to_num3;					
						
					when others=>--Varreduras
						avs_s0_readdata <= (others => '0');						
				end case;
			end if;

		end if; 
	
	end if;
end process;


   ----------------------------------------------
   -- Read Multiplexer
   ----------------------------------------------

   ----------------------------------------------
   -- External output
   ----------------------------------------------
	

	
	
inst_seg : main
port map 
( 
		CLOCK_50 =>clk,
		reset 	=>reset,
		
		num1 		=>to_num1,
		num2 		=>to_num2,
		num3 		=>to_num3

);
								
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
end architecture syn;

