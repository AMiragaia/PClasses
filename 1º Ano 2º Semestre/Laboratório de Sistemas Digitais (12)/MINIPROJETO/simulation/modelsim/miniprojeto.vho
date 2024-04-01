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

-- DATE "05/18/2022 12:32:10"

-- 
-- Device: Altera EP4CE115F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	dec4_16 IS
    PORT (
	inputs : IN std_logic_vector(3 DOWNTO 0);
	outputs : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END dec4_16;

-- Design Ports Information
-- outputs[0]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[1]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[2]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[3]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[4]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[5]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[6]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[7]	=>  Location: PIN_P5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[8]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[9]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[10]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[11]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[12]	=>  Location: PIN_P4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[13]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[14]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outputs[15]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputs[3]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputs[2]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputs[1]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inputs[0]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF dec4_16 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_inputs : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_outputs : std_logic_vector(15 DOWNTO 0);
SIGNAL \outputs[0]~output_o\ : std_logic;
SIGNAL \outputs[1]~output_o\ : std_logic;
SIGNAL \outputs[2]~output_o\ : std_logic;
SIGNAL \outputs[3]~output_o\ : std_logic;
SIGNAL \outputs[4]~output_o\ : std_logic;
SIGNAL \outputs[5]~output_o\ : std_logic;
SIGNAL \outputs[6]~output_o\ : std_logic;
SIGNAL \outputs[7]~output_o\ : std_logic;
SIGNAL \outputs[8]~output_o\ : std_logic;
SIGNAL \outputs[9]~output_o\ : std_logic;
SIGNAL \outputs[10]~output_o\ : std_logic;
SIGNAL \outputs[11]~output_o\ : std_logic;
SIGNAL \outputs[12]~output_o\ : std_logic;
SIGNAL \outputs[13]~output_o\ : std_logic;
SIGNAL \outputs[14]~output_o\ : std_logic;
SIGNAL \outputs[15]~output_o\ : std_logic;
SIGNAL \inputs[2]~input_o\ : std_logic;
SIGNAL \inputs[1]~input_o\ : std_logic;
SIGNAL \inputs[3]~input_o\ : std_logic;
SIGNAL \inputs[0]~input_o\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Mux15~2_combout\ : std_logic;
SIGNAL \Mux15~3_combout\ : std_logic;
SIGNAL \Mux15~4_combout\ : std_logic;
SIGNAL \Mux15~5_combout\ : std_logic;
SIGNAL \Mux15~6_combout\ : std_logic;
SIGNAL \Mux15~7_combout\ : std_logic;
SIGNAL \Mux15~8_combout\ : std_logic;
SIGNAL \Mux15~9_combout\ : std_logic;
SIGNAL \Mux15~10_combout\ : std_logic;
SIGNAL \Mux15~11_combout\ : std_logic;
SIGNAL \Mux15~12_combout\ : std_logic;
SIGNAL \Mux15~13_combout\ : std_logic;
SIGNAL \Mux15~14_combout\ : std_logic;
SIGNAL \Mux15~15_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_inputs <= inputs;
outputs <= ww_outputs;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y24_N23
\outputs[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~0_combout\,
	devoe => ww_devoe,
	o => \outputs[0]~output_o\);

-- Location: IOOBUF_X0_Y30_N2
\outputs[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~1_combout\,
	devoe => ww_devoe,
	o => \outputs[1]~output_o\);

-- Location: IOOBUF_X0_Y28_N23
\outputs[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~2_combout\,
	devoe => ww_devoe,
	o => \outputs[2]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\outputs[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~3_combout\,
	devoe => ww_devoe,
	o => \outputs[3]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\outputs[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~4_combout\,
	devoe => ww_devoe,
	o => \outputs[4]~output_o\);

-- Location: IOOBUF_X0_Y24_N2
\outputs[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~5_combout\,
	devoe => ww_devoe,
	o => \outputs[5]~output_o\);

-- Location: IOOBUF_X0_Y30_N9
\outputs[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~6_combout\,
	devoe => ww_devoe,
	o => \outputs[6]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\outputs[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~7_combout\,
	devoe => ww_devoe,
	o => \outputs[7]~output_o\);

-- Location: IOOBUF_X0_Y31_N16
\outputs[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~8_combout\,
	devoe => ww_devoe,
	o => \outputs[8]~output_o\);

-- Location: IOOBUF_X0_Y25_N23
\outputs[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~9_combout\,
	devoe => ww_devoe,
	o => \outputs[9]~output_o\);

-- Location: IOOBUF_X0_Y27_N23
\outputs[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~10_combout\,
	devoe => ww_devoe,
	o => \outputs[10]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\outputs[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~11_combout\,
	devoe => ww_devoe,
	o => \outputs[11]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\outputs[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~12_combout\,
	devoe => ww_devoe,
	o => \outputs[12]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\outputs[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~13_combout\,
	devoe => ww_devoe,
	o => \outputs[13]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\outputs[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~14_combout\,
	devoe => ww_devoe,
	o => \outputs[14]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\outputs[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~15_combout\,
	devoe => ww_devoe,
	o => \outputs[15]~output_o\);

-- Location: IOIBUF_X0_Y29_N22
\inputs[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputs(2),
	o => \inputs[2]~input_o\);

-- Location: IOIBUF_X0_Y29_N15
\inputs[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputs(1),
	o => \inputs[1]~input_o\);

-- Location: IOIBUF_X0_Y22_N22
\inputs[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputs(3),
	o => \inputs[3]~input_o\);

-- Location: IOIBUF_X0_Y32_N15
\inputs[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inputs(0),
	o => \inputs[0]~input_o\);

-- Location: LCCOMB_X1_Y25_N16
\Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (!\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X1_Y25_N10
\Mux15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (!\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~1_combout\);

-- Location: LCCOMB_X1_Y25_N28
\Mux15~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~2_combout\ = (!\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~2_combout\);

-- Location: LCCOMB_X1_Y25_N6
\Mux15~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~3_combout\ = (!\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~3_combout\);

-- Location: LCCOMB_X1_Y25_N0
\Mux15~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~4_combout\ = (\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~4_combout\);

-- Location: LCCOMB_X1_Y25_N2
\Mux15~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~5_combout\ = (\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~5_combout\);

-- Location: LCCOMB_X1_Y25_N4
\Mux15~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~6_combout\ = (\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~6_combout\);

-- Location: LCCOMB_X1_Y25_N30
\Mux15~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~7_combout\ = (\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (!\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~7_combout\);

-- Location: LCCOMB_X1_Y25_N24
\Mux15~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~8_combout\ = (!\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~8_combout\);

-- Location: LCCOMB_X1_Y25_N26
\Mux15~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~9_combout\ = (!\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~9_combout\);

-- Location: LCCOMB_X1_Y25_N12
\Mux15~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~10_combout\ = (!\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~10_combout\);

-- Location: LCCOMB_X1_Y25_N22
\Mux15~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~11_combout\ = (!\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~11_combout\);

-- Location: LCCOMB_X1_Y25_N8
\Mux15~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~12_combout\ = (\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~12_combout\);

-- Location: LCCOMB_X1_Y25_N18
\Mux15~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~13_combout\ = (\inputs[2]~input_o\ & (!\inputs[1]~input_o\ & (\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~13_combout\);

-- Location: LCCOMB_X1_Y25_N20
\Mux15~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~14_combout\ = (\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (\inputs[3]~input_o\ & !\inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~14_combout\);

-- Location: LCCOMB_X1_Y25_N14
\Mux15~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux15~15_combout\ = (\inputs[2]~input_o\ & (\inputs[1]~input_o\ & (\inputs[3]~input_o\ & \inputs[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inputs[2]~input_o\,
	datab => \inputs[1]~input_o\,
	datac => \inputs[3]~input_o\,
	datad => \inputs[0]~input_o\,
	combout => \Mux15~15_combout\);

ww_outputs(0) <= \outputs[0]~output_o\;

ww_outputs(1) <= \outputs[1]~output_o\;

ww_outputs(2) <= \outputs[2]~output_o\;

ww_outputs(3) <= \outputs[3]~output_o\;

ww_outputs(4) <= \outputs[4]~output_o\;

ww_outputs(5) <= \outputs[5]~output_o\;

ww_outputs(6) <= \outputs[6]~output_o\;

ww_outputs(7) <= \outputs[7]~output_o\;

ww_outputs(8) <= \outputs[8]~output_o\;

ww_outputs(9) <= \outputs[9]~output_o\;

ww_outputs(10) <= \outputs[10]~output_o\;

ww_outputs(11) <= \outputs[11]~output_o\;

ww_outputs(12) <= \outputs[12]~output_o\;

ww_outputs(13) <= \outputs[13]~output_o\;

ww_outputs(14) <= \outputs[14]~output_o\;

ww_outputs(15) <= \outputs[15]~output_o\;
END structure;


