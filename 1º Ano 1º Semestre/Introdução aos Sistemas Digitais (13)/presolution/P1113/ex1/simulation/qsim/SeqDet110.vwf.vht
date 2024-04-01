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
-- Generated on "01/18/2022 15:43:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SeqDet110
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SeqDet110_vhd_vec_tst IS
END SeqDet110_vhd_vec_tst;
ARCHITECTURE SeqDet110_arch OF SeqDet110_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL x : STD_LOGIC;
SIGNAL y : STD_LOGIC;
COMPONENT SeqDet110
	PORT (
	clk : IN STD_LOGIC;
	x : IN STD_LOGIC;
	y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SeqDet110
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	x => x,
	y => y
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 16
	LOOP
		clk <= '0';
		WAIT FOR 30000 ps;
		clk <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	clk <= '0';
	WAIT FOR 30000 ps;
	clk <= '1';
WAIT;
END PROCESS t_prcs_clk;

-- x
t_prcs_x: PROCESS
BEGIN
	x <= '0';
	WAIT FOR 30000 ps;
	x <= '1';
	WAIT FOR 120000 ps;
	x <= '0';
	WAIT FOR 60000 ps;
	x <= '1';
	WAIT FOR 60000 ps;
	x <= '0';
WAIT;
END PROCESS t_prcs_x;
END SeqDet110_arch;
