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
-- Generated on "06/13/2022 14:39:43"
                                                             
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
SIGNAL clk : STD_LOGIC;
SIGNAL Rdx : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Rdy : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Rx : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Ry : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL we : STD_LOGIC;
SIGNAL Wr : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT RegisterBank
	PORT (
	clk : IN STD_LOGIC;
	Rdx : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Rdy : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	Rx : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Ry : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	we : IN STD_LOGIC;
	Wr : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegisterBank
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Rdx => Rdx,
	Rdy => Rdy,
	Rx => Rx,
	Ry => Ry,
	we => we,
	Wr => Wr
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
-- Rdx[1]
t_prcs_Rdx_1: PROCESS
BEGIN
LOOP
	Rdx(1) <= '0';
	WAIT FOR 100000 ps;
	Rdx(1) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Rdx_1;
-- Rdx[0]
t_prcs_Rdx_0: PROCESS
BEGIN
LOOP
	Rdx(0) <= '0';
	WAIT FOR 50000 ps;
	Rdx(0) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Rdx_0;
-- Rdy[1]
t_prcs_Rdy_1: PROCESS
BEGIN
LOOP
	Rdy(1) <= '0';
	WAIT FOR 100000 ps;
	Rdy(1) <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Rdy_1;
-- Rdy[0]
t_prcs_Rdy_0: PROCESS
BEGIN
LOOP
	Rdy(0) <= '0';
	WAIT FOR 50000 ps;
	Rdy(0) <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Rdy_0;

-- we
t_prcs_we: PROCESS
BEGIN
LOOP
	we <= '0';
	WAIT FOR 50000 ps;
	we <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_we;
-- Wr[7]
t_prcs_Wr_7: PROCESS
BEGIN
	Wr(7) <= '0';
	WAIT FOR 100000 ps;
	Wr(7) <= '1';
	WAIT FOR 100000 ps;
	Wr(7) <= '0';
	WAIT FOR 100000 ps;
	Wr(7) <= '1';
	WAIT FOR 100000 ps;
	Wr(7) <= '0';
	WAIT FOR 200000 ps;
	Wr(7) <= '1';
	WAIT FOR 300000 ps;
	Wr(7) <= '0';
WAIT;
END PROCESS t_prcs_Wr_7;
-- Wr[6]
t_prcs_Wr_6: PROCESS
BEGIN
	Wr(6) <= '0';
	WAIT FOR 200000 ps;
	Wr(6) <= '1';
	WAIT FOR 200000 ps;
	Wr(6) <= '0';
	WAIT FOR 100000 ps;
	Wr(6) <= '1';
	WAIT FOR 200000 ps;
	Wr(6) <= '0';
	WAIT FOR 200000 ps;
	Wr(6) <= '1';
WAIT;
END PROCESS t_prcs_Wr_6;
-- Wr[5]
t_prcs_Wr_5: PROCESS
BEGIN
	Wr(5) <= '1';
	WAIT FOR 100000 ps;
	Wr(5) <= '0';
	WAIT FOR 200000 ps;
	Wr(5) <= '1';
	WAIT FOR 100000 ps;
	Wr(5) <= '0';
	WAIT FOR 100000 ps;
	Wr(5) <= '1';
	WAIT FOR 100000 ps;
	Wr(5) <= '0';
	WAIT FOR 200000 ps;
	Wr(5) <= '1';
	WAIT FOR 100000 ps;
	Wr(5) <= '0';
WAIT;
END PROCESS t_prcs_Wr_5;
-- Wr[4]
t_prcs_Wr_4: PROCESS
BEGIN
	Wr(4) <= '0';
	WAIT FOR 100000 ps;
	Wr(4) <= '1';
	WAIT FOR 600000 ps;
	Wr(4) <= '0';
WAIT;
END PROCESS t_prcs_Wr_4;
-- Wr[3]
t_prcs_Wr_3: PROCESS
BEGIN
	Wr(3) <= '1';
	WAIT FOR 100000 ps;
	Wr(3) <= '0';
	WAIT FOR 100000 ps;
	Wr(3) <= '1';
	WAIT FOR 100000 ps;
	Wr(3) <= '0';
	WAIT FOR 200000 ps;
	Wr(3) <= '1';
	WAIT FOR 300000 ps;
	Wr(3) <= '0';
WAIT;
END PROCESS t_prcs_Wr_3;
-- Wr[2]
t_prcs_Wr_2: PROCESS
BEGIN
	Wr(2) <= '0';
	WAIT FOR 500000 ps;
	Wr(2) <= '1';
	WAIT FOR 200000 ps;
	Wr(2) <= '0';
	WAIT FOR 100000 ps;
	Wr(2) <= '1';
	WAIT FOR 100000 ps;
	Wr(2) <= '0';
WAIT;
END PROCESS t_prcs_Wr_2;
-- Wr[1]
t_prcs_Wr_1: PROCESS
BEGIN
	Wr(1) <= '1';
	WAIT FOR 100000 ps;
	Wr(1) <= '0';
	WAIT FOR 300000 ps;
	Wr(1) <= '1';
	WAIT FOR 400000 ps;
	Wr(1) <= '0';
WAIT;
END PROCESS t_prcs_Wr_1;
-- Wr[0]
t_prcs_Wr_0: PROCESS
BEGIN
	Wr(0) <= '0';
	WAIT FOR 500000 ps;
	Wr(0) <= '1';
	WAIT FOR 100000 ps;
	Wr(0) <= '0';
	WAIT FOR 100000 ps;
	Wr(0) <= '1';
WAIT;
END PROCESS t_prcs_Wr_0;
END RegisterBank_arch;
