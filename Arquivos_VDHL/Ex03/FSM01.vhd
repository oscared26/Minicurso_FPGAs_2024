-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- Generated by Quartus II Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
-- Created on Tue Mar 19 18:48:00 2024

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FSM01 IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        x : IN STD_LOGIC := '0';
        y : IN STD_LOGIC := '0';
        z : OUT STD_LOGIC
    );
END FSM01;

ARCHITECTURE BEHAVIOR OF FSM01 IS
    TYPE type_fstate IS (cancelar,chamar);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,x,y)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= cancelar;
            z <= '0';
        ELSE
            z <= '0';
            CASE fstate IS
                WHEN cancelar =>
                    IF ((((x = '1') AND (y = '0')) OR ((x = '1') AND (y = '1')))) THEN
                        reg_fstate <= chamar;
                    ELSIF (((x = '0') AND (y = '0'))) THEN
                        reg_fstate <= cancelar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= cancelar;
                    END IF;

                    z <= '0';
                WHEN chamar =>
                    IF (((x = '0') AND (y = '1'))) THEN
                        reg_fstate <= cancelar;
                    ELSIF ((((x = '1') AND (y = '0')) OR ((x = '1') AND (y = '1')))) THEN
                        reg_fstate <= chamar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= chamar;
                    END IF;

                    z <= '1';
                WHEN OTHERS => 
                    z <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;