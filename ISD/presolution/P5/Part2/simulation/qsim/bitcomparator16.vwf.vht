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
-- Generated on "12/05/2021 19:14:12"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          16bitcomparator
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY 16bitcomparator_vhd_vec_tst IS
END 16bitcomparator_vhd_vec_tst;
ARCHITECTURE 16bitcomparator_arch OF 16bitcomparator_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cmpPort : STD_LOGIC;
SIGNAL in0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL in1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT 16bitcomparator
	PORT (
	cmpPort : OUT STD_LOGIC;
	in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	in1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : 16bitcomparator
	PORT MAP (
-- list connections between master ports and signals
	cmpPort => cmpPort,
	in0 => in0,
	in1 => in1
	);
-- in0[3]
t_prcs_in0_3: PROCESS
BEGIN
	in0(3) <= '0';
WAIT;
END PROCESS t_prcs_in0_3;
-- in0[2]
t_prcs_in0_2: PROCESS
BEGIN
	in0(2) <= '0';
WAIT;
END PROCESS t_prcs_in0_2;
-- in0[1]
t_prcs_in0_1: PROCESS
BEGIN
	in0(1) <= '0';
WAIT;
END PROCESS t_prcs_in0_1;
-- in0[0]
t_prcs_in0_0: PROCESS
BEGIN
	in0(0) <= '0';
WAIT;
END PROCESS t_prcs_in0_0;
-- in1[3]
t_prcs_in1_3: PROCESS
BEGIN
	in1(3) <= '0';
	WAIT FOR 100000 ps;
	in1(3) <= '1';
	WAIT FOR 100000 ps;
	in1(3) <= '0';
	WAIT FOR 50000 ps;
	in1(3) <= '1';
	WAIT FOR 50000 ps;
	in1(3) <= '0';
	WAIT FOR 400000 ps;
	in1(3) <= '1';
	WAIT FOR 100000 ps;
	in1(3) <= '0';
	WAIT FOR 100000 ps;
	in1(3) <= '1';
	WAIT FOR 50000 ps;
	in1(3) <= '0';
WAIT;
END PROCESS t_prcs_in1_3;
-- in1[2]
t_prcs_in1_2: PROCESS
BEGIN
	in1(2) <= '1';
	WAIT FOR 50000 ps;
	in1(2) <= '0';
	WAIT FOR 50000 ps;
	in1(2) <= '1';
	WAIT FOR 150000 ps;
	in1(2) <= '0';
	WAIT FOR 50000 ps;
	in1(2) <= '1';
	WAIT FOR 50000 ps;
	in1(2) <= '0';
	WAIT FOR 250000 ps;
	in1(2) <= '1';
	WAIT FOR 50000 ps;
	in1(2) <= '0';
	WAIT FOR 100000 ps;
	in1(2) <= '1';
	WAIT FOR 100000 ps;
	in1(2) <= '0';
WAIT;
END PROCESS t_prcs_in1_2;
-- in1[1]
t_prcs_in1_1: PROCESS
BEGIN
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
	WAIT FOR 100000 ps;
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
	WAIT FOR 50000 ps;
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
	WAIT FOR 100000 ps;
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
	WAIT FOR 50000 ps;
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
	WAIT FOR 50000 ps;
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
	WAIT FOR 100000 ps;
	in1(1) <= '0';
	WAIT FOR 50000 ps;
	in1(1) <= '1';
WAIT;
END PROCESS t_prcs_in1_1;
-- in1[0]
t_prcs_in1_0: PROCESS
BEGIN
	in1(0) <= '0';
	WAIT FOR 50000 ps;
	in1(0) <= '1';
	WAIT FOR 150000 ps;
	in1(0) <= '0';
	WAIT FOR 50000 ps;
	in1(0) <= '1';
	WAIT FOR 50000 ps;
	in1(0) <= '0';
	WAIT FOR 50000 ps;
	in1(0) <= '1';
	WAIT FOR 350000 ps;
	in1(0) <= '0';
	WAIT FOR 50000 ps;
	in1(0) <= '1';
	WAIT FOR 100000 ps;
	in1(0) <= '0';
	WAIT FOR 50000 ps;
	in1(0) <= '1';
WAIT;
END PROCESS t_prcs_in1_0;
END 16bitcomparator_arch;
