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

-- DATE "12/06/2021 13:28:52"

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

ENTITY 	Dec4_16 IS
    PORT (
	y0 : OUT std_logic;
	\gnd\ : IN std_logic;
	E0 : IN std_logic;
	E1 : IN std_logic;
	X3 : IN std_logic;
	X2 : IN std_logic;
	x1 : IN std_logic;
	x0 : IN std_logic;
	y2 : OUT std_logic;
	y1 : OUT std_logic;
	y3 : OUT std_logic;
	y4 : OUT std_logic;
	y5 : OUT std_logic;
	y6 : OUT std_logic;
	y7 : OUT std_logic;
	y8 : OUT std_logic;
	y9 : OUT std_logic;
	y10 : OUT std_logic;
	y11 : OUT std_logic;
	y12 : OUT std_logic;
	y13 : OUT std_logic;
	y14 : OUT std_logic;
	y15 : OUT std_logic
	);
END Dec4_16;

ARCHITECTURE structure OF Dec4_16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_y0 : std_logic;
SIGNAL \ww_gnd\ : std_logic;
SIGNAL ww_E0 : std_logic;
SIGNAL ww_E1 : std_logic;
SIGNAL ww_X3 : std_logic;
SIGNAL ww_X2 : std_logic;
SIGNAL ww_x1 : std_logic;
SIGNAL ww_x0 : std_logic;
SIGNAL ww_y2 : std_logic;
SIGNAL ww_y1 : std_logic;
SIGNAL ww_y3 : std_logic;
SIGNAL ww_y4 : std_logic;
SIGNAL ww_y5 : std_logic;
SIGNAL ww_y6 : std_logic;
SIGNAL ww_y7 : std_logic;
SIGNAL ww_y8 : std_logic;
SIGNAL ww_y9 : std_logic;
SIGNAL ww_y10 : std_logic;
SIGNAL ww_y11 : std_logic;
SIGNAL ww_y12 : std_logic;
SIGNAL ww_y13 : std_logic;
SIGNAL ww_y14 : std_logic;
SIGNAL ww_y15 : std_logic;
SIGNAL \y0~output_o\ : std_logic;
SIGNAL \y2~output_o\ : std_logic;
SIGNAL \y1~output_o\ : std_logic;
SIGNAL \y3~output_o\ : std_logic;
SIGNAL \y4~output_o\ : std_logic;
SIGNAL \y5~output_o\ : std_logic;
SIGNAL \y6~output_o\ : std_logic;
SIGNAL \y7~output_o\ : std_logic;
SIGNAL \y8~output_o\ : std_logic;
SIGNAL \y9~output_o\ : std_logic;
SIGNAL \y10~output_o\ : std_logic;
SIGNAL \y11~output_o\ : std_logic;
SIGNAL \y12~output_o\ : std_logic;
SIGNAL \y13~output_o\ : std_logic;
SIGNAL \y14~output_o\ : std_logic;
SIGNAL \y15~output_o\ : std_logic;
SIGNAL \E1~input_o\ : std_logic;
SIGNAL \X2~input_o\ : std_logic;
SIGNAL \X3~input_o\ : std_logic;
SIGNAL \E0~input_o\ : std_logic;
SIGNAL \inst7|inst3~combout\ : std_logic;
SIGNAL \x0~input_o\ : std_logic;
SIGNAL \gnd~input_o\ : std_logic;
SIGNAL \x1~input_o\ : std_logic;
SIGNAL \inst11|inst3~combout\ : std_logic;
SIGNAL \inst11|inst2~combout\ : std_logic;
SIGNAL \inst11|inst1~combout\ : std_logic;
SIGNAL \inst11|inst~combout\ : std_logic;
SIGNAL \inst7|inst1~combout\ : std_logic;
SIGNAL \inst10|inst3~combout\ : std_logic;
SIGNAL \inst10|inst1~combout\ : std_logic;
SIGNAL \inst10|inst2~combout\ : std_logic;
SIGNAL \inst10|inst~combout\ : std_logic;
SIGNAL \inst7|inst2~combout\ : std_logic;
SIGNAL \inst9|inst3~combout\ : std_logic;
SIGNAL \inst9|inst1~combout\ : std_logic;
SIGNAL \inst9|inst2~combout\ : std_logic;
SIGNAL \inst9|inst~combout\ : std_logic;
SIGNAL \inst7|inst~combout\ : std_logic;
SIGNAL \inst8|inst3~combout\ : std_logic;
SIGNAL \inst8|inst1~combout\ : std_logic;
SIGNAL \inst8|inst2~combout\ : std_logic;
SIGNAL \inst8|inst~combout\ : std_logic;

BEGIN

y0 <= ww_y0;
\ww_gnd\ <= \gnd\;
ww_E0 <= E0;
ww_E1 <= E1;
ww_X3 <= X3;
ww_X2 <= X2;
ww_x1 <= x1;
ww_x0 <= x0;
y2 <= ww_y2;
y1 <= ww_y1;
y3 <= ww_y3;
y4 <= ww_y4;
y5 <= ww_y5;
y6 <= ww_y6;
y7 <= ww_y7;
y8 <= ww_y8;
y9 <= ww_y9;
y10 <= ww_y10;
y11 <= ww_y11;
y12 <= ww_y12;
y13 <= ww_y13;
y14 <= ww_y14;
y15 <= ww_y15;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\y0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst3~combout\,
	devoe => ww_devoe,
	o => \y0~output_o\);

\y2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst2~combout\,
	devoe => ww_devoe,
	o => \y2~output_o\);

\y1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1~combout\,
	devoe => ww_devoe,
	o => \y1~output_o\);

\y3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst~combout\,
	devoe => ww_devoe,
	o => \y3~output_o\);

\y4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst3~combout\,
	devoe => ww_devoe,
	o => \y4~output_o\);

\y5~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst1~combout\,
	devoe => ww_devoe,
	o => \y5~output_o\);

\y6~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst2~combout\,
	devoe => ww_devoe,
	o => \y6~output_o\);

\y7~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst~combout\,
	devoe => ww_devoe,
	o => \y7~output_o\);

\y8~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst3~combout\,
	devoe => ww_devoe,
	o => \y8~output_o\);

\y9~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1~combout\,
	devoe => ww_devoe,
	o => \y9~output_o\);

\y10~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst2~combout\,
	devoe => ww_devoe,
	o => \y10~output_o\);

\y11~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst~combout\,
	devoe => ww_devoe,
	o => \y11~output_o\);

\y12~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|inst3~combout\,
	devoe => ww_devoe,
	o => \y12~output_o\);

\y13~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|inst1~combout\,
	devoe => ww_devoe,
	o => \y13~output_o\);

\y14~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|inst2~combout\,
	devoe => ww_devoe,
	o => \y14~output_o\);

\y15~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|inst~combout\,
	devoe => ww_devoe,
	o => \y15~output_o\);

\E1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E1,
	o => \E1~input_o\);

\X2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X2,
	o => \X2~input_o\);

\X3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X3,
	o => \X3~input_o\);

\E0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E0,
	o => \E0~input_o\);

\inst7|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|inst3~combout\ = (\E1~input_o\ & (!\X2~input_o\ & (!\X3~input_o\ & !\E0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \E1~input_o\,
	datab => \X2~input_o\,
	datac => \X3~input_o\,
	datad => \E0~input_o\,
	combout => \inst7|inst3~combout\);

\x0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x0,
	o => \x0~input_o\);

\gnd~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_gnd\,
	o => \gnd~input_o\);

\x1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_x1,
	o => \x1~input_o\);

