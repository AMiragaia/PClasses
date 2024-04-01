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
-- Generated on "12/05/2021 19:12:24"
                                                             
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
END 16bitcomparator_arch;
