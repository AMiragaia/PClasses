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

-- DATE "05/04/2022 11:52:49"

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

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ShiftRegister_Demo IS
    PORT (
	SW : IN std_logic_vector(0 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	LEDR : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END ShiftRegister_Demo;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ShiftRegister_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \divisor|clkout~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \divisor|s_counter[0]~26_combout\ : std_logic;
SIGNAL \divisor|s_counter[12]~51\ : std_logic;
SIGNAL \divisor|s_counter[13]~52_combout\ : std_logic;
SIGNAL \divisor|s_counter[13]~53\ : std_logic;
SIGNAL \divisor|s_counter[14]~54_combout\ : std_logic;
SIGNAL \divisor|s_counter[14]~55\ : std_logic;
SIGNAL \divisor|s_counter[15]~56_combout\ : std_logic;
SIGNAL \divisor|s_counter[15]~57\ : std_logic;
SIGNAL \divisor|s_counter[16]~58_combout\ : std_logic;
SIGNAL \divisor|s_counter[16]~59\ : std_logic;
SIGNAL \divisor|s_counter[17]~60_combout\ : std_logic;
SIGNAL \divisor|s_counter[17]~61\ : std_logic;
SIGNAL \divisor|s_counter[18]~62_combout\ : std_logic;
SIGNAL \divisor|s_counter[18]~63\ : std_logic;
SIGNAL \divisor|s_counter[19]~64_combout\ : std_logic;
SIGNAL \divisor|s_counter[19]~65\ : std_logic;
SIGNAL \divisor|s_counter[20]~66_combout\ : std_logic;
SIGNAL \divisor|s_counter[20]~67\ : std_logic;
SIGNAL \divisor|s_counter[21]~68_combout\ : std_logic;
SIGNAL \divisor|s_counter[21]~69\ : std_logic;
SIGNAL \divisor|s_counter[22]~70_combout\ : std_logic;
SIGNAL \divisor|s_counter[22]~71\ : std_logic;
SIGNAL \divisor|s_counter[23]~72_combout\ : std_logic;
SIGNAL \divisor|s_counter[23]~73\ : std_logic;
SIGNAL \divisor|s_counter[24]~74_combout\ : std_logic;
SIGNAL \divisor|s_counter[24]~75\ : std_logic;
SIGNAL \divisor|s_counter[25]~76_combout\ : std_logic;
SIGNAL \divisor|LessThan0~4_combout\ : std_logic;
SIGNAL \divisor|clkout~4_combout\ : std_logic;
SIGNAL \divisor|LessThan0~5_combout\ : std_logic;
SIGNAL \divisor|LessThan0~2_combout\ : std_logic;
SIGNAL \divisor|LessThan0~3_combout\ : std_logic;
SIGNAL \divisor|clkout~3_combout\ : std_logic;
SIGNAL \divisor|LessThan0~0_combout\ : std_logic;
SIGNAL \divisor|clkout~0_combout\ : std_logic;
SIGNAL \divisor|clkout~1_combout\ : std_logic;
SIGNAL \divisor|LessThan0~1_combout\ : std_logic;
SIGNAL \divisor|LessThan0~6_combout\ : std_logic;
SIGNAL \divisor|s_counter[0]~27\ : std_logic;
SIGNAL \divisor|s_counter[1]~28_combout\ : std_logic;
SIGNAL \divisor|s_counter[1]~29\ : std_logic;
SIGNAL \divisor|s_counter[2]~30_combout\ : std_logic;
SIGNAL \divisor|s_counter[2]~31\ : std_logic;
SIGNAL \divisor|s_counter[3]~32_combout\ : std_logic;
SIGNAL \divisor|s_counter[3]~33\ : std_logic;
SIGNAL \divisor|s_counter[4]~34_combout\ : std_logic;
SIGNAL \divisor|s_counter[4]~35\ : std_logic;
SIGNAL \divisor|s_counter[5]~36_combout\ : std_logic;
SIGNAL \divisor|s_counter[5]~37\ : std_logic;
SIGNAL \divisor|s_counter[6]~38_combout\ : std_logic;
SIGNAL \divisor|s_counter[6]~39\ : std_logic;
SIGNAL \divisor|s_counter[7]~40_combout\ : std_logic;
SIGNAL \divisor|s_counter[7]~41\ : std_logic;
SIGNAL \divisor|s_counter[8]~42_combout\ : std_logic;
SIGNAL \divisor|s_counter[8]~43\ : std_logic;
SIGNAL \divisor|s_counter[9]~44_combout\ : std_logic;
SIGNAL \divisor|s_counter[9]~45\ : std_logic;
SIGNAL \divisor|s_counter[10]~46_combout\ : std_logic;
SIGNAL \divisor|s_counter[10]~47\ : std_logic;
SIGNAL \divisor|s_counter[11]~48_combout\ : std_logic;
SIGNAL \divisor|s_counter[11]~49\ : std_logic;
SIGNAL \divisor|s_counter[12]~50_combout\ : std_logic;
SIGNAL \divisor|clkout~2_combout\ : std_logic;
SIGNAL \divisor|clkout~5_combout\ : std_logic;
SIGNAL \divisor|clkout~6_combout\ : std_logic;
SIGNAL \divisor|clkout~7_combout\ : std_logic;
SIGNAL \divisor|clkout~8_combout\ : std_logic;
SIGNAL \divisor|clkout~9_combout\ : std_logic;
SIGNAL \divisor|clkout~q\ : std_logic;
SIGNAL \divisor|clkout~clkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \top_level|sdataout[1]~feeder_combout\ : std_logic;
SIGNAL \top_level|sdataout[2]~feeder_combout\ : std_logic;
SIGNAL \top_level|sdataout[3]~feeder_combout\ : std_logic;
SIGNAL \top_level|sdataout[4]~feeder_combout\ : std_logic;
SIGNAL \top_level|sdataout[5]~feeder_combout\ : std_logic;
SIGNAL \top_level|sdataout[6]~feeder_combout\ : std_logic;
SIGNAL \top_level|sdataout[7]~feeder_combout\ : std_logic;
SIGNAL \divisor|s_counter\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \top_level|sdataout\ : std_logic_vector(7 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SW <= SW;
ww_CLOCK_50 <= CLOCK_50;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\divisor|clkout~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \divisor|clkout~q\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(4),
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(5),
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(6),
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \top_level|sdataout\(7),
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X60_Y6_N6
\divisor|s_counter[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[0]~26_combout\ = \divisor|s_counter\(0) $ (VCC)
-- \divisor|s_counter[0]~27\ = CARRY(\divisor|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(0),
	datad => VCC,
	combout => \divisor|s_counter[0]~26_combout\,
	cout => \divisor|s_counter[0]~27\);

-- Location: LCCOMB_X60_Y6_N30
\divisor|s_counter[12]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[12]~50_combout\ = (\divisor|s_counter\(12) & (\divisor|s_counter[11]~49\ $ (GND))) # (!\divisor|s_counter\(12) & (!\divisor|s_counter[11]~49\ & VCC))
-- \divisor|s_counter[12]~51\ = CARRY((\divisor|s_counter\(12) & !\divisor|s_counter[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(12),
	datad => VCC,
	cin => \divisor|s_counter[11]~49\,
	combout => \divisor|s_counter[12]~50_combout\,
	cout => \divisor|s_counter[12]~51\);

-- Location: LCCOMB_X60_Y5_N0
\divisor|s_counter[13]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[13]~52_combout\ = (\divisor|s_counter\(13) & (!\divisor|s_counter[12]~51\)) # (!\divisor|s_counter\(13) & ((\divisor|s_counter[12]~51\) # (GND)))
-- \divisor|s_counter[13]~53\ = CARRY((!\divisor|s_counter[12]~51\) # (!\divisor|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(13),
	datad => VCC,
	cin => \divisor|s_counter[12]~51\,
	combout => \divisor|s_counter[13]~52_combout\,
	cout => \divisor|s_counter[13]~53\);

-- Location: FF_X59_Y6_N21
\divisor|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \divisor|s_counter[13]~52_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(13));

-- Location: LCCOMB_X60_Y5_N2
\divisor|s_counter[14]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[14]~54_combout\ = (\divisor|s_counter\(14) & (\divisor|s_counter[13]~53\ $ (GND))) # (!\divisor|s_counter\(14) & (!\divisor|s_counter[13]~53\ & VCC))
-- \divisor|s_counter[14]~55\ = CARRY((\divisor|s_counter\(14) & !\divisor|s_counter[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(14),
	datad => VCC,
	cin => \divisor|s_counter[13]~53\,
	combout => \divisor|s_counter[14]~54_combout\,
	cout => \divisor|s_counter[14]~55\);

-- Location: FF_X60_Y5_N3
\divisor|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[14]~54_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(14));

-- Location: LCCOMB_X60_Y5_N4
\divisor|s_counter[15]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[15]~56_combout\ = (\divisor|s_counter\(15) & (!\divisor|s_counter[14]~55\)) # (!\divisor|s_counter\(15) & ((\divisor|s_counter[14]~55\) # (GND)))
-- \divisor|s_counter[15]~57\ = CARRY((!\divisor|s_counter[14]~55\) # (!\divisor|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(15),
	datad => VCC,
	cin => \divisor|s_counter[14]~55\,
	combout => \divisor|s_counter[15]~56_combout\,
	cout => \divisor|s_counter[15]~57\);

-- Location: FF_X60_Y5_N5
\divisor|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[15]~56_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(15));

-- Location: LCCOMB_X60_Y5_N6
\divisor|s_counter[16]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[16]~58_combout\ = (\divisor|s_counter\(16) & (\divisor|s_counter[15]~57\ $ (GND))) # (!\divisor|s_counter\(16) & (!\divisor|s_counter[15]~57\ & VCC))
-- \divisor|s_counter[16]~59\ = CARRY((\divisor|s_counter\(16) & !\divisor|s_counter[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(16),
	datad => VCC,
	cin => \divisor|s_counter[15]~57\,
	combout => \divisor|s_counter[16]~58_combout\,
	cout => \divisor|s_counter[16]~59\);

-- Location: FF_X60_Y5_N7
\divisor|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[16]~58_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(16));

-- Location: LCCOMB_X60_Y5_N8
\divisor|s_counter[17]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[17]~60_combout\ = (\divisor|s_counter\(17) & (!\divisor|s_counter[16]~59\)) # (!\divisor|s_counter\(17) & ((\divisor|s_counter[16]~59\) # (GND)))
-- \divisor|s_counter[17]~61\ = CARRY((!\divisor|s_counter[16]~59\) # (!\divisor|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(17),
	datad => VCC,
	cin => \divisor|s_counter[16]~59\,
	combout => \divisor|s_counter[17]~60_combout\,
	cout => \divisor|s_counter[17]~61\);

-- Location: FF_X60_Y5_N9
\divisor|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[17]~60_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(17));

-- Location: LCCOMB_X60_Y5_N10
\divisor|s_counter[18]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[18]~62_combout\ = (\divisor|s_counter\(18) & (\divisor|s_counter[17]~61\ $ (GND))) # (!\divisor|s_counter\(18) & (!\divisor|s_counter[17]~61\ & VCC))
-- \divisor|s_counter[18]~63\ = CARRY((\divisor|s_counter\(18) & !\divisor|s_counter[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(18),
	datad => VCC,
	cin => \divisor|s_counter[17]~61\,
	combout => \divisor|s_counter[18]~62_combout\,
	cout => \divisor|s_counter[18]~63\);

-- Location: FF_X60_Y5_N11
\divisor|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[18]~62_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(18));

-- Location: LCCOMB_X60_Y5_N12
\divisor|s_counter[19]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[19]~64_combout\ = (\divisor|s_counter\(19) & (!\divisor|s_counter[18]~63\)) # (!\divisor|s_counter\(19) & ((\divisor|s_counter[18]~63\) # (GND)))
-- \divisor|s_counter[19]~65\ = CARRY((!\divisor|s_counter[18]~63\) # (!\divisor|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(19),
	datad => VCC,
	cin => \divisor|s_counter[18]~63\,
	combout => \divisor|s_counter[19]~64_combout\,
	cout => \divisor|s_counter[19]~65\);

-- Location: FF_X60_Y5_N13
\divisor|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[19]~64_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(19));

-- Location: LCCOMB_X60_Y5_N14
\divisor|s_counter[20]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[20]~66_combout\ = (\divisor|s_counter\(20) & (\divisor|s_counter[19]~65\ $ (GND))) # (!\divisor|s_counter\(20) & (!\divisor|s_counter[19]~65\ & VCC))
-- \divisor|s_counter[20]~67\ = CARRY((\divisor|s_counter\(20) & !\divisor|s_counter[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(20),
	datad => VCC,
	cin => \divisor|s_counter[19]~65\,
	combout => \divisor|s_counter[20]~66_combout\,
	cout => \divisor|s_counter[20]~67\);

-- Location: FF_X60_Y5_N15
\divisor|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[20]~66_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(20));

-- Location: LCCOMB_X60_Y5_N16
\divisor|s_counter[21]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[21]~68_combout\ = (\divisor|s_counter\(21) & (!\divisor|s_counter[20]~67\)) # (!\divisor|s_counter\(21) & ((\divisor|s_counter[20]~67\) # (GND)))
-- \divisor|s_counter[21]~69\ = CARRY((!\divisor|s_counter[20]~67\) # (!\divisor|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(21),
	datad => VCC,
	cin => \divisor|s_counter[20]~67\,
	combout => \divisor|s_counter[21]~68_combout\,
	cout => \divisor|s_counter[21]~69\);

-- Location: FF_X60_Y5_N17
\divisor|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[21]~68_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(21));

-- Location: LCCOMB_X60_Y5_N18
\divisor|s_counter[22]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[22]~70_combout\ = (\divisor|s_counter\(22) & (\divisor|s_counter[21]~69\ $ (GND))) # (!\divisor|s_counter\(22) & (!\divisor|s_counter[21]~69\ & VCC))
-- \divisor|s_counter[22]~71\ = CARRY((\divisor|s_counter\(22) & !\divisor|s_counter[21]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(22),
	datad => VCC,
	cin => \divisor|s_counter[21]~69\,
	combout => \divisor|s_counter[22]~70_combout\,
	cout => \divisor|s_counter[22]~71\);

-- Location: FF_X60_Y5_N19
\divisor|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[22]~70_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(22));

-- Location: LCCOMB_X60_Y5_N20
\divisor|s_counter[23]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[23]~72_combout\ = (\divisor|s_counter\(23) & (!\divisor|s_counter[22]~71\)) # (!\divisor|s_counter\(23) & ((\divisor|s_counter[22]~71\) # (GND)))
-- \divisor|s_counter[23]~73\ = CARRY((!\divisor|s_counter[22]~71\) # (!\divisor|s_counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(23),
	datad => VCC,
	cin => \divisor|s_counter[22]~71\,
	combout => \divisor|s_counter[23]~72_combout\,
	cout => \divisor|s_counter[23]~73\);

-- Location: FF_X60_Y5_N21
\divisor|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[23]~72_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(23));

-- Location: LCCOMB_X60_Y5_N22
\divisor|s_counter[24]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[24]~74_combout\ = (\divisor|s_counter\(24) & (\divisor|s_counter[23]~73\ $ (GND))) # (!\divisor|s_counter\(24) & (!\divisor|s_counter[23]~73\ & VCC))
-- \divisor|s_counter[24]~75\ = CARRY((\divisor|s_counter\(24) & !\divisor|s_counter[23]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(24),
	datad => VCC,
	cin => \divisor|s_counter[23]~73\,
	combout => \divisor|s_counter[24]~74_combout\,
	cout => \divisor|s_counter[24]~75\);

-- Location: FF_X60_Y5_N23
\divisor|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[24]~74_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(24));

-- Location: LCCOMB_X60_Y5_N24
\divisor|s_counter[25]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[25]~76_combout\ = \divisor|s_counter[24]~75\ $ (\divisor|s_counter\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \divisor|s_counter\(25),
	cin => \divisor|s_counter[24]~75\,
	combout => \divisor|s_counter[25]~76_combout\);

-- Location: FF_X60_Y5_N25
\divisor|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[25]~76_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(25));

-- Location: LCCOMB_X60_Y5_N26
\divisor|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~4_combout\ = ((!\divisor|s_counter\(18) & !\divisor|s_counter\(17))) # (!\divisor|s_counter\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(18),
	datac => \divisor|s_counter\(17),
	datad => \divisor|s_counter\(23),
	combout => \divisor|LessThan0~4_combout\);

-- Location: LCCOMB_X60_Y5_N30
\divisor|clkout~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~4_combout\ = (\divisor|s_counter\(19) & (\divisor|s_counter\(21) & (\divisor|s_counter\(20) & \divisor|s_counter\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(19),
	datab => \divisor|s_counter\(21),
	datac => \divisor|s_counter\(20),
	datad => \divisor|s_counter\(22),
	combout => \divisor|clkout~4_combout\);

-- Location: LCCOMB_X59_Y6_N2
\divisor|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~5_combout\ = ((!\divisor|s_counter\(24) & ((\divisor|LessThan0~4_combout\) # (!\divisor|clkout~4_combout\)))) # (!\divisor|s_counter\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(25),
	datab => \divisor|s_counter\(24),
	datac => \divisor|LessThan0~4_combout\,
	datad => \divisor|clkout~4_combout\,
	combout => \divisor|LessThan0~5_combout\);

-- Location: LCCOMB_X59_Y6_N10
\divisor|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~2_combout\ = (((!\divisor|s_counter\(14)) # (!\divisor|s_counter\(15))) # (!\divisor|s_counter\(13))) # (!\divisor|s_counter\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(12),
	datab => \divisor|s_counter\(13),
	datac => \divisor|s_counter\(15),
	datad => \divisor|s_counter\(14),
	combout => \divisor|LessThan0~2_combout\);

-- Location: LCCOMB_X59_Y6_N14
\divisor|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~3_combout\ = (!\divisor|s_counter\(24) & (!\divisor|s_counter\(18) & (!\divisor|s_counter\(16) & \divisor|LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(24),
	datab => \divisor|s_counter\(18),
	datac => \divisor|s_counter\(16),
	datad => \divisor|LessThan0~2_combout\,
	combout => \divisor|LessThan0~3_combout\);

-- Location: LCCOMB_X60_Y6_N4
\divisor|clkout~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~3_combout\ = (!\divisor|s_counter\(8) & (!\divisor|s_counter\(7) & (!\divisor|s_counter\(10) & !\divisor|s_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(8),
	datab => \divisor|s_counter\(7),
	datac => \divisor|s_counter\(10),
	datad => \divisor|s_counter\(9),
	combout => \divisor|clkout~3_combout\);

-- Location: LCCOMB_X59_Y6_N26
\divisor|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~0_combout\ = (!\divisor|s_counter\(11) & (!\divisor|s_counter\(18) & (!\divisor|s_counter\(16) & !\divisor|s_counter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(11),
	datab => \divisor|s_counter\(18),
	datac => \divisor|s_counter\(16),
	datad => \divisor|s_counter\(24),
	combout => \divisor|LessThan0~0_combout\);

-- Location: LCCOMB_X60_Y6_N0
\divisor|clkout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~0_combout\ = (\divisor|s_counter\(3) & (\divisor|s_counter\(1) & (\divisor|s_counter\(0) & \divisor|s_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(3),
	datab => \divisor|s_counter\(1),
	datac => \divisor|s_counter\(0),
	datad => \divisor|s_counter\(2),
	combout => \divisor|clkout~0_combout\);

-- Location: LCCOMB_X60_Y6_N2
\divisor|clkout~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~1_combout\ = (\divisor|s_counter\(5) & (\divisor|s_counter\(4) & \divisor|clkout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(5),
	datac => \divisor|s_counter\(4),
	datad => \divisor|clkout~0_combout\,
	combout => \divisor|clkout~1_combout\);

-- Location: LCCOMB_X59_Y6_N28
\divisor|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~1_combout\ = (\divisor|clkout~3_combout\ & (\divisor|LessThan0~0_combout\ & ((!\divisor|clkout~1_combout\) # (!\divisor|s_counter\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|clkout~3_combout\,
	datab => \divisor|s_counter\(6),
	datac => \divisor|LessThan0~0_combout\,
	datad => \divisor|clkout~1_combout\,
	combout => \divisor|LessThan0~1_combout\);

-- Location: LCCOMB_X59_Y6_N30
\divisor|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~6_combout\ = (!\divisor|LessThan0~5_combout\ & (!\divisor|LessThan0~3_combout\ & !\divisor|LessThan0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|LessThan0~5_combout\,
	datac => \divisor|LessThan0~3_combout\,
	datad => \divisor|LessThan0~1_combout\,
	combout => \divisor|LessThan0~6_combout\);

-- Location: FF_X60_Y6_N7
\divisor|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[0]~26_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(0));

-- Location: LCCOMB_X60_Y6_N8
\divisor|s_counter[1]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[1]~28_combout\ = (\divisor|s_counter\(1) & (!\divisor|s_counter[0]~27\)) # (!\divisor|s_counter\(1) & ((\divisor|s_counter[0]~27\) # (GND)))
-- \divisor|s_counter[1]~29\ = CARRY((!\divisor|s_counter[0]~27\) # (!\divisor|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(1),
	datad => VCC,
	cin => \divisor|s_counter[0]~27\,
	combout => \divisor|s_counter[1]~28_combout\,
	cout => \divisor|s_counter[1]~29\);

-- Location: FF_X60_Y6_N9
\divisor|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[1]~28_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(1));

-- Location: LCCOMB_X60_Y6_N10
\divisor|s_counter[2]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[2]~30_combout\ = (\divisor|s_counter\(2) & (\divisor|s_counter[1]~29\ $ (GND))) # (!\divisor|s_counter\(2) & (!\divisor|s_counter[1]~29\ & VCC))
-- \divisor|s_counter[2]~31\ = CARRY((\divisor|s_counter\(2) & !\divisor|s_counter[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(2),
	datad => VCC,
	cin => \divisor|s_counter[1]~29\,
	combout => \divisor|s_counter[2]~30_combout\,
	cout => \divisor|s_counter[2]~31\);

-- Location: FF_X60_Y6_N11
\divisor|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[2]~30_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(2));

-- Location: LCCOMB_X60_Y6_N12
\divisor|s_counter[3]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[3]~32_combout\ = (\divisor|s_counter\(3) & (!\divisor|s_counter[2]~31\)) # (!\divisor|s_counter\(3) & ((\divisor|s_counter[2]~31\) # (GND)))
-- \divisor|s_counter[3]~33\ = CARRY((!\divisor|s_counter[2]~31\) # (!\divisor|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(3),
	datad => VCC,
	cin => \divisor|s_counter[2]~31\,
	combout => \divisor|s_counter[3]~32_combout\,
	cout => \divisor|s_counter[3]~33\);

-- Location: FF_X60_Y6_N13
\divisor|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[3]~32_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(3));

-- Location: LCCOMB_X60_Y6_N14
\divisor|s_counter[4]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[4]~34_combout\ = (\divisor|s_counter\(4) & (\divisor|s_counter[3]~33\ $ (GND))) # (!\divisor|s_counter\(4) & (!\divisor|s_counter[3]~33\ & VCC))
-- \divisor|s_counter[4]~35\ = CARRY((\divisor|s_counter\(4) & !\divisor|s_counter[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(4),
	datad => VCC,
	cin => \divisor|s_counter[3]~33\,
	combout => \divisor|s_counter[4]~34_combout\,
	cout => \divisor|s_counter[4]~35\);

-- Location: FF_X60_Y6_N15
\divisor|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[4]~34_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(4));

-- Location: LCCOMB_X60_Y6_N16
\divisor|s_counter[5]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[5]~36_combout\ = (\divisor|s_counter\(5) & (!\divisor|s_counter[4]~35\)) # (!\divisor|s_counter\(5) & ((\divisor|s_counter[4]~35\) # (GND)))
-- \divisor|s_counter[5]~37\ = CARRY((!\divisor|s_counter[4]~35\) # (!\divisor|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(5),
	datad => VCC,
	cin => \divisor|s_counter[4]~35\,
	combout => \divisor|s_counter[5]~36_combout\,
	cout => \divisor|s_counter[5]~37\);

-- Location: FF_X60_Y6_N17
\divisor|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[5]~36_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(5));

-- Location: LCCOMB_X60_Y6_N18
\divisor|s_counter[6]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[6]~38_combout\ = (\divisor|s_counter\(6) & (\divisor|s_counter[5]~37\ $ (GND))) # (!\divisor|s_counter\(6) & (!\divisor|s_counter[5]~37\ & VCC))
-- \divisor|s_counter[6]~39\ = CARRY((\divisor|s_counter\(6) & !\divisor|s_counter[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(6),
	datad => VCC,
	cin => \divisor|s_counter[5]~37\,
	combout => \divisor|s_counter[6]~38_combout\,
	cout => \divisor|s_counter[6]~39\);

-- Location: FF_X60_Y6_N19
\divisor|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[6]~38_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(6));

-- Location: LCCOMB_X60_Y6_N20
\divisor|s_counter[7]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[7]~40_combout\ = (\divisor|s_counter\(7) & (!\divisor|s_counter[6]~39\)) # (!\divisor|s_counter\(7) & ((\divisor|s_counter[6]~39\) # (GND)))
-- \divisor|s_counter[7]~41\ = CARRY((!\divisor|s_counter[6]~39\) # (!\divisor|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(7),
	datad => VCC,
	cin => \divisor|s_counter[6]~39\,
	combout => \divisor|s_counter[7]~40_combout\,
	cout => \divisor|s_counter[7]~41\);

-- Location: FF_X60_Y6_N21
\divisor|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[7]~40_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(7));

-- Location: LCCOMB_X60_Y6_N22
\divisor|s_counter[8]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[8]~42_combout\ = (\divisor|s_counter\(8) & (\divisor|s_counter[7]~41\ $ (GND))) # (!\divisor|s_counter\(8) & (!\divisor|s_counter[7]~41\ & VCC))
-- \divisor|s_counter[8]~43\ = CARRY((\divisor|s_counter\(8) & !\divisor|s_counter[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(8),
	datad => VCC,
	cin => \divisor|s_counter[7]~41\,
	combout => \divisor|s_counter[8]~42_combout\,
	cout => \divisor|s_counter[8]~43\);

-- Location: FF_X60_Y6_N23
\divisor|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[8]~42_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(8));

-- Location: LCCOMB_X60_Y6_N24
\divisor|s_counter[9]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[9]~44_combout\ = (\divisor|s_counter\(9) & (!\divisor|s_counter[8]~43\)) # (!\divisor|s_counter\(9) & ((\divisor|s_counter[8]~43\) # (GND)))
-- \divisor|s_counter[9]~45\ = CARRY((!\divisor|s_counter[8]~43\) # (!\divisor|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(9),
	datad => VCC,
	cin => \divisor|s_counter[8]~43\,
	combout => \divisor|s_counter[9]~44_combout\,
	cout => \divisor|s_counter[9]~45\);

-- Location: FF_X60_Y6_N25
\divisor|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[9]~44_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(9));

-- Location: LCCOMB_X60_Y6_N26
\divisor|s_counter[10]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[10]~46_combout\ = (\divisor|s_counter\(10) & (\divisor|s_counter[9]~45\ $ (GND))) # (!\divisor|s_counter\(10) & (!\divisor|s_counter[9]~45\ & VCC))
-- \divisor|s_counter[10]~47\ = CARRY((\divisor|s_counter\(10) & !\divisor|s_counter[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(10),
	datad => VCC,
	cin => \divisor|s_counter[9]~45\,
	combout => \divisor|s_counter[10]~46_combout\,
	cout => \divisor|s_counter[10]~47\);

-- Location: FF_X60_Y6_N27
\divisor|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[10]~46_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(10));

-- Location: LCCOMB_X60_Y6_N28
\divisor|s_counter[11]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|s_counter[11]~48_combout\ = (\divisor|s_counter\(11) & (!\divisor|s_counter[10]~47\)) # (!\divisor|s_counter\(11) & ((\divisor|s_counter[10]~47\) # (GND)))
-- \divisor|s_counter[11]~49\ = CARRY((!\divisor|s_counter[10]~47\) # (!\divisor|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|s_counter\(11),
	datad => VCC,
	cin => \divisor|s_counter[10]~47\,
	combout => \divisor|s_counter[11]~48_combout\,
	cout => \divisor|s_counter[11]~49\);

-- Location: FF_X60_Y6_N29
\divisor|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[11]~48_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(11));

-- Location: FF_X60_Y6_N31
\divisor|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|s_counter[12]~50_combout\,
	sclr => \divisor|LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|s_counter\(12));

-- Location: LCCOMB_X59_Y6_N22
\divisor|clkout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~2_combout\ = (\divisor|s_counter\(12) & (\divisor|s_counter\(14) & (\divisor|s_counter\(13) & !\divisor|s_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(12),
	datab => \divisor|s_counter\(14),
	datac => \divisor|s_counter\(13),
	datad => \divisor|s_counter\(6),
	combout => \divisor|clkout~2_combout\);

-- Location: LCCOMB_X60_Y5_N28
\divisor|clkout~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~5_combout\ = (\divisor|s_counter\(18) & (!\divisor|s_counter\(23) & (\divisor|s_counter\(24) & !\divisor|s_counter\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(18),
	datab => \divisor|s_counter\(23),
	datac => \divisor|s_counter\(24),
	datad => \divisor|s_counter\(25),
	combout => \divisor|clkout~5_combout\);

-- Location: LCCOMB_X59_Y6_N16
\divisor|clkout~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~6_combout\ = (\divisor|s_counter\(16) & (!\divisor|s_counter\(15) & (\divisor|clkout~5_combout\ & !\divisor|s_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|s_counter\(16),
	datab => \divisor|s_counter\(15),
	datac => \divisor|clkout~5_combout\,
	datad => \divisor|s_counter\(17),
	combout => \divisor|clkout~6_combout\);

-- Location: LCCOMB_X59_Y6_N6
\divisor|clkout~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~7_combout\ = (\divisor|clkout~4_combout\ & (\divisor|s_counter\(11) & (\divisor|clkout~3_combout\ & \divisor|clkout~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|clkout~4_combout\,
	datab => \divisor|s_counter\(11),
	datac => \divisor|clkout~3_combout\,
	datad => \divisor|clkout~6_combout\,
	combout => \divisor|clkout~7_combout\);

-- Location: LCCOMB_X59_Y6_N24
\divisor|clkout~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~8_combout\ = (\divisor|clkout~q\) # ((\divisor|clkout~2_combout\ & (\divisor|clkout~1_combout\ & \divisor|clkout~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|clkout~2_combout\,
	datab => \divisor|clkout~q\,
	datac => \divisor|clkout~1_combout\,
	datad => \divisor|clkout~7_combout\,
	combout => \divisor|clkout~8_combout\);

-- Location: LCCOMB_X59_Y6_N18
\divisor|clkout~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|clkout~9_combout\ = (\divisor|clkout~8_combout\ & ((\divisor|LessThan0~1_combout\) # ((\divisor|LessThan0~5_combout\) # (\divisor|LessThan0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|clkout~8_combout\,
	datab => \divisor|LessThan0~1_combout\,
	datac => \divisor|LessThan0~5_combout\,
	datad => \divisor|LessThan0~3_combout\,
	combout => \divisor|clkout~9_combout\);

-- Location: FF_X59_Y6_N19
\divisor|clkout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \divisor|clkout~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|clkout~q\);

-- Location: CLKCTRL_G15
\divisor|clkout~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \divisor|clkout~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \divisor|clkout~clkctrl_outclk\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: FF_X88_Y72_N29
\top_level|sdataout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(0));

-- Location: LCCOMB_X88_Y72_N18
\top_level|sdataout[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[1]~feeder_combout\ = \top_level|sdataout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(0),
	combout => \top_level|sdataout[1]~feeder_combout\);

-- Location: FF_X88_Y72_N19
\top_level|sdataout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(1));

-- Location: LCCOMB_X88_Y72_N16
\top_level|sdataout[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[2]~feeder_combout\ = \top_level|sdataout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(1),
	combout => \top_level|sdataout[2]~feeder_combout\);

-- Location: FF_X88_Y72_N17
\top_level|sdataout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(2));

-- Location: LCCOMB_X88_Y72_N6
\top_level|sdataout[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[3]~feeder_combout\ = \top_level|sdataout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(2),
	combout => \top_level|sdataout[3]~feeder_combout\);

-- Location: FF_X88_Y72_N7
\top_level|sdataout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(3));

-- Location: LCCOMB_X88_Y72_N0
\top_level|sdataout[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[4]~feeder_combout\ = \top_level|sdataout\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(3),
	combout => \top_level|sdataout[4]~feeder_combout\);

-- Location: FF_X88_Y72_N1
\top_level|sdataout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(4));

-- Location: LCCOMB_X88_Y72_N2
\top_level|sdataout[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[5]~feeder_combout\ = \top_level|sdataout\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(4),
	combout => \top_level|sdataout[5]~feeder_combout\);

-- Location: FF_X88_Y72_N3
\top_level|sdataout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(5));

-- Location: LCCOMB_X88_Y72_N20
\top_level|sdataout[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[6]~feeder_combout\ = \top_level|sdataout\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(5),
	combout => \top_level|sdataout[6]~feeder_combout\);

-- Location: FF_X88_Y72_N21
\top_level|sdataout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(6));

-- Location: LCCOMB_X88_Y72_N22
\top_level|sdataout[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \top_level|sdataout[7]~feeder_combout\ = \top_level|sdataout\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \top_level|sdataout\(6),
	combout => \top_level|sdataout[7]~feeder_combout\);

-- Location: FF_X88_Y72_N23
\top_level|sdataout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \divisor|clkout~clkctrl_outclk\,
	d => \top_level|sdataout[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \top_level|sdataout\(7));

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;
END structure;


