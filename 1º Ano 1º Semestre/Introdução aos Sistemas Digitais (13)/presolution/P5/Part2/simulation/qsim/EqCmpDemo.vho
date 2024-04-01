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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "12/05/2021 19:14:13"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	\16bitcomparator\ IS
    PORT (
	cmpPort : OUT std_logic;
	in0 : IN std_logic_vector(3 DOWNTO 0);
	in1 : IN std_logic_vector(3 DOWNTO 0)
	);
END \16bitcomparator\;

ARCHITECTURE structure OF \16bitcomparator\ IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_cmpPort : std_logic;
SIGNAL ww_in0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_in1 : std_logic_vector(3 DOWNTO 0);
SIGNAL \cmpPort~output_o\ : std_logic;
SIGNAL \in0[0]~input_o\ : std_logic;
SIGNAL \in0[1]~input_o\ : std_logic;
SIGNAL \in1[1]~input_o\ : std_logic;
SIGNAL \in1[0]~input_o\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \in0[2]~input_o\ : std_logic;
SIGNAL \in0[3]~input_o\ : std_logic;
SIGNAL \in1[3]~input_o\ : std_logic;
SIGNAL \in1[2]~input_o\ : std_logic;
SIGNAL \inst4~1_combout\ : std_logic;
SIGNAL \inst4~2_combout\ : std_logic;

BEGIN

cmpPort <= ww_cmpPort;
ww_in0 <= in0;
ww_in1 <= in1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\cmpPort~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~2_combout\,
	devoe => ww_devoe,
	o => \cmpPort~output_o\);

\in0[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in0(0),
	o => \in0[0]~input_o\);

\in0[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in0(1),
	o => \in0[1]~input_o\);

\in1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in1(1),
	o => \in1[1]~input_o\);

\in1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in1(0),
	o => \in1[0]~input_o\);

\inst4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = (\in0[0]~input_o\ & (\in1[0]~input_o\ & (\in0[1]~input_o\ $ (!\in1[1]~input_o\)))) # (!\in0[0]~input_o\ & (!\in1[0]~input_o\ & (\in0[1]~input_o\ $ (!\in1[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in0[0]~input_o\,
	datab => \in0[1]~input_o\,
	datac => \in1[1]~input_o\,
	datad => \in1[0]~input_o\,
	combout => \inst4~0_combout\);

\in0[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in0(2),
	o => \in0[2]~input_o\);

\in0[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in0(3),
	o => \in0[3]~input_o\);

\in1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in1(3),
	o => \in1[3]~input_o\);

\in1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in1(2),
	o => \in1[2]~input_o\);

\inst4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~1_combout\ = (\in0[2]~input_o\ & (\in1[2]~input_o\ & (\in0[3]~input_o\ $ (!\in1[3]~input_o\)))) # (!\in0[2]~input_o\ & (!\in1[2]~input_o\ & (\in0[3]~input_o\ $ (!\in1[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in0[2]~input_o\,
	datab => \in0[3]~input_o\,
	datac => \in1[3]~input_o\,
	datad => \in1[2]~input_o\,
	combout => \inst4~1_combout\);

\inst4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~2_combout\ = (\inst4~0_combout\ & \inst4~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4~0_combout\,
	datab => \inst4~1_combout\,
	combout => \inst4~2_combout\);

ww_cmpPort <= \cmpPort~output_o\;
END structure;


