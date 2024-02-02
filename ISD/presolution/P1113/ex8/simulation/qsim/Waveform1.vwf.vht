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
-- Generated on "01/22/2022 18:59:42"
                                                             
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
SIGNAL D0 : STD_LOGIC;
SIGNAL D1 : STD_LOGIC;
SIGNAL D2 : STD_LOGIC;
SIGNAL D3 : STD_LOGIC;
SIGNAL ld : STD_LOGIC;
SIGNAL Q0 : STD_LOGIC;
SIGNAL Q1 : STD_LOGIC;
SIGNAL Q2 : STD_LOGIC;
SIGNAL Q3 : STD_LOGIC;
SIGNAL si : STD_LOGIC;
COMPONENT ShiftReg4
	PORT (
	clk : IN STD_LOGIC;
	D0 : IN STD_LOGIC;
	D1 : IN STD_LOGIC;
	D2 : IN STD_LOGIC;
	D3 : IN STD_LOGIC;
	ld : IN STD_LOGIC;
	Q0 : OUT STD_LOGIC;
	Q1 : OUT STD_LOGIC;
	Q2 : OUT STD_LOGIC;
	Q3 : OUT STD_LOGIC;
	si : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ShiftReg4
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	D0 => D0,
	D1 => D1,
	D2 => D2,
	D3 => D3,
	ld => ld,
	Q0 => Q0,
	Q1 => Q1,
	Q2 => Q2,
	Q3 => Q3,
	si => si
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- D0
t_prcs_D0: PROCESS
BEGIN
	D0 <= '0';
	WAIT FOR 50000 ps;
	D0 <= '1';
	WAIT FOR 50000 ps;
	D0 <= '0';
	WAIT FOR 100000 ps;
	D0 <= '1';
	WAIT FOR 100000 ps;
	D0 <= '0';
	WAIT FOR 200000 ps;
	D0 <= '1';
	WAIT FOR 50000 ps;
	D0 <= '0';
	WAIT FOR 50000 ps;
	D0 <= '1';
	WAIT FOR 50000 ps;
	D0 <= '0';
	WAIT FOR 50000 ps;
	D0 <= '1';
	WAIT FOR 50000 ps;
	D0 <= '0';
	WAIT FOR 200000 ps;
	D0 <= '1';
WAIT;
END PROCESS t_prcs_D0;

-- D1
t_prcs_D1: PROCESS
BEGIN
	D1 <= '0';
	WAIT FOR 50000 ps;
	D1 <= '1';
	WAIT FOR 50000 ps;
	D1 <= '0';
	WAIT FOR 100000 ps;
	D1 <= '1';
	WAIT FOR 150000 ps;
	D1 <= '0';
	WAIT FOR 100000 ps;
	D1 <= '1';
	WAIT FOR 100000 ps;
	D1 <= '0';
	WAIT FOR 50000 ps;
	D1 <= '1';
	WAIT FOR 100000 ps;
	D1 <= '0';
	WAIT FOR 150000 ps;
	D1 <= '1';
WAIT;
END PROCESS t_prcs_D1;

-- D2
t_prcs_D2: PROCESS
BEGIN
	D2 <= '0';
	WAIT FOR 150000 ps;
	D2 <= '1';
	WAIT FOR 50000 ps;
	D2 <= '0';
	WAIT FOR 350000 ps;
	D2 <= '1';
	WAIT FOR 50000 ps;
	D2 <= '0';
	WAIT FOR 150000 ps;
	D2 <= '1';
	WAIT FOR 100000 ps;
	D2 <= '0';
WAIT;
END PROCESS t_prcs_D2;

-- D3
t_prcs_D3: PROCESS
BEGIN
	D3 <= '0';
	WAIT FOR 100000 ps;
	D3 <= '1';
	WAIT FOR 200000 ps;
	D3 <= '0';
	WAIT FOR 100000 ps;
	D3 <= '1';
	WAIT FOR 50000 ps;
	D3 <= '0';
	WAIT FOR 150000 ps;
	D3 <= '1';
	WAIT FOR 50000 ps;
	D3 <= '0';
	WAIT FOR 100000 ps;
	D3 <= '1';
	WAIT FOR 50000 ps;
	D3 <= '0';
	WAIT FOR 50000 ps;
	D3 <= '1';
	WAIT FOR 50000 ps;
	D3 <= '0';
WAIT;
END PROCESS t_prcs_D3;

-- ld
t_prcs_ld: PROCESS
BEGIN
	ld <= '0';
	WAIT FOR 100000 ps;
	ld <= '1';
	WAIT FOR 250000 ps;
	ld <= '0';
	WAIT FOR 100000 ps;
	ld <= '1';
	WAIT FOR 50000 ps;
	ld <= '0';
	WAIT FOR 100000 ps;
	ld <= '1';
	WAIT FOR 100000 ps;
	ld <= '0';
WAIT;
END PROCESS t_prcs_ld;

-- si
t_prcs_si: PROCESS
BEGIN
	si <= '1';
	WAIT FOR 100000 ps;
	si <= '0';
	WAIT FOR 100000 ps;
	si <= '1';
	WAIT FOR 200000 ps;
	si <= '0';
	WAIT FOR 150000 ps;
	si <= '1';
	WAIT FOR 100000 ps;
	si <= '0';
	WAIT FOR 150000 ps;
	si <= '1';
	WAIT FOR 100000 ps;
	si <= '0';
WAIT;
END PROCESS t_prcs_si;
END ShiftReg4_arch;
