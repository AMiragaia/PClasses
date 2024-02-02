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
-- Generated on "12/21/2021 15:13:03"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          teste1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY teste1_vhd_vec_tst IS
END teste1_vhd_vec_tst;
ARCHITECTURE teste1_arch OF teste1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL i0 : STD_LOGIC;
SIGNAL i1 : STD_LOGIC;
SIGNAL i2 : STD_LOGIC;
SIGNAL i3 : STD_LOGIC;
SIGNAL i4 : STD_LOGIC;
SIGNAL i5 : STD_LOGIC;
SIGNAL i6 : STD_LOGIC;
SIGNAL i7 : STD_LOGIC;
SIGNAL S : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL y : STD_LOGIC;
COMPONENT teste1
	PORT (
	i0 : IN STD_LOGIC;
	i1 : IN STD_LOGIC;
	i2 : IN STD_LOGIC;
	i3 : IN STD_LOGIC;
	i4 : IN STD_LOGIC;
	i5 : IN STD_LOGIC;
	i6 : IN STD_LOGIC;
	i7 : IN STD_LOGIC;
	S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : teste1
	PORT MAP (
-- list connections between master ports and signals
	i0 => i0,
	i1 => i1,
	i2 => i2,
	i3 => i3,
	i4 => i4,
	i5 => i5,
	i6 => i6,
	i7 => i7,
	S => S,
	y => y
	);

-- i0
t_prcs_i0: PROCESS
BEGIN
	i0 <= '0';
WAIT;
END PROCESS t_prcs_i0;

-- i1
t_prcs_i1: PROCESS
BEGIN
	i1 <= '0';
WAIT;
END PROCESS t_prcs_i1;

-- i2
t_prcs_i2: PROCESS
BEGIN
	i2 <= '0';
WAIT;
END PROCESS t_prcs_i2;

-- i3
t_prcs_i3: PROCESS
BEGIN
	i3 <= '0';
WAIT;
END PROCESS t_prcs_i3;

-- i4
t_prcs_i4: PROCESS
BEGIN
	i4 <= '0';
WAIT;
END PROCESS t_prcs_i4;

-- i5
t_prcs_i5: PROCESS
BEGIN
	i5 <= '0';
WAIT;
END PROCESS t_prcs_i5;

-- i6
t_prcs_i6: PROCESS
BEGIN
	i6 <= '0';
WAIT;
END PROCESS t_prcs_i6;

-- i7
t_prcs_i7: PROCESS
BEGIN
	i7 <= '0';
WAIT;
END PROCESS t_prcs_i7;
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
END teste1_arch;
