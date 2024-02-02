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

-- DATE "06/20/2022 15:50:34"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	AritmeticUnit IS
    PORT (
	operand1 : IN std_logic_vector(7 DOWNTO 0);
	operand2 : IN std_logic_vector(7 DOWNTO 0);
	operand3 : IN std_logic_vector(7 DOWNTO 0);
	operand4 : IN std_logic_vector(7 DOWNTO 0);
	Result : OUT std_logic_vector(7 DOWNTO 0)
	);
END AritmeticUnit;

ARCHITECTURE structure OF AritmeticUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_operand1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_operand2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_operand3 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_operand4 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Result : std_logic_vector(7 DOWNTO 0);
SIGNAL \Result[0]~output_o\ : std_logic;
SIGNAL \Result[1]~output_o\ : std_logic;
SIGNAL \Result[2]~output_o\ : std_logic;
SIGNAL \Result[3]~output_o\ : std_logic;
SIGNAL \Result[4]~output_o\ : std_logic;
SIGNAL \Result[5]~output_o\ : std_logic;
SIGNAL \Result[6]~output_o\ : std_logic;
SIGNAL \Result[7]~output_o\ : std_logic;
SIGNAL \operand3[0]~input_o\ : std_logic;
SIGNAL \operand4[2]~input_o\ : std_logic;
SIGNAL \operand1[2]~input_o\ : std_logic;
SIGNAL \operand2[2]~input_o\ : std_logic;
SIGNAL \operand3[2]~input_o\ : std_logic;
SIGNAL \operand2[0]~input_o\ : std_logic;
SIGNAL \operand1[0]~input_o\ : std_logic;
SIGNAL \operand2[1]~input_o\ : std_logic;
SIGNAL \operand1[1]~input_o\ : std_logic;
SIGNAL \adder8_1|bit1|cout~0_combout\ : std_logic;
SIGNAL \adder9_1|bit2|s~2_combout\ : std_logic;
SIGNAL \operand3[1]~input_o\ : std_logic;
SIGNAL \adder8_1|bit1|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit1|s~4_combout\ : std_logic;
SIGNAL \adder9_1|bit0|cout~0_combout\ : std_logic;
SIGNAL \operand4[1]~input_o\ : std_logic;
SIGNAL \operand4[0]~input_o\ : std_logic;
SIGNAL \adder10_1|bit0|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit1|cout~0_combout\ : std_logic;
SIGNAL \adder8_1|bit0|cout~0_combout\ : std_logic;
SIGNAL \adder9_1|bit1|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit2|s~combout\ : std_logic;
SIGNAL \adder10_1|bit1|s~0_combout\ : std_logic;
SIGNAL \adder10_1|bit0|s~0_combout\ : std_logic;
SIGNAL \Add0~1_cout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \operand4[3]~input_o\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \operand1[3]~input_o\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \operand1[4]~input_o\ : std_logic;
SIGNAL \operand1[5]~input_o\ : std_logic;
SIGNAL \operand1[6]~input_o\ : std_logic;
SIGNAL \operand1[7]~input_o\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \operand4[4]~input_o\ : std_logic;
SIGNAL \operand4[5]~input_o\ : std_logic;
SIGNAL \operand4[6]~input_o\ : std_logic;
SIGNAL \operand4[7]~input_o\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \operand2[3]~input_o\ : std_logic;
SIGNAL \operand3[3]~input_o\ : std_logic;
SIGNAL \adder8_1|bit2|cout~0_combout\ : std_logic;
SIGNAL \adder9_1|bit3|s~2_combout\ : std_logic;
SIGNAL \adder10_1|bit2|cout~0_combout\ : std_logic;
SIGNAL \adder8_1|bit2|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit2|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit3|s~combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \operand2[4]~input_o\ : std_logic;
SIGNAL \adder8_1|bit3|cout~0_combout\ : std_logic;
SIGNAL \operand3[4]~input_o\ : std_logic;
SIGNAL \adder9_1|bit4|s~2_combout\ : std_logic;
SIGNAL \adder10_1|bit3|cout~0_combout\ : std_logic;
SIGNAL \adder8_1|bit3|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit3|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit4|s~combout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \operand2[5]~input_o\ : std_logic;
SIGNAL \adder8_1|bit4|cout~0_combout\ : std_logic;
SIGNAL \operand3[5]~input_o\ : std_logic;
SIGNAL \adder9_1|bit5|s~2_combout\ : std_logic;
SIGNAL \adder10_1|bit4|cout~0_combout\ : std_logic;
SIGNAL \adder8_1|bit4|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit4|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit5|s~combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~11_combout\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \operand2[6]~input_o\ : std_logic;
SIGNAL \adder8_1|bit5|cout~0_combout\ : std_logic;
SIGNAL \operand3[6]~input_o\ : std_logic;
SIGNAL \adder9_1|bit6|s~2_combout\ : std_logic;
SIGNAL \adder10_1|bit5|cout~0_combout\ : std_logic;
SIGNAL \adder8_1|bit5|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit5|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit6|s~combout\ : std_logic;
SIGNAL \Add0~12\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \operand2[7]~input_o\ : std_logic;
SIGNAL \adder8_1|bit6|cout~0_combout\ : std_logic;
SIGNAL \operand3[7]~input_o\ : std_logic;
SIGNAL \adder9_1|bit7|s~2_combout\ : std_logic;
SIGNAL \adder10_1|bit6|cout~0_combout\ : std_logic;
SIGNAL \adder8_1|bit6|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit6|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit7|s~combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \Add0~19_combout\ : std_logic;
SIGNAL \adder8_1|bit7|s~0_combout\ : std_logic;
SIGNAL \adder9_1|bit7|cout~0_combout\ : std_logic;
SIGNAL \adder9_1|bit8|s~combout\ : std_logic;
SIGNAL \adder10_1|bit7|cout~0_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \adder9_1|bit8|cout~0_combout\ : std_logic;
SIGNAL \adder10_1|bit8|cout~0_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~23_combout\ : std_logic;
SIGNAL \Add0~25_combout\ : std_logic;

