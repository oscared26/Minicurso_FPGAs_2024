library IEEE;
use ieee.std_logic_1164.all;

entity tb_simp is
end entity tb_simp;


architecture behavorial of tb_simp is

	signal signal_r,signal_t,signal_g,signal_h: std_logic:='0';
	signal signal_qb:std_logic:='0';

	
	signal clk 	: std_logic := '0';
	constant PERIOD     : time :=	20 ns;
	constant DUTY_CYCLE : real := 0.5;
	constant OFFSET     : time := 10 ns;
	
	
	component simp is
	port(
		r,t,g,h: in	std_logic;
		qb:		out std_logic
	);
	end component;	
	
	
begin

	dut:simp
	port map(
		r=>signal_r,
		t=>signal_t,
		g=>signal_g,
		h=>signal_h,
		qb=>signal_qb
	);
	
	signal_r<='0', 	'1' after 10ns,
				'0' after 30ns,
				'1' after 40ns,
				'0' after 60ns,
				'1' after 80ns;

	signal_t<='0', 	'1' after 5ns,
				'0' after 25ns,
				'1' after 55ns,
				'0' after 75ns,
				'1' after 90ns;
				
				
	signal_g<='0', 	'1' after 15ns,
				'0' after 35ns,
				'1' after 45ns,
				'0' after 65ns,
				'1' after 85ns;

	signal_h<='0', 	'1' after 20ns,
				'0' after 50ns,
				'1' after 90ns,
				'0' after 120ns,
				'1' after 150ns;				
				
	
	
	
--------------------------------------------------------------------------------
------------- proceso generador de la senal de clk 
--------------------------------------------------------------------------------
        PROCESS    -- clk process for clk
        BEGIN
            WAIT for OFFSET;
            clk_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP clk_LOOP;
        END PROCESS;		
	
	
	
	
	
	
	
end architecture;