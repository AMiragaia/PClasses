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
-- Generated on "12/07/2021 15:23:15"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          mux16_1_e
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mux16_1_e_vhd_vec_tst IS
END mux16_1_e_vhd_vec_tst;
ARCHITECTURE mux16_1_e_arch OF mux16_1_e_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL GND : STD_LOGIC;
SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL x0 : STD_LOGIC;
SIGNAL x1 : STD_LOGIC;
SIGNAL x2 : STD_LOGIC;
SIGNAL x3 : STD_LOGIC;
SIGNAL x4 : STD_LOGIC;
SIGNAL x5 : STD_LOGIC;
SIGNAL x6 : STD_LOGIC;
SIGNAL x7 : STD_LOGIC;
SIGNAL x8 : STD_LOGIC;
SIGNAL x9 : STD_LOGIC;
SIGNAL x10 : STD_LOGIC;
SIGNAL x11 : STD_LOGIC;
SIGNAL x12 : STD_LOGIC;
SIGNAL x13 : STD_LOGIC;
SIGNAL x14 : STD_LOGIC;
SIGNAL x15 : STD_LOGIC;
SIGNAL y : STD_LOGIC;
COMPONENT mux16_1_e
	PORT (
	\GND\ : IN STD_LOGIC;
	S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	x0 : IN STD_LOGIC;
	x1 : IN STD_LOGIC;
	x2 : IN STD_LOGIC;
	x3 : IN STD_LOGIC;
	x4 : IN STD_LOGIC;
	x5 : IN STD_LOGIC;
	x6 : IN STD_LOGIC;
	x7 : IN STD_LOGIC;
	x8 : IN STD_LOGIC;
	x9 : IN STD_LOGIC;
	x10 : IN STD_LOGIC;
	x11 : IN STD_LOGIC;
	x12 : IN STD_LOGIC;
	x13 : IN STD_LOGIC;
	x14 : IN STD_LOGIC;
	x15 : IN STD_LOGIC;
	y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : mux16_1_e
	PORT MAP (
-- list connections between master ports and signals
	\GND\ => GND,
	S => S,
	x0 => x0,
	x1 => x1,
	x2 => x2,
	x3 => x3,
	x4 => x4,
	x5 => x5,
	x6 => x6,
	x7 => x7,
	x8 => x8,
	x9 => x9,
	x10 => x10,
	x11 => x11,
	x12 => x12,
	x13 => x13,
	x14 => x14,
	x15 => x15,
	y => y
	);

-- GND
t_prcs_GND: PROCESS
BEGIN
	GND <= '0';
WAIT;
END PROCESS t_prcs_GND;
-- S[3]
t_prcs_S_3: PROCESS
BEGIN
	S(3) <= '0';
	WAIT FOR 800000 ps;
	S(3) <= '1';
	WAIT FOR 800000 ps;
	S(3) <= '0';
WAIT;
END PROCESS t_prcs_S_3;
-- S[2]
t_prcs_S_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		S(2) <= '0';
		WAIT FOR 400000 ps;
		S(2) <= '1';
		WAIT FOR 400000 ps;
	END LOOP;
	S(2) <= '0';
WAIT;
END PROCESS t_prcs_S_2;
-- S[1]
t_prcs_S_1: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		S(1) <= '0';
		WAIT FOR 200000 ps;
		S(1) <= '1';
		WAIT FOR 200000 ps;
	END LOOP;
	S(1) <= '0';
WAIT;
END PROCESS t_prcs_S_1;
-- S[0]
t_prcs_S_0: PROCESS
BEGIN
LOOP
	S(0) <= '0';
	WAIT FOR 100000 ps;
	S(0) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1800000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_S_0;

-- x0
t_prcs_x0: PROCESS
BEGIN
	x0 <= '1';
	WAIT FOR 100000 ps;
	x0 <= '0';
WAIT;
END PROCESS t_prcs_x0;

-- x1
t_prcs_x1: PROCESS
BEGIN
	x1 <= '0';
	WAIT FOR 100000 ps;
	x1 <= '1';
	WAIT FOR 100000 ps;
	x1 <= '0';
WAIT;
END PROCESS t_prcs_x1;

-- x2
t_prcs_x2: PROCESS
BEGIN
	x2 <= '0';
	WAIT FOR 200000 ps;
	x2 <= '1';
	WAIT FOR 100000 ps;
	x2 <= '0';
WAIT;
END PROCESS t_prcs_x2;

-- x3
t_prcs_x3: PROCESS
BEGIN
	x3 <= '0';
	WAIT FOR 300000 ps;
	x3 <= '1';
	WAIT FOR 100000 ps;
	x3 <= '0';
WAIT;
END PROCESS t_prcs_x3;

-- x4
t_prcs_x4: PROCESS
BEGIN
	x4 <= '0';
	WAIT FOR 400000 ps;
	x4 <= '1';
	WAIT FOR 100000 ps;
	x4 <= '0';
WAIT;
END PROCESS t_prcs_x4;

-- x5
t_prcs_x5: PROCESS
BEGIN
	x5 <= '0';
	WAIT FOR 500000 ps;
	x5 <= '1';
	WAIT FOR 100000 ps;
	x5 <= '0';
WAIT;
END PROCESS t_prcs_x5;

-- x6
t_prcs_x6: PROCESS
BEGIN
	x6 <= '0';
	WAIT FOR 600000 ps;
	x6 <= '1';
	WAIT FOR 100000 ps;
	x6 <= '0';
WAIT;
END PROCESS t_prcs_x6;

-- x7
t_prcs_x7: PROCESS
BEGIN
	x7 <= '0';
	WAIT FOR 700000 ps;
	x7 <= '1';
	WAIT FOR 100000 ps;
	x7 <= '0';
WAIT;
END PROCESS t_prcs_x7;

-- x8
t_prcs_x8: PROCESS
BEGIN
	x8 <= '0';
	WAIT FOR 800000 ps;
	x8 <= '1';
	WAIT FOR 100000 ps;
	x8 <= '0';
WAIT;
END PROCESS t_prcs_x8;

-- x9
t_prcs_x9: PROCESS
BEGIN
	x9 <= '0';
	WAIT FOR 900000 ps;
	x9 <= '1';
	WAIT FOR 100000 ps;
	x9 <= '0';
WAIT;
END PROCESS t_prcs_x9;

-- x10
t_prcs_x10: PROCESS
BEGIN
	x10 <= '0';
	WAIT FOR 1000000 ps;
	x10 <= '1';
	WAIT FOR 100000 ps;
	x10 <= '0';
WAIT;
END PROCESS t_prcs_x10;

-- x11
t_prcs_x11: PROCESS
BEGIN
	x11 <= '0';
	WAIT FOR 1100000 ps;
	x11 <= '1';
	WAIT FOR 100000 ps;
	x11 <= '0';
WAIT;
END PROCESS t_prcs_x11;

-- x12
t_prcs_x12: PROCESS
BEGIN
	x12 <= '0';
	WAIT FOR 1200000 ps;
	x12 <= '1';
	WAIT FOR 100000 ps;
	x12 <= '0';
WAIT;
END PROCESS t_prcs_x12;

-- x13
t_prcs_x13: PROCESS
BEGIN
	x13 <= '0';
	WAIT FOR 1300000 ps;
	x13 <= '1';
	WAIT FOR 100000 ps;
	x13 <= '0';
WAIT;
END PROCESS t_prcs_x13;

-- x14
t_prcs_x14: PROCESS
BEGIN
	x14 <= '0';
	WAIT FOR 1400000 ps;
	x14 <= '1';
	WAIT FOR 100000 ps;
	x14 <= '0';
WAIT;
END PROCESS t_prcs_x14;

-- x15
t_prcs_x15: PROCESS
BEGIN
	x15 <= '0';
	WAIT FOR 1500000 ps;
	x15 <= '1';
	WAIT FOR 100000 ps;
	x15 <= '0';
WAIT;
END PROCESS t_prcs_x15;
END mux16_1_e_arch;