\inst11|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|inst3~combout\ = (\inst7|inst3~combout\ & (!\x0~input_o\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst3~combout\,
	datab => \x0~input_o\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst11|inst3~combout\);

\inst11|inst2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|inst2~combout\ = (\inst7|inst3~combout\ & (\x1~input_o\ & (!\x0~input_o\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst3~combout\,
	datab => \x1~input_o\,
	datac => \x0~input_o\,
	datad => \gnd~input_o\,
	combout => \inst11|inst2~combout\);

\inst11|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|inst1~combout\ = (\inst7|inst3~combout\ & (\x0~input_o\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst3~combout\,
	datab => \x0~input_o\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst11|inst1~combout\);

\inst11|inst\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|inst~combout\ = (\inst7|inst3~combout\ & (\x0~input_o\ & (\x1~input_o\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst3~combout\,
	datab => \x0~input_o\,
	datac => \x1~input_o\,
	datad => \gnd~input_o\,
	combout => \inst11|inst~combout\);

\inst7|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|inst1~combout\ = (\X2~input_o\ & (\E1~input_o\ & (!\X3~input_o\ & !\E0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X2~input_o\,
	datab => \E1~input_o\,
	datac => \X3~input_o\,
	datad => \E0~input_o\,
	combout => \inst7|inst1~combout\);

\inst10|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|inst3~combout\ = (\inst7|inst1~combout\ & (!\x0~input_o\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst1~combout\,
	datab => \x0~input_o\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst10|inst3~combout\);

\inst10|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|inst1~combout\ = (\x0~input_o\ & (\inst7|inst1~combout\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x0~input_o\,
	datab => \inst7|inst1~combout\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst10|inst1~combout\);

\inst10|inst2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|inst2~combout\ = (\x1~input_o\ & (\inst7|inst1~combout\ & (!\x0~input_o\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1~input_o\,
	datab => \inst7|inst1~combout\,
	datac => \x0~input_o\,
	datad => \gnd~input_o\,
	combout => \inst10|inst2~combout\);

\inst10|inst\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|inst~combout\ = (\x0~input_o\ & (\x1~input_o\ & (\inst7|inst1~combout\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x0~input_o\,
	datab => \x1~input_o\,
	datac => \inst7|inst1~combout\,
	datad => \gnd~input_o\,
	combout => \inst10|inst~combout\);

\inst7|inst2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|inst2~combout\ = (\X3~input_o\ & (\E1~input_o\ & (!\X2~input_o\ & !\E0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X3~input_o\,
	datab => \E1~input_o\,
	datac => \X2~input_o\,
	datad => \E0~input_o\,
	combout => \inst7|inst2~combout\);

\inst9|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9|inst3~combout\ = (\inst7|inst2~combout\ & (!\x0~input_o\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst2~combout\,
	datab => \x0~input_o\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst9|inst3~combout\);

\inst9|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9|inst1~combout\ = (\x0~input_o\ & (\inst7|inst2~combout\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x0~input_o\,
	datab => \inst7|inst2~combout\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst9|inst1~combout\);

\inst9|inst2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9|inst2~combout\ = (\x1~input_o\ & (\inst7|inst2~combout\ & (!\x0~input_o\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1~input_o\,
	datab => \inst7|inst2~combout\,
	datac => \x0~input_o\,
	datad => \gnd~input_o\,
	combout => \inst9|inst2~combout\);

\inst9|inst\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9|inst~combout\ = (\x0~input_o\ & (\x1~input_o\ & (\inst7|inst2~combout\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x0~input_o\,
	datab => \x1~input_o\,
	datac => \inst7|inst2~combout\,
	datad => \gnd~input_o\,
	combout => \inst9|inst~combout\);

\inst7|inst\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|inst~combout\ = (\X2~input_o\ & (\X3~input_o\ & (\E1~input_o\ & !\E0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X2~input_o\,
	datab => \X3~input_o\,
	datac => \E1~input_o\,
	datad => \E0~input_o\,
	combout => \inst7|inst~combout\);

\inst8|inst3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|inst3~combout\ = (\inst7|inst~combout\ & (!\x0~input_o\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst~combout\,
	datab => \x0~input_o\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst8|inst3~combout\);

\inst8|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|inst1~combout\ = (\x0~input_o\ & (\inst7|inst~combout\ & (!\gnd~input_o\ & !\x1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x0~input_o\,
	datab => \inst7|inst~combout\,
	datac => \gnd~input_o\,
	datad => \x1~input_o\,
	combout => \inst8|inst1~combout\);

\inst8|inst2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|inst2~combout\ = (\x1~input_o\ & (\inst7|inst~combout\ & (!\x0~input_o\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1~input_o\,
	datab => \inst7|inst~combout\,
	datac => \x0~input_o\,
	datad => \gnd~input_o\,
	combout => \inst8|inst2~combout\);

\inst8|inst\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst8|inst~combout\ = (\x0~input_o\ & (\x1~input_o\ & (\inst7|inst~combout\ & !\gnd~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x0~input_o\,
	datab => \x1~input_o\,
	datac => \inst7|inst~combout\,
	datad => \gnd~input_o\,
	combout => \inst8|inst~combout\);

ww_y0 <= \y0~output_o\;

ww_y2 <= \y2~output_o\;

ww_y1 <= \y1~output_o\;

ww_y3 <= \y3~output_o\;

ww_y4 <= \y4~output_o\;

ww_y5 <= \y5~output_o\;

ww_y6 <= \y6~output_o\;

ww_y7 <= \y7~output_o\;

ww_y8 <= \y8~output_o\;

ww_y9 <= \y9~output_o\;

ww_y10 <= \y10~output_o\;

ww_y11 <= \y11~output_o\;

ww_y12 <= \y12~output_o\;

ww_y13 <= \y13~output_o\;

ww_y14 <= \y14~output_o\;

ww_y15 <= \y15~output_o\;
END structure;