BEGIN

ww_operand1 <= operand1;
ww_operand2 <= operand2;
ww_operand3 <= operand3;
ww_operand4 <= operand4;
Result <= ww_Result;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Result[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~4_combout\,
	devoe => ww_devoe,
	o => \Result[0]~output_o\);

\Result[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~7_combout\,
	devoe => ww_devoe,
	o => \Result[1]~output_o\);

\Result[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~10_combout\,
	devoe => ww_devoe,
	o => \Result[2]~output_o\);

\Result[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~13_combout\,
	devoe => ww_devoe,
	o => \Result[3]~output_o\);

\Result[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~16_combout\,
	devoe => ww_devoe,
	o => \Result[4]~output_o\);

\Result[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~19_combout\,
	devoe => ww_devoe,
	o => \Result[5]~output_o\);

\Result[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~22_combout\,
	devoe => ww_devoe,
	o => \Result[6]~output_o\);

\Result[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~25_combout\,
	devoe => ww_devoe,
	o => \Result[7]~output_o\);

\operand3[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(0),
	o => \operand3[0]~input_o\);

\operand4[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(2),
	o => \operand4[2]~input_o\);

\operand1[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(2),
	o => \operand1[2]~input_o\);

\operand2[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(2),
	o => \operand2[2]~input_o\);

\operand3[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(2),
	o => \operand3[2]~input_o\);

\operand2[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(0),
	o => \operand2[0]~input_o\);

\operand1[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(0),
	o => \operand1[0]~input_o\);

\operand2[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(1),
	o => \operand2[1]~input_o\);

\operand1[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(1),
	o => \operand1[1]~input_o\);

