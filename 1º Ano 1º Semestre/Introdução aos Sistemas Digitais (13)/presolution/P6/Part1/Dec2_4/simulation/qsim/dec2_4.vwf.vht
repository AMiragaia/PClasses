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
-- Generated on "12/05/2021 20:20:35"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Dec2_4t
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Dec2_4t_vhd_vec_tst IS
END Dec2_4t_vhd_vec_tst;
ARCHITECTURE Dec2_4t_arch OF Dec2_4t_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E0 : STD_LOGIC;
SIGNAL E1 : STD_LOGIC;
SIGNAL x0 : STD_LOGIC;
SIGNAL X1 : STD_LOGIC;
SIGNAL y0 : STD_LOGIC;
SIGNAL y1 : STD_LOGIC;
SIGNAL y2 : STD_LOGIC;
SIGNAL y3 : STD_LOGIC;
COMPONENT Dec2_4t
	PORT (
	E0 : IN STD_LOGIC;
	E1 : IN STD_LOGIC;
	x0 : IN STD_LOGIC;
	X1 : IN STD_LOGIC;
	y0 : OUT STD_LOGIC;
	y1 : OUT STD_LOGIC;
	y2 : OUT STD_LOGIC;
	y3 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Dec2_4t
	PORT MAP (
-- list connections between master ports and signals
	E0 => E0,
	E1 => E1,
	x0 => x0,
	X1 => X1,
	y0 => y0,
	y1 => y1,
	y2 => y2,
	y3 => y3
	);

-- E0
t_prcs_E0: PROCESS
BEGIN
	E0 <= '0';
WAIT;
END PROCESS t_prcs_E0;

-- E1
t_prcs_E1: PROCESS
BEGIN
	E1 <= '1';
WAIT;
END PROCESS t_prcs_E1;

-- x0
t_prcs_x0: PROCESS
BEGIN
LOOP
	x0 <= '0';
	WAIT FOR 100000 ps;
	x0 <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_x0;

-- X1
t_prcs_X1: PROCESS
BEGIN
LOOP
	X1 <= '0';
	WAIT FOR 50000 ps;
	X1 <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_X1;
END Dec2_4t_arch;
