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
-- Generated on "06/17/2022 00:46:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AritmeticUnit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AritmeticUnit_vhd_vec_tst IS
END AritmeticUnit_vhd_vec_tst;
ARCHITECTURE AritmeticUnit_arch OF AritmeticUnit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL filter_on : STD_LOGIC;
SIGNAL operand1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL operand2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL operand3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL operand4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Result : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT AritmeticUnit
	PORT (
	filter_on : IN STD_LOGIC;
	operand1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	operand2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	operand3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	operand4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : AritmeticUnit
	PORT MAP (
-- list connections between master ports and signals
	filter_on => filter_on,
	operand1 => operand1,
	operand2 => operand2,
	operand3 => operand3,
	operand4 => operand4,
	Result => Result
	);
-- operand1[7]
t_prcs_operand1_7: PROCESS
BEGIN
	operand1(7) <= '0';
WAIT;
END PROCESS t_prcs_operand1_7;
-- operand1[6]
t_prcs_operand1_6: PROCESS
BEGIN
	operand1(6) <= '0';
WAIT;
END PROCESS t_prcs_operand1_6;
-- operand1[5]
t_prcs_operand1_5: PROCESS
BEGIN
	operand1(5) <= '0';
WAIT;
END PROCESS t_prcs_operand1_5;
-- operand1[4]
t_prcs_operand1_4: PROCESS
BEGIN
	operand1(4) <= '0';
WAIT;
END PROCESS t_prcs_operand1_4;
-- operand1[3]
t_prcs_operand1_3: PROCESS
BEGIN
	operand1(3) <= '0';
WAIT;
END PROCESS t_prcs_operand1_3;
-- operand1[2]
t_prcs_operand1_2: PROCESS
BEGIN
	operand1(2) <= '0';
WAIT;
END PROCESS t_prcs_operand1_2;
-- operand1[1]
t_prcs_operand1_1: PROCESS
BEGIN
	operand1(1) <= '1';
WAIT;
END PROCESS t_prcs_operand1_1;
-- operand1[0]
t_prcs_operand1_0: PROCESS
BEGIN
	operand1(0) <= '1';
WAIT;
END PROCESS t_prcs_operand1_0;
-- operand2[7]
t_prcs_operand2_7: PROCESS
BEGIN
	operand2(7) <= '0';
WAIT;
END PROCESS t_prcs_operand2_7;
-- operand2[6]
t_prcs_operand2_6: PROCESS
BEGIN
	operand2(6) <= '0';
WAIT;
END PROCESS t_prcs_operand2_6;
-- operand2[5]
t_prcs_operand2_5: PROCESS
BEGIN
	operand2(5) <= '0';
WAIT;
END PROCESS t_prcs_operand2_5;
-- operand2[4]
t_prcs_operand2_4: PROCESS
BEGIN
	operand2(4) <= '0';
WAIT;
END PROCESS t_prcs_operand2_4;
-- operand2[3]
t_prcs_operand2_3: PROCESS
BEGIN
	operand2(3) <= '0';
WAIT;
END PROCESS t_prcs_operand2_3;
-- operand2[2]
t_prcs_operand2_2: PROCESS
BEGIN
	operand2(2) <= '1';
WAIT;
END PROCESS t_prcs_operand2_2;
-- operand2[1]
t_prcs_operand2_1: PROCESS
BEGIN
	operand2(1) <= '0';
WAIT;
END PROCESS t_prcs_operand2_1;
-- operand2[0]
t_prcs_operand2_0: PROCESS
BEGIN
	operand2(0) <= '1';
WAIT;
END PROCESS t_prcs_operand2_0;
-- operand3[7]
t_prcs_operand3_7: PROCESS
BEGIN
	operand3(7) <= '0';
WAIT;
END PROCESS t_prcs_operand3_7;
-- operand3[6]
t_prcs_operand3_6: PROCESS
BEGIN
	operand3(6) <= '0';
WAIT;
END PROCESS t_prcs_operand3_6;
-- operand3[5]
t_prcs_operand3_5: PROCESS
BEGIN
	operand3(5) <= '0';
WAIT;
END PROCESS t_prcs_operand3_5;
-- operand3[4]
t_prcs_operand3_4: PROCESS
BEGIN
	operand3(4) <= '0';
WAIT;
END PROCESS t_prcs_operand3_4;
-- operand3[3]
t_prcs_operand3_3: PROCESS
BEGIN
	operand3(3) <= '0';
WAIT;
END PROCESS t_prcs_operand3_3;
-- operand3[2]
t_prcs_operand3_2: PROCESS
BEGIN
	operand3(2) <= '0';
WAIT;
END PROCESS t_prcs_operand3_2;
-- operand3[1]
t_prcs_operand3_1: PROCESS
BEGIN
	operand3(1) <= '1';
WAIT;
END PROCESS t_prcs_operand3_1;
-- operand3[0]
t_prcs_operand3_0: PROCESS
BEGIN
	operand3(0) <= '1';
WAIT;
END PROCESS t_prcs_operand3_0;
-- operand4[7]
t_prcs_operand4_7: PROCESS
BEGIN
	operand4(7) <= '0';
WAIT;
END PROCESS t_prcs_operand4_7;
-- operand4[6]
t_prcs_operand4_6: PROCESS
BEGIN
	operand4(6) <= '0';
WAIT;
END PROCESS t_prcs_operand4_6;
-- operand4[5]
t_prcs_operand4_5: PROCESS
BEGIN
	operand4(5) <= '0';
WAIT;
END PROCESS t_prcs_operand4_5;
-- operand4[4]
t_prcs_operand4_4: PROCESS
BEGIN
	operand4(4) <= '0';
WAIT;
END PROCESS t_prcs_operand4_4;
-- operand4[3]
t_prcs_operand4_3: PROCESS
BEGIN
	operand4(3) <= '1';
WAIT;
END PROCESS t_prcs_operand4_3;
-- operand4[2]
t_prcs_operand4_2: PROCESS
BEGIN
	operand4(2) <= '0';
WAIT;
END PROCESS t_prcs_operand4_2;
-- operand4[1]
t_prcs_operand4_1: PROCESS
BEGIN
	operand4(1) <= '0';
WAIT;
END PROCESS t_prcs_operand4_1;
-- operand4[0]
t_prcs_operand4_0: PROCESS
BEGIN
	operand4(0) <= '0';
WAIT;
END PROCESS t_prcs_operand4_0;

-- filter_on
t_prcs_filter_on: PROCESS
BEGIN
	filter_on <= '1';
WAIT;
END PROCESS t_prcs_filter_on;
END AritmeticUnit_arch;
