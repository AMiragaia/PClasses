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
-- Generated on "06/16/2022 11:39:58"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          RegisterBank
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegisterBank_vhd_vec_tst IS
END RegisterBank_vhd_vec_tst;
ARCHITECTURE RegisterBank_arch OF RegisterBank_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL DataOut1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataOut2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataOut3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DataOut4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Reset : STD_LOGIC;
SIGNAL WE : STD_LOGIC;
SIGNAL WriteData : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT RegisterBank
	PORT (
	DataOut1 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataOut2 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataOut3 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	DataOut4 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	Reset : IN STD_LOGIC;
	WE : IN STD_LOGIC;
	WriteData : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegisterBank
	PORT MAP (
-- list connections between master ports and signals
	DataOut1 => DataOut1,
	DataOut2 => DataOut2,
	DataOut3 => DataOut3,
	DataOut4 => DataOut4,
	Reset => Reset,
	WE => WE,
	WriteData => WriteData
	);

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '0';
WAIT;
END PROCESS t_prcs_Reset;

-- WE
t_prcs_WE: PROCESS
BEGIN
LOOP
	WE <= '0';
	WAIT FOR 50000 ps;
	WE <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_WE;
-- WriteData[7]
t_prcs_WriteData_7: PROCESS
BEGIN
	WriteData(7) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_7;
-- WriteData[6]
t_prcs_WriteData_6: PROCESS
BEGIN
	WriteData(6) <= '0';
	WAIT FOR 640000 ps;
	WriteData(6) <= '1';
	WAIT FOR 120000 ps;
	WriteData(6) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_6;
-- WriteData[5]
t_prcs_WriteData_5: PROCESS
BEGIN
	WriteData(5) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_5;
-- WriteData[4]
t_prcs_WriteData_4: PROCESS
BEGIN
	WriteData(4) <= '0';
	WAIT FOR 480000 ps;
	WriteData(4) <= '1';
	WAIT FOR 160000 ps;
	WriteData(4) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_4;
-- WriteData[3]
t_prcs_WriteData_3: PROCESS
BEGIN
	WriteData(3) <= '0';
	WAIT FOR 320000 ps;
	WriteData(3) <= '1';
	WAIT FOR 160000 ps;
	WriteData(3) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_3;
-- WriteData[2]
t_prcs_WriteData_2: PROCESS
BEGIN
	WriteData(2) <= '0';
	WAIT FOR 240000 ps;
	WriteData(2) <= '1';
	WAIT FOR 80000 ps;
	WriteData(2) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_2;
-- WriteData[1]
t_prcs_WriteData_1: PROCESS
BEGIN
	WriteData(1) <= '0';
	WAIT FOR 140000 ps;
	WriteData(1) <= '1';
	WAIT FOR 100000 ps;
	WriteData(1) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_1;
-- WriteData[0]
t_prcs_WriteData_0: PROCESS
BEGIN
	WriteData(0) <= '1';
	WAIT FOR 140000 ps;
	WriteData(0) <= '0';
WAIT;
END PROCESS t_prcs_WriteData_0;
END RegisterBank_arch;