\adder8_1|bit1|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit1|cout~0_combout\ = (\operand2[1]~input_o\ & ((\operand1[1]~input_o\) # ((\operand2[0]~input_o\ & \operand1[0]~input_o\)))) # (!\operand2[1]~input_o\ & (\operand2[0]~input_o\ & (\operand1[0]~input_o\ & \operand1[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand2[0]~input_o\,
	datab => \operand1[0]~input_o\,
	datac => \operand2[1]~input_o\,
	datad => \operand1[1]~input_o\,
	combout => \adder8_1|bit1|cout~0_combout\);

\adder9_1|bit2|s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit2|s~2_combout\ = \operand1[2]~input_o\ $ (\operand2[2]~input_o\ $ (\operand3[2]~input_o\ $ (\adder8_1|bit1|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[2]~input_o\,
	datab => \operand2[2]~input_o\,
	datac => \operand3[2]~input_o\,
	datad => \adder8_1|bit1|cout~0_combout\,
	combout => \adder9_1|bit2|s~2_combout\);

\operand3[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(1),
	o => \operand3[1]~input_o\);

\adder8_1|bit1|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit1|s~0_combout\ = \operand1[1]~input_o\ $ (\operand2[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[1]~input_o\,
	datad => \operand2[1]~input_o\,
	combout => \adder8_1|bit1|s~0_combout\);

\adder9_1|bit1|s~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit1|s~4_combout\ = \operand3[1]~input_o\ $ (\adder8_1|bit1|s~0_combout\ $ (((\operand1[0]~input_o\ & \operand2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[0]~input_o\,
	datab => \operand2[0]~input_o\,
	datac => \operand3[1]~input_o\,
	datad => \adder8_1|bit1|s~0_combout\,
	combout => \adder9_1|bit1|s~4_combout\);

\adder9_1|bit0|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit0|cout~0_combout\ = (\operand3[0]~input_o\ & (\operand1[0]~input_o\ $ (\operand2[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[0]~input_o\,
	datac => \operand1[0]~input_o\,
	datad => \operand2[0]~input_o\,
	combout => \adder9_1|bit0|cout~0_combout\);

\operand4[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(1),
	o => \operand4[1]~input_o\);

\operand4[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(0),
	o => \operand4[0]~input_o\);

\adder10_1|bit0|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit0|cout~0_combout\ = (\operand4[0]~input_o\ & (\operand1[0]~input_o\ $ (\operand3[0]~input_o\ $ (\operand2[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[0]~input_o\,
	datab => \operand1[0]~input_o\,
	datac => \operand3[0]~input_o\,
	datad => \operand2[0]~input_o\,
	combout => \adder10_1|bit0|cout~0_combout\);

\adder10_1|bit1|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit1|cout~0_combout\ = (\operand4[1]~input_o\ & ((\adder10_1|bit0|cout~0_combout\) # (\adder9_1|bit1|s~4_combout\ $ (\adder9_1|bit0|cout~0_combout\)))) # (!\operand4[1]~input_o\ & (\adder10_1|bit0|cout~0_combout\ & (\adder9_1|bit1|s~4_combout\ 
-- $ (\adder9_1|bit0|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit1|s~4_combout\,
	datab => \adder9_1|bit0|cout~0_combout\,
	datac => \operand4[1]~input_o\,
	datad => \adder10_1|bit0|cout~0_combout\,
	combout => \adder10_1|bit1|cout~0_combout\);

\adder8_1|bit0|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit0|cout~0_combout\ = (\operand1[0]~input_o\ & \operand2[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[0]~input_o\,
	datab => \operand2[0]~input_o\,
	combout => \adder8_1|bit0|cout~0_combout\);

\adder9_1|bit1|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit1|cout~0_combout\ = (\operand3[1]~input_o\ & ((\adder9_1|bit0|cout~0_combout\) # (\adder8_1|bit1|s~0_combout\ $ (\adder8_1|bit0|cout~0_combout\)))) # (!\operand3[1]~input_o\ & (\adder9_1|bit0|cout~0_combout\ & (\adder8_1|bit1|s~0_combout\ $ 
-- (\adder8_1|bit0|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit1|s~0_combout\,
	datab => \adder8_1|bit0|cout~0_combout\,
	datac => \operand3[1]~input_o\,
	datad => \adder9_1|bit0|cout~0_combout\,
	combout => \adder9_1|bit1|cout~0_combout\);

\adder10_1|bit2|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit2|s~combout\ = \operand4[2]~input_o\ $ (\adder9_1|bit2|s~2_combout\ $ (\adder10_1|bit1|cout~0_combout\ $ (\adder9_1|bit1|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[2]~input_o\,
	datab => \adder9_1|bit2|s~2_combout\,
	datac => \adder10_1|bit1|cout~0_combout\,
	datad => \adder9_1|bit1|cout~0_combout\,
	combout => \adder10_1|bit2|s~combout\);

\adder10_1|bit1|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit1|s~0_combout\ = \operand4[1]~input_o\ $ (\adder9_1|bit1|s~4_combout\ $ (\adder9_1|bit0|cout~0_combout\ $ (\adder10_1|bit0|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[1]~input_o\,
	datab => \adder9_1|bit1|s~4_combout\,
	datac => \adder9_1|bit0|cout~0_combout\,
	datad => \adder10_1|bit0|cout~0_combout\,
	combout => \adder10_1|bit1|s~0_combout\);

\adder10_1|bit0|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit0|s~0_combout\ = \operand4[0]~input_o\ $ (\operand1[0]~input_o\ $ (\operand3[0]~input_o\ $ (\operand2[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[0]~input_o\,
	datab => \operand1[0]~input_o\,
	datac => \operand3[0]~input_o\,
	datad => \operand2[0]~input_o\,
	combout => \adder10_1|bit0|s~0_combout\);

\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_cout\ = CARRY((\adder10_1|bit1|s~0_combout\ & \adder10_1|bit0|s~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit1|s~0_combout\,
	datab => \adder10_1|bit0|s~0_combout\,
	datad => VCC,
	cout => \Add0~1_cout\);

\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\adder10_1|bit2|s~combout\ & (!\Add0~1_cout\)) # (!\adder10_1|bit2|s~combout\ & ((\Add0~1_cout\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1_cout\) # (!\adder10_1|bit2|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit2|s~combout\,
	datad => VCC,
	cin => \Add0~1_cout\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

\operand4[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(3),
	o => \operand4[3]~input_o\);

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\operand4[0]~input_o\ & (!\operand4[1]~input_o\ & (!\operand4[2]~input_o\ & !\operand4[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[0]~input_o\,
	datab => \operand4[1]~input_o\,
	datac => \operand4[2]~input_o\,
	datad => \operand4[3]~input_o\,
	combout => \Equal0~0_combout\);

\operand1[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(3),
	o => \operand1[3]~input_o\);

\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!\operand1[0]~input_o\ & (!\operand1[1]~input_o\ & (!\operand1[2]~input_o\ & !\operand1[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[0]~input_o\,
	datab => \operand1[1]~input_o\,
	datac => \operand1[2]~input_o\,
	datad => \operand1[3]~input_o\,
	combout => \Equal1~0_combout\);

\operand1[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(4),
	o => \operand1[4]~input_o\);

\operand1[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(5),
	o => \operand1[5]~input_o\);

\operand1[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(6),
	o => \operand1[6]~input_o\);

\operand1[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand1(7),
	o => \operand1[7]~input_o\);

\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!\operand1[4]~input_o\ & (!\operand1[5]~input_o\ & (!\operand1[6]~input_o\ & !\operand1[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[4]~input_o\,
	datab => \operand1[5]~input_o\,
	datac => \operand1[6]~input_o\,
	datad => \operand1[7]~input_o\,
	combout => \Equal1~1_combout\);

\operand4[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(4),
	o => \operand4[4]~input_o\);

\operand4[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(5),
	o => \operand4[5]~input_o\);

\operand4[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(6),
	o => \operand4[6]~input_o\);

\operand4[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand4(7),
	o => \operand4[7]~input_o\);

\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\operand4[4]~input_o\ & (!\operand4[5]~input_o\ & (!\operand4[6]~input_o\ & !\operand4[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[4]~input_o\,
	datab => \operand4[5]~input_o\,
	datac => \operand4[6]~input_o\,
	datad => \operand4[7]~input_o\,
	combout => \Equal0~1_combout\);

\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\Equal0~0_combout\ & ((\Equal0~1_combout\) # ((\Equal1~0_combout\ & \Equal1~1_combout\)))) # (!\Equal0~0_combout\ & (\Equal1~0_combout\ & (\Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal1~0_combout\,
	datac => \Equal1~1_combout\,
	datad => \Equal0~1_combout\,
	combout => \process_0~0_combout\);

\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\process_0~0_combout\ & (\operand3[0]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[0]~input_o\,
	datab => \Add0~2_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~4_combout\);

\operand2[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(3),
	o => \operand2[3]~input_o\);

\operand3[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(3),
	o => \operand3[3]~input_o\);

\adder8_1|bit2|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit2|cout~0_combout\ = (\operand1[2]~input_o\ & ((\operand2[2]~input_o\) # (\adder8_1|bit1|cout~0_combout\))) # (!\operand1[2]~input_o\ & (\operand2[2]~input_o\ & \adder8_1|bit1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[2]~input_o\,
	datab => \operand2[2]~input_o\,
	datac => \adder8_1|bit1|cout~0_combout\,
	combout => \adder8_1|bit2|cout~0_combout\);

\adder9_1|bit3|s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit3|s~2_combout\ = \operand1[3]~input_o\ $ (\operand2[3]~input_o\ $ (\operand3[3]~input_o\ $ (\adder8_1|bit2|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[3]~input_o\,
	datab => \operand2[3]~input_o\,
	datac => \operand3[3]~input_o\,
	datad => \adder8_1|bit2|cout~0_combout\,
	combout => \adder9_1|bit3|s~2_combout\);

\adder10_1|bit2|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit2|cout~0_combout\ = (\operand4[2]~input_o\ & ((\adder10_1|bit1|cout~0_combout\) # (\adder9_1|bit1|cout~0_combout\ $ (\adder9_1|bit2|s~2_combout\)))) # (!\operand4[2]~input_o\ & (\adder10_1|bit1|cout~0_combout\ & 
-- (\adder9_1|bit1|cout~0_combout\ $ (\adder9_1|bit2|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit1|cout~0_combout\,
	datab => \adder9_1|bit2|s~2_combout\,
	datac => \operand4[2]~input_o\,
	datad => \adder10_1|bit1|cout~0_combout\,
	combout => \adder10_1|bit2|cout~0_combout\);

\adder8_1|bit2|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit2|s~0_combout\ = \operand1[2]~input_o\ $ (\operand2[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[2]~input_o\,
	datad => \operand2[2]~input_o\,
	combout => \adder8_1|bit2|s~0_combout\);

\adder9_1|bit2|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit2|cout~0_combout\ = (\operand3[2]~input_o\ & ((\adder9_1|bit1|cout~0_combout\) # (\adder8_1|bit1|cout~0_combout\ $ (\adder8_1|bit2|s~0_combout\)))) # (!\operand3[2]~input_o\ & (\adder9_1|bit1|cout~0_combout\ & (\adder8_1|bit1|cout~0_combout\ 
-- $ (\adder8_1|bit2|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit1|cout~0_combout\,
	datab => \adder8_1|bit2|s~0_combout\,
	datac => \operand3[2]~input_o\,
	datad => \adder9_1|bit1|cout~0_combout\,
	combout => \adder9_1|bit2|cout~0_combout\);

\adder10_1|bit3|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit3|s~combout\ = \operand4[3]~input_o\ $ (\adder9_1|bit3|s~2_combout\ $ (\adder10_1|bit2|cout~0_combout\ $ (\adder9_1|bit2|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[3]~input_o\,
	datab => \adder9_1|bit3|s~2_combout\,
	datac => \adder10_1|bit2|cout~0_combout\,
	datad => \adder9_1|bit2|cout~0_combout\,
	combout => \adder10_1|bit3|s~combout\);

\Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~5_combout\ = (\adder10_1|bit3|s~combout\ & (\Add0~3\ $ (GND))) # (!\adder10_1|bit3|s~combout\ & (!\Add0~3\ & VCC))
-- \Add0~6\ = CARRY((\adder10_1|bit3|s~combout\ & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit3|s~combout\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~5_combout\,
	cout => \Add0~6\);

\Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (\process_0~0_combout\ & (\operand3[1]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[1]~input_o\,
	datab => \Add0~5_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~7_combout\);

\operand2[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(4),
	o => \operand2[4]~input_o\);

\adder8_1|bit3|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit3|cout~0_combout\ = (\operand1[3]~input_o\ & ((\operand2[3]~input_o\) # (\adder8_1|bit2|cout~0_combout\))) # (!\operand1[3]~input_o\ & (\operand2[3]~input_o\ & \adder8_1|bit2|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[3]~input_o\,
	datab => \operand2[3]~input_o\,
	datac => \adder8_1|bit2|cout~0_combout\,
	combout => \adder8_1|bit3|cout~0_combout\);

\operand3[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(4),
	o => \operand3[4]~input_o\);

\adder9_1|bit4|s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit4|s~2_combout\ = \operand1[4]~input_o\ $ (\operand2[4]~input_o\ $ (\adder8_1|bit3|cout~0_combout\ $ (\operand3[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[4]~input_o\,
	datab => \operand2[4]~input_o\,
	datac => \adder8_1|bit3|cout~0_combout\,
	datad => \operand3[4]~input_o\,
	combout => \adder9_1|bit4|s~2_combout\);

\adder10_1|bit3|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit3|cout~0_combout\ = (\operand4[3]~input_o\ & ((\adder10_1|bit2|cout~0_combout\) # (\adder9_1|bit2|cout~0_combout\ $ (\adder9_1|bit3|s~2_combout\)))) # (!\operand4[3]~input_o\ & (\adder10_1|bit2|cout~0_combout\ & 
-- (\adder9_1|bit2|cout~0_combout\ $ (\adder9_1|bit3|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit2|cout~0_combout\,
	datab => \adder9_1|bit3|s~2_combout\,
	datac => \operand4[3]~input_o\,
	datad => \adder10_1|bit2|cout~0_combout\,
	combout => \adder10_1|bit3|cout~0_combout\);

\adder8_1|bit3|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit3|s~0_combout\ = \operand1[3]~input_o\ $ (\operand2[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[3]~input_o\,
	datad => \operand2[3]~input_o\,
	combout => \adder8_1|bit3|s~0_combout\);

\adder9_1|bit3|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit3|cout~0_combout\ = (\operand3[3]~input_o\ & ((\adder9_1|bit2|cout~0_combout\) # (\adder8_1|bit2|cout~0_combout\ $ (\adder8_1|bit3|s~0_combout\)))) # (!\operand3[3]~input_o\ & (\adder9_1|bit2|cout~0_combout\ & (\adder8_1|bit2|cout~0_combout\ 
-- $ (\adder8_1|bit3|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit2|cout~0_combout\,
	datab => \adder8_1|bit3|s~0_combout\,
	datac => \operand3[3]~input_o\,
	datad => \adder9_1|bit2|cout~0_combout\,
	combout => \adder9_1|bit3|cout~0_combout\);

\adder10_1|bit4|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit4|s~combout\ = \operand4[4]~input_o\ $ (\adder9_1|bit4|s~2_combout\ $ (\adder10_1|bit3|cout~0_combout\ $ (\adder9_1|bit3|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[4]~input_o\,
	datab => \adder9_1|bit4|s~2_combout\,
	datac => \adder10_1|bit3|cout~0_combout\,
	datad => \adder9_1|bit3|cout~0_combout\,
	combout => \adder10_1|bit4|s~combout\);

\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\adder10_1|bit4|s~combout\ & (!\Add0~6\)) # (!\adder10_1|bit4|s~combout\ & ((\Add0~6\) # (GND)))
-- \Add0~9\ = CARRY((!\Add0~6\) # (!\adder10_1|bit4|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit4|s~combout\,
	datad => VCC,
	cin => \Add0~6\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\process_0~0_combout\ & (\operand3[2]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[2]~input_o\,
	datab => \Add0~8_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~10_combout\);

\operand2[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(5),
	o => \operand2[5]~input_o\);

\adder8_1|bit4|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit4|cout~0_combout\ = (\operand1[4]~input_o\ & ((\adder8_1|bit3|cout~0_combout\) # (\operand2[4]~input_o\))) # (!\operand1[4]~input_o\ & (\adder8_1|bit3|cout~0_combout\ & \operand2[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[4]~input_o\,
	datab => \adder8_1|bit3|cout~0_combout\,
	datac => \operand2[4]~input_o\,
	combout => \adder8_1|bit4|cout~0_combout\);

\operand3[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(5),
	o => \operand3[5]~input_o\);

\adder9_1|bit5|s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit5|s~2_combout\ = \operand1[5]~input_o\ $ (\operand2[5]~input_o\ $ (\adder8_1|bit4|cout~0_combout\ $ (\operand3[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[5]~input_o\,
	datab => \operand2[5]~input_o\,
	datac => \adder8_1|bit4|cout~0_combout\,
	datad => \operand3[5]~input_o\,
	combout => \adder9_1|bit5|s~2_combout\);

\adder10_1|bit4|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit4|cout~0_combout\ = (\operand4[4]~input_o\ & ((\adder10_1|bit3|cout~0_combout\) # (\adder9_1|bit3|cout~0_combout\ $ (\adder9_1|bit4|s~2_combout\)))) # (!\operand4[4]~input_o\ & (\adder10_1|bit3|cout~0_combout\ & 
-- (\adder9_1|bit3|cout~0_combout\ $ (\adder9_1|bit4|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit3|cout~0_combout\,
	datab => \adder9_1|bit4|s~2_combout\,
	datac => \operand4[4]~input_o\,
	datad => \adder10_1|bit3|cout~0_combout\,
	combout => \adder10_1|bit4|cout~0_combout\);

\adder8_1|bit4|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit4|s~0_combout\ = \operand1[4]~input_o\ $ (\operand2[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[4]~input_o\,
	datad => \operand2[4]~input_o\,
	combout => \adder8_1|bit4|s~0_combout\);

\adder9_1|bit4|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit4|cout~0_combout\ = (\operand3[4]~input_o\ & ((\adder9_1|bit3|cout~0_combout\) # (\adder8_1|bit3|cout~0_combout\ $ (\adder8_1|bit4|s~0_combout\)))) # (!\operand3[4]~input_o\ & (\adder9_1|bit3|cout~0_combout\ & (\adder8_1|bit3|cout~0_combout\ 
-- $ (\adder8_1|bit4|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit3|cout~0_combout\,
	datab => \adder8_1|bit4|s~0_combout\,
	datac => \operand3[4]~input_o\,
	datad => \adder9_1|bit3|cout~0_combout\,
	combout => \adder9_1|bit4|cout~0_combout\);

\adder10_1|bit5|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit5|s~combout\ = \operand4[5]~input_o\ $ (\adder9_1|bit5|s~2_combout\ $ (\adder10_1|bit4|cout~0_combout\ $ (\adder9_1|bit4|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[5]~input_o\,
	datab => \adder9_1|bit5|s~2_combout\,
	datac => \adder10_1|bit4|cout~0_combout\,
	datad => \adder9_1|bit4|cout~0_combout\,
	combout => \adder10_1|bit5|s~combout\);

\Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~11_combout\ = (\adder10_1|bit5|s~combout\ & (\Add0~9\ $ (GND))) # (!\adder10_1|bit5|s~combout\ & (!\Add0~9\ & VCC))
-- \Add0~12\ = CARRY((\adder10_1|bit5|s~combout\ & !\Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit5|s~combout\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~11_combout\,
	cout => \Add0~12\);

\Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (\process_0~0_combout\ & (\operand3[3]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[3]~input_o\,
	datab => \Add0~11_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~13_combout\);

\operand2[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(6),
	o => \operand2[6]~input_o\);

\adder8_1|bit5|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit5|cout~0_combout\ = (\operand1[5]~input_o\ & ((\adder8_1|bit4|cout~0_combout\) # (\operand2[5]~input_o\))) # (!\operand1[5]~input_o\ & (\adder8_1|bit4|cout~0_combout\ & \operand2[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[5]~input_o\,
	datab => \adder8_1|bit4|cout~0_combout\,
	datac => \operand2[5]~input_o\,
	combout => \adder8_1|bit5|cout~0_combout\);

\operand3[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(6),
	o => \operand3[6]~input_o\);

\adder9_1|bit6|s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit6|s~2_combout\ = \operand1[6]~input_o\ $ (\operand2[6]~input_o\ $ (\adder8_1|bit5|cout~0_combout\ $ (\operand3[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[6]~input_o\,
	datab => \operand2[6]~input_o\,
	datac => \adder8_1|bit5|cout~0_combout\,
	datad => \operand3[6]~input_o\,
	combout => \adder9_1|bit6|s~2_combout\);

\adder10_1|bit5|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit5|cout~0_combout\ = (\operand4[5]~input_o\ & ((\adder10_1|bit4|cout~0_combout\) # (\adder9_1|bit4|cout~0_combout\ $ (\adder9_1|bit5|s~2_combout\)))) # (!\operand4[5]~input_o\ & (\adder10_1|bit4|cout~0_combout\ & 
-- (\adder9_1|bit4|cout~0_combout\ $ (\adder9_1|bit5|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit4|cout~0_combout\,
	datab => \adder9_1|bit5|s~2_combout\,
	datac => \operand4[5]~input_o\,
	datad => \adder10_1|bit4|cout~0_combout\,
	combout => \adder10_1|bit5|cout~0_combout\);

\adder8_1|bit5|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit5|s~0_combout\ = \operand1[5]~input_o\ $ (\operand2[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[5]~input_o\,
	datad => \operand2[5]~input_o\,
	combout => \adder8_1|bit5|s~0_combout\);

\adder9_1|bit5|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit5|cout~0_combout\ = (\operand3[5]~input_o\ & ((\adder9_1|bit4|cout~0_combout\) # (\adder8_1|bit4|cout~0_combout\ $ (\adder8_1|bit5|s~0_combout\)))) # (!\operand3[5]~input_o\ & (\adder9_1|bit4|cout~0_combout\ & (\adder8_1|bit4|cout~0_combout\ 
-- $ (\adder8_1|bit5|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit4|cout~0_combout\,
	datab => \adder8_1|bit5|s~0_combout\,
	datac => \operand3[5]~input_o\,
	datad => \adder9_1|bit4|cout~0_combout\,
	combout => \adder9_1|bit5|cout~0_combout\);

\adder10_1|bit6|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit6|s~combout\ = \operand4[6]~input_o\ $ (\adder9_1|bit6|s~2_combout\ $ (\adder10_1|bit5|cout~0_combout\ $ (\adder9_1|bit5|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[6]~input_o\,
	datab => \adder9_1|bit6|s~2_combout\,
	datac => \adder10_1|bit5|cout~0_combout\,
	datad => \adder9_1|bit5|cout~0_combout\,
	combout => \adder10_1|bit6|s~combout\);

\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\adder10_1|bit6|s~combout\ & (!\Add0~12\)) # (!\adder10_1|bit6|s~combout\ & ((\Add0~12\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~12\) # (!\adder10_1|bit6|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit6|s~combout\,
	datad => VCC,
	cin => \Add0~12\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (\process_0~0_combout\ & (\operand3[4]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[4]~input_o\,
	datab => \Add0~14_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~16_combout\);

\operand2[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand2(7),
	o => \operand2[7]~input_o\);

\adder8_1|bit6|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit6|cout~0_combout\ = (\operand1[6]~input_o\ & ((\adder8_1|bit5|cout~0_combout\) # (\operand2[6]~input_o\))) # (!\operand1[6]~input_o\ & (\adder8_1|bit5|cout~0_combout\ & \operand2[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[6]~input_o\,
	datab => \adder8_1|bit5|cout~0_combout\,
	datac => \operand2[6]~input_o\,
	combout => \adder8_1|bit6|cout~0_combout\);

\operand3[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand3(7),
	o => \operand3[7]~input_o\);

\adder9_1|bit7|s~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit7|s~2_combout\ = \operand1[7]~input_o\ $ (\operand2[7]~input_o\ $ (\adder8_1|bit6|cout~0_combout\ $ (\operand3[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[7]~input_o\,
	datab => \operand2[7]~input_o\,
	datac => \adder8_1|bit6|cout~0_combout\,
	datad => \operand3[7]~input_o\,
	combout => \adder9_1|bit7|s~2_combout\);

\adder10_1|bit6|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit6|cout~0_combout\ = (\operand4[6]~input_o\ & ((\adder10_1|bit5|cout~0_combout\) # (\adder9_1|bit5|cout~0_combout\ $ (\adder9_1|bit6|s~2_combout\)))) # (!\operand4[6]~input_o\ & (\adder10_1|bit5|cout~0_combout\ & 
-- (\adder9_1|bit5|cout~0_combout\ $ (\adder9_1|bit6|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit5|cout~0_combout\,
	datab => \adder9_1|bit6|s~2_combout\,
	datac => \operand4[6]~input_o\,
	datad => \adder10_1|bit5|cout~0_combout\,
	combout => \adder10_1|bit6|cout~0_combout\);

\adder8_1|bit6|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit6|s~0_combout\ = \operand1[6]~input_o\ $ (\operand2[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[6]~input_o\,
	datad => \operand2[6]~input_o\,
	combout => \adder8_1|bit6|s~0_combout\);

\adder9_1|bit6|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit6|cout~0_combout\ = (\operand3[6]~input_o\ & ((\adder9_1|bit5|cout~0_combout\) # (\adder8_1|bit5|cout~0_combout\ $ (\adder8_1|bit6|s~0_combout\)))) # (!\operand3[6]~input_o\ & (\adder9_1|bit5|cout~0_combout\ & (\adder8_1|bit5|cout~0_combout\ 
-- $ (\adder8_1|bit6|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit5|cout~0_combout\,
	datab => \adder8_1|bit6|s~0_combout\,
	datac => \operand3[6]~input_o\,
	datad => \adder9_1|bit5|cout~0_combout\,
	combout => \adder9_1|bit6|cout~0_combout\);

\adder10_1|bit7|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit7|s~combout\ = \operand4[7]~input_o\ $ (\adder9_1|bit7|s~2_combout\ $ (\adder10_1|bit6|cout~0_combout\ $ (\adder9_1|bit6|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand4[7]~input_o\,
	datab => \adder9_1|bit7|s~2_combout\,
	datac => \adder10_1|bit6|cout~0_combout\,
	datad => \adder9_1|bit6|cout~0_combout\,
	combout => \adder10_1|bit7|s~combout\);

\Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = (\adder10_1|bit7|s~combout\ & (\Add0~15\ $ (GND))) # (!\adder10_1|bit7|s~combout\ & (!\Add0~15\ & VCC))
-- \Add0~18\ = CARRY((\adder10_1|bit7|s~combout\ & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder10_1|bit7|s~combout\,
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~17_combout\,
	cout => \Add0~18\);

\Add0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~19_combout\ = (\process_0~0_combout\ & (\operand3[5]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[5]~input_o\,
	datab => \Add0~17_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~19_combout\);

\adder8_1|bit7|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder8_1|bit7|s~0_combout\ = \operand1[7]~input_o\ $ (\operand2[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \operand1[7]~input_o\,
	datad => \operand2[7]~input_o\,
	combout => \adder8_1|bit7|s~0_combout\);

\adder9_1|bit7|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit7|cout~0_combout\ = (\operand3[7]~input_o\ & ((\adder9_1|bit6|cout~0_combout\) # (\adder8_1|bit6|cout~0_combout\ $ (\adder8_1|bit7|s~0_combout\)))) # (!\operand3[7]~input_o\ & (\adder9_1|bit6|cout~0_combout\ & (\adder8_1|bit6|cout~0_combout\ 
-- $ (\adder8_1|bit7|s~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder8_1|bit6|cout~0_combout\,
	datab => \adder8_1|bit7|s~0_combout\,
	datac => \operand3[7]~input_o\,
	datad => \adder9_1|bit6|cout~0_combout\,
	combout => \adder9_1|bit7|cout~0_combout\);

\adder9_1|bit8|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit8|s~combout\ = \adder9_1|bit7|cout~0_combout\ $ (((\operand1[7]~input_o\ & ((\adder8_1|bit6|cout~0_combout\) # (\operand2[7]~input_o\))) # (!\operand1[7]~input_o\ & (\adder8_1|bit6|cout~0_combout\ & \operand2[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand1[7]~input_o\,
	datab => \adder8_1|bit6|cout~0_combout\,
	datac => \operand2[7]~input_o\,
	datad => \adder9_1|bit7|cout~0_combout\,
	combout => \adder9_1|bit8|s~combout\);

\adder10_1|bit7|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit7|cout~0_combout\ = (\operand4[7]~input_o\ & ((\adder10_1|bit6|cout~0_combout\) # (\adder9_1|bit6|cout~0_combout\ $ (\adder9_1|bit7|s~2_combout\)))) # (!\operand4[7]~input_o\ & (\adder10_1|bit6|cout~0_combout\ & 
-- (\adder9_1|bit6|cout~0_combout\ $ (\adder9_1|bit7|s~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit6|cout~0_combout\,
	datab => \adder9_1|bit7|s~2_combout\,
	datac => \operand4[7]~input_o\,
	datad => \adder10_1|bit6|cout~0_combout\,
	combout => \adder10_1|bit7|cout~0_combout\);

\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (\Add0~18\ & (\adder9_1|bit8|s~combout\ $ ((!\adder10_1|bit7|cout~0_combout\)))) # (!\Add0~18\ & ((\adder9_1|bit8|s~combout\ $ (\adder10_1|bit7|cout~0_combout\)) # (GND)))
-- \Add0~21\ = CARRY((\adder9_1|bit8|s~combout\ $ (!\adder10_1|bit7|cout~0_combout\)) # (!\Add0~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit8|s~combout\,
	datab => \adder10_1|bit7|cout~0_combout\,
	datad => VCC,
	cin => \Add0~18\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\process_0~0_combout\ & (\operand3[6]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[6]~input_o\,
	datab => \Add0~20_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~22_combout\);

\adder9_1|bit8|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder9_1|bit8|cout~0_combout\ = (\adder9_1|bit7|cout~0_combout\ & ((\operand1[7]~input_o\ & ((\adder8_1|bit6|cout~0_combout\) # (\operand2[7]~input_o\))) # (!\operand1[7]~input_o\ & (\adder8_1|bit6|cout~0_combout\ & \operand2[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit7|cout~0_combout\,
	datab => \operand1[7]~input_o\,
	datac => \adder8_1|bit6|cout~0_combout\,
	datad => \operand2[7]~input_o\,
	combout => \adder9_1|bit8|cout~0_combout\);

\adder10_1|bit8|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \adder10_1|bit8|cout~0_combout\ = (\adder9_1|bit8|s~combout\ & \adder10_1|bit7|cout~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit8|s~combout\,
	datab => \adder10_1|bit7|cout~0_combout\,
	combout => \adder10_1|bit8|cout~0_combout\);

\Add0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~23_combout\ = \Add0~21\ $ (((!\adder9_1|bit8|cout~0_combout\ & !\adder10_1|bit8|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111100001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \adder9_1|bit8|cout~0_combout\,
	datab => \adder10_1|bit8|cout~0_combout\,
	cin => \Add0~21\,
	combout => \Add0~23_combout\);

\Add0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~25_combout\ = (\process_0~0_combout\ & (\operand3[7]~input_o\)) # (!\process_0~0_combout\ & ((\Add0~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \operand3[7]~input_o\,
	datab => \Add0~23_combout\,
	datad => \process_0~0_combout\,
	combout => \Add0~25_combout\);

ww_Result(0) <= \Result[0]~output_o\;

ww_Result(1) <= \Result[1]~output_o\;

ww_Result(2) <= \Result[2]~output_o\;

ww_Result(3) <= \Result[3]~output_o\;

ww_Result(4) <= \Result[4]~output_o\;

ww_Result(5) <= \Result[5]~output_o\;

ww_Result(6) <= \Result[6]~output_o\;

ww_Result(7) <= \Result[7]~output_o\;
END structure;


