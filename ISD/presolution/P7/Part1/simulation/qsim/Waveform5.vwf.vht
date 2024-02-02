-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/07/2021 15:55:18"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          fun16_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fun16_1_vhd_vec_tst IS
END fun16_1_vhd_vec_tst;
ARCHITECTURE fun16_1_arch OF fun16_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL y : STD_LOGIC;
COMPONENT fun16_1
	PORT (
	S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : fun16_1
	PORT MAP (
-- list connections between master ports and signals
	S => S,
	y => y
	);
-- S[3]
t_prcs_S_3: PROCESS
BEGIN
	S(3) <= '0';
	WAIT FOR 400000 ps;
	S(3) <= '1';
	WAIT FOR 400000 ps;
	S(3) <= '0';
WAIT;
END PROCESS t_prcs_S_3;
-- S[2]
t_prcs_S_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		S(2) <= '0';
		WAIT FOR 200000 ps;
		S(2) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	S(2) <= '0';
WAIT;
END PROCESS t_prcs_S_2;
-- S[1]
t_prcs_S_1: PROCESS
BEGIN
LOOP
	S(1) <= '0';
	WAIT FOR 100000 ps;
	S(1) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_S_1;
-- S[0]
t_prcs_S_0: PROCESS
BEGIN
LOOP
	S(0) <= '0';
	WAIT FOR 50000 ps;
	S(0) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_S_0;
END fun16_1_arch;
