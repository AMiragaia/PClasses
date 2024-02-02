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
-- Generated on "01/22/2022 18:11:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ShiftReg4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ShiftReg4_vhd_vec_tst IS
END ShiftReg4_vhd_vec_tst;
ARCHITECTURE ShiftReg4_arch OF ShiftReg4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL input1 : STD_LOGIC;
SIGNAL input2 : STD_LOGIC;
SIGNAL input3 : STD_LOGIC;
SIGNAL serial_output : STD_LOGIC;
SIGNAL shift : STD_LOGIC_VECTOR(0 TO 1);
COMPONENT ShiftReg4
	PORT (
	clk : IN STD_LOGIC;
	D : IN STD_LOGIC;
	input1 : IN STD_LOGIC;
	input2 : IN STD_LOGIC;
	input3 : IN STD_LOGIC;
	serial_output : OUT STD_LOGIC;
	shift : IN STD_LOGIC_VECTOR(0 TO 1)
	);
END COMPONENT;
BEGIN
	i1 : ShiftReg4
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	D => D,
	input1 => input1,
	input2 => input2,
	input3 => input3,
	serial_output => serial_output,
	shift => shift
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 50000 ps;
	clk <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '0';
	WAIT FOR 80000 ps;
	D <= '1';
	WAIT FOR 40000 ps;
	D <= '0';
	WAIT FOR 80000 ps;
	D <= '1';
	WAIT FOR 40000 ps;
	D <= '0';
	WAIT FOR 120000 ps;
	D <= '1';
	WAIT FOR 200000 ps;
	D <= '0';
	WAIT FOR 40000 ps;
	D <= '1';
	WAIT FOR 200000 ps;
	D <= '0';
WAIT;
END PROCESS t_prcs_D;

-- input1
t_prcs_input1: PROCESS
BEGIN
	input1 <= '1';
	WAIT FOR 80000 ps;
	input1 <= '0';
	WAIT FOR 80000 ps;
	input1 <= '1';
	WAIT FOR 40000 ps;
	input1 <= '0';
	WAIT FOR 280000 ps;
	input1 <= '1';
	WAIT FOR 120000 ps;
	input1 <= '0';
	WAIT FOR 40000 ps;
	input1 <= '1';
	WAIT FOR 80000 ps;
	input1 <= '0';
	WAIT FOR 40000 ps;
	input1 <= '1';
	WAIT FOR 120000 ps;
	input1 <= '0';
WAIT;
END PROCESS t_prcs_input1;

-- input2
t_prcs_input2: PROCESS
BEGIN
	input2 <= '0';
	WAIT FOR 40000 ps;
	input2 <= '1';
	WAIT FOR 320000 ps;
	input2 <= '0';
	WAIT FOR 40000 ps;
	input2 <= '1';
	WAIT FOR 80000 ps;
	input2 <= '0';
	WAIT FOR 40000 ps;
	input2 <= '1';
	WAIT FOR 40000 ps;
	input2 <= '0';
	WAIT FOR 120000 ps;
	input2 <= '1';
	WAIT FOR 40000 ps;
	input2 <= '0';
	WAIT FOR 40000 ps;
	input2 <= '1';
	WAIT FOR 40000 ps;
	input2 <= '0';
	WAIT FOR 40000 ps;
	input2 <= '1';
	WAIT FOR 80000 ps;
	input2 <= '0';
	WAIT FOR 40000 ps;
	input2 <= '1';
WAIT;
END PROCESS t_prcs_input2;

-- input3
t_prcs_input3: PROCESS
BEGIN
	input3 <= '0';
	WAIT FOR 40000 ps;
	input3 <= '1';
	WAIT FOR 80000 ps;
	input3 <= '0';
	WAIT FOR 80000 ps;
	input3 <= '1';
	WAIT FOR 120000 ps;
	input3 <= '0';
	WAIT FOR 40000 ps;
	input3 <= '1';
	WAIT FOR 40000 ps;
	input3 <= '0';
	WAIT FOR 120000 ps;
	input3 <= '1';
	WAIT FOR 40000 ps;
	input3 <= '0';
	WAIT FOR 80000 ps;
	input3 <= '1';
	WAIT FOR 80000 ps;
	input3 <= '0';
	WAIT FOR 40000 ps;
	input3 <= '1';
	WAIT FOR 40000 ps;
	input3 <= '0';
	WAIT FOR 120000 ps;
	input3 <= '1';
	WAIT FOR 40000 ps;
	input3 <= '0';
WAIT;
END PROCESS t_prcs_input3;
-- shift[1]
t_prcs_shift_1: PROCESS
BEGIN
	shift(1) <= '0';
	WAIT FOR 100000 ps;
	shift(1) <= '1';
	WAIT FOR 100000 ps;
	shift(1) <= '0';
	WAIT FOR 50000 ps;
	shift(1) <= '1';
	WAIT FOR 50000 ps;
	shift(1) <= '0';
	WAIT FOR 50000 ps;
	shift(1) <= '1';
	WAIT FOR 50000 ps;
	shift(1) <= '0';
	WAIT FOR 150000 ps;
	shift(1) <= '1';
	WAIT FOR 50000 ps;
	shift(1) <= '0';
	WAIT FOR 100000 ps;
	shift(1) <= '1';
	WAIT FOR 50000 ps;
	shift(1) <= '0';
	WAIT FOR 100000 ps;
	shift(1) <= '1';
	WAIT FOR 50000 ps;
	shift(1) <= '0';
	WAIT FOR 50000 ps;
	shift(1) <= '1';
WAIT;
END PROCESS t_prcs_shift_1;
-- shift[0]
t_prcs_shift_0: PROCESS
BEGIN
	shift(0) <= '0';
	WAIT FOR 100000 ps;
	shift(0) <= '1';
	WAIT FOR 200000 ps;
	shift(0) <= '0';
	WAIT FOR 50000 ps;
	shift(0) <= '1';
	WAIT FOR 50000 ps;
	shift(0) <= '0';
	WAIT FOR 100000 ps;
	shift(0) <= '1';
	WAIT FOR 100000 ps;
	shift(0) <= '0';
	WAIT FOR 100000 ps;
	shift(0) <= '1';
	WAIT FOR 50000 ps;
	shift(0) <= '0';
	WAIT FOR 50000 ps;
	shift(0) <= '1';
	WAIT FOR 50000 ps;
	shift(0) <= '0';
	WAIT FOR 50000 ps;
	shift(0) <= '1';
	WAIT FOR 50000 ps;
	shift(0) <= '0';
WAIT;
END PROCESS t_prcs_shift_0;
END ShiftReg4_arch;
