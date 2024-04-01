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

-- DATE "01/22/2022 10:39:15"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Bin2Gray IS
    PORT (
	y2 : OUT std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	x : IN std_logic;
	y1 : OUT std_logic;
	y0 : OUT std_logic
	);
END Bin2Gray;

ARCHITECTURE structure OF Bin2Gray IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_y2 : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_x : std_logic;
SIGNAL ww_y1 : std_logic;
SIGNAL ww_y0 : std_logic;
SIGNAL \y2~output_o\ : std_logic;
SIGNAL \y1~output_o\ : std_logic;
SIGNAL \y0~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \x~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst~combout\ : std_logic;
SIGNAL \inst7~q\ : std_logic;
SIGNAL \inst8~q\ : std_logic;
SIGNAL \inst6~combout\ : std_logic;
SIGNAL \inst4000~combout\ : std_logic;

BEGIN

y2 <= ww_y2;
ww_clk <= clk;
ww_reset <= reset;
ww_x <= x;
y1 <= ww_y1;
y0 <= ww_y0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\y2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8~q\,
	devoe => ww_devoe,
	o => \y2~output_o\);

\y1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6~combout\,
	devoe => ww_devoe,
	o => \y1~output_o\);

\y0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4000~combout\,
	devoe => ww_devoe,
	o => \y0~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\x~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x,
	o => \x~input_o\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

inst : cycloneive_lcell_comb
-- Equation(s):
-- \inst~combout\ = (\x~input_o\ & \reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x~input_o\,
	datab => \reset~input_o\,
	combout => \inst~combout\);

inst7 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7~q\);

inst8 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \inst7~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst8~q\);

inst6 : cycloneive_lcell_comb
-- Equation(s):
-- \inst6~combout\ = \inst8~q\ $ (\inst7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst8~q\,
	datad => \inst7~q\,
	combout => \inst6~combout\);

inst4000 : cycloneive_lcell_comb
-- Equation(s):
-- \inst4000~combout\ = \inst7~q\ $ (\x~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7~q\,
	datad => \x~input_o\,
	combout => \inst4000~combout\);

ww_y2 <= \y2~output_o\;

ww_y1 <= \y1~output_o\;

ww_y0 <= \y0~output_o\;
END structure;


