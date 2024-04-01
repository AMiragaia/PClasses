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
-- Generated on "06/08/2022 16:53:36"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AddressGenerator
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AddressGenerator_vhd_vec_tst IS
END AddressGenerator_vhd_vec_tst;
ARCHITECTURE AddressGenerator_arch OF AddressGenerator_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL addr : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL en : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT AddressGenerator
	PORT (
	addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	en : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : AddressGenerator
	PORT MAP (
-- list connections between master ports and signals
	addr => addr,
	clk => clk,
	en => en,
	reset => reset
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

-- en
t_prcs_en: PROCESS
BEGIN
	en <= '1';
	WAIT FOR 100000 ps;
	en <= '0';
	WAIT FOR 300000 ps;
	en <= '1';
	WAIT FOR 100000 ps;
	en <= '0';
	WAIT FOR 100000 ps;
	en <= '1';
	WAIT FOR 100000 ps;
	en <= '0';
	WAIT FOR 100000 ps;
	en <= '1';
WAIT;
END PROCESS t_prcs_en;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END AddressGenerator_arch;
