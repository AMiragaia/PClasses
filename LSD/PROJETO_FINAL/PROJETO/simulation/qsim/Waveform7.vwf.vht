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
-- Generated on "06/17/2022 00:18:36"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          BcdDisplay
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY BcdDisplay_vhd_vec_tst IS
END BcdDisplay_vhd_vec_tst;
ARCHITECTURE BcdDisplay_arch OF BcdDisplay_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL led_out1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL led_out2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL led_out3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL led_out4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL rom_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT BcdDisplay
	PORT (
	led_out1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	led_out2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	led_out3 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	led_out4 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	rom_out : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : BcdDisplay
	PORT MAP (
-- list connections between master ports and signals
	led_out1 => led_out1,
	led_out2 => led_out2,
	led_out3 => led_out3,
	led_out4 => led_out4,
	rom_out => rom_out
	);
-- rom_out[7]
t_prcs_rom_out_7: PROCESS
BEGIN
	rom_out(7) <= '1';
WAIT;
END PROCESS t_prcs_rom_out_7;
-- rom_out[6]
t_prcs_rom_out_6: PROCESS
BEGIN
	rom_out(6) <= '0';
WAIT;
END PROCESS t_prcs_rom_out_6;
-- rom_out[5]
t_prcs_rom_out_5: PROCESS
BEGIN
	rom_out(5) <= '1';
WAIT;
END PROCESS t_prcs_rom_out_5;
-- rom_out[4]
t_prcs_rom_out_4: PROCESS
BEGIN
	rom_out(4) <= '0';
WAIT;
END PROCESS t_prcs_rom_out_4;
-- rom_out[3]
t_prcs_rom_out_3: PROCESS
BEGIN
	rom_out(3) <= '1';
WAIT;
END PROCESS t_prcs_rom_out_3;
-- rom_out[2]
t_prcs_rom_out_2: PROCESS
BEGIN
	rom_out(2) <= '0';
WAIT;
END PROCESS t_prcs_rom_out_2;
-- rom_out[1]
t_prcs_rom_out_1: PROCESS
BEGIN
	rom_out(1) <= '0';
WAIT;
END PROCESS t_prcs_rom_out_1;
-- rom_out[0]
t_prcs_rom_out_0: PROCESS
BEGIN
	rom_out(0) <= '1';
WAIT;
END PROCESS t_prcs_rom_out_0;
END BcdDisplay_arch;
