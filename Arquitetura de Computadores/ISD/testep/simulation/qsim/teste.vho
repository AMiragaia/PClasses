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

-- DATE "12/21/2021 15:13:03"

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

ENTITY 	teste1 IS
    PORT (
	y : OUT std_logic;
	i1 : IN std_logic;
	S : IN std_logic_vector(2 DOWNTO 0);
	i0 : IN std_logic;
	i4 : IN std_logic;
	i6 : IN std_logic;
	i2 : IN std_logic;
	i3 : IN std_logic;
	i5 : IN std_logic;
	i7 : IN std_logic
	);
END teste1;

ARCHITECTURE structure OF teste1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_y : std_logic;
SIGNAL ww_i1 : std_logic;
SIGNAL ww_S : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_i0 : std_logic;
SIGNAL ww_i4 : std_logic;
SIGNAL ww_i6 : std_logic;
SIGNAL ww_i2 : std_logic;
SIGNAL ww_i3 : std_logic;
SIGNAL ww_i5 : std_logic;
SIGNAL ww_i7 : std_logic;
SIGNAL \y~output_o\ : std_logic;
SIGNAL \i3~input_o\ : std_logic;
SIGNAL \i2~input_o\ : std_logic;
SIGNAL \S[0]~input_o\ : std_logic;
SIGNAL \S[2]~input_o\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \i1~input_o\ : std_logic;
SIGNAL \i0~input_o\ : std_logic;
SIGNAL \inst4~1_combout\ : std_logic;
SIGNAL \S[1]~input_o\ : std_logic;
SIGNAL \inst4~2_combout\ : std_logic;
SIGNAL \i7~input_o\ : std_logic;
SIGNAL \i6~input_o\ : std_logic;
SIGNAL \inst4~3_combout\ : std_logic;
SIGNAL \i5~input_o\ : std_logic;
SIGNAL \i4~input_o\ : std_logic;
SIGNAL \inst4~4_combout\ : std_logic;
SIGNAL \inst4~5_combout\ : std_logic;

BEGIN

y <= ww_y;
ww_i1 <= i1;
ww_S <= S;
ww_i0 <= i0;
ww_i4 <= i4;
ww_i6 <= i6;
ww_i2 <= i2;
ww_i3 <= i3;
ww_i5 <= i5;
ww_i7 <= i7;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\y~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4~5_combout\,
	devoe => ww_devoe,
	o => \y~output_o\);

\i3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i3,
	o => \i3~input_o\);

\i2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i2,
	o => \i2~input_o\);

\S[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(0),
	o => \S[0]~input_o\);

\S[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(2),
	o => \S[2]~input_o\);

\inst4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = (!\S[2]~input_o\ & ((\S[0]~input_o\ & (\i3~input_o\)) # (!\S[0]~input_o\ & ((\i2~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i3~input_o\,
	datab => \i2~input_o\,
	datac => \S[0]~input_o\,
	datad => \S[2]~input_o\,
	combout => \inst4~0_combout\);

\i1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i1,
	o => \i1~input_o\);

\i0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i0,
	o => \i0~input_o\);

\inst4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~1_combout\ = (!\S[2]~input_o\ & ((\S[0]~input_o\ & (\i1~input_o\)) # (!\S[0]~input_o\ & ((\i0~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1~input_o\,
	datab => \i0~input_o\,
	datac => \S[0]~input_o\,
	datad => \S[2]~input_o\,
	combout => \inst4~1_combout\);

\S[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(1),
	o => \S[1]~input_o\);

\inst4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~2_combout\ = (\S[1]~input_o\ & (\inst4~0_combout\)) # (!\S[1]~input_o\ & ((\inst4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4~0_combout\,
	datab => \inst4~1_combout\,
	datad => \S[1]~input_o\,
	combout => \inst4~2_combout\);

\i7~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i7,
	o => \i7~input_o\);

\i6~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i6,
	o => \i6~input_o\);

\inst4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~3_combout\ = (\S[2]~input_o\ & ((\S[0]~input_o\ & (\i7~input_o\)) # (!\S[0]~input_o\ & ((\i6~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[2]~input_o\,
	datab => \i7~input_o\,
	datac => \i6~input_o\,
	datad => \S[0]~input_o\,
	combout => \inst4~3_combout\);

\i5~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i5,
	o => \i5~input_o\);

\i4~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i4,
	o => \i4~input_o\);

\inst4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~4_combout\ = (\S[2]~input_o\ & ((\S[0]~input_o\ & (\i5~input_o\)) # (!\S[0]~input_o\ & ((\i4~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[2]~input_o\,
	datab => \i5~input_o\,
	datac => \i4~input_o\,
	datad => \S[0]~input_o\,
	combout => \inst4~4_combout\);

\inst4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst4~5_combout\ = (\inst4~2_combout\) # ((\S[1]~input_o\ & (\inst4~3_combout\)) # (!\S[1]~input_o\ & ((\inst4~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4~2_combout\,
	datab => \inst4~3_combout\,
	datac => \inst4~4_combout\,
	datad => \S[1]~input_o\,
	combout => \inst4~5_combout\);

ww_y <= \y~output_o\;
END structure;


