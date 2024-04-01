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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Thu Jun 09 19:16:40 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY miniprojeto IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		KEY :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		SW :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		HEX0 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDR :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END miniprojeto;

ARCHITECTURE bdf_type OF miniprojeto IS 

COMPONENT counter4
	PORT(reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 upDown_enable : IN STD_LOGIC;
		 cntOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT decoder7led
	PORT(binInput : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 decOut_n : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT geradordepulso4
GENERIC (MAX : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 pulso : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT geradordepulso1
GENERIC (MAX : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 pulso : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT mux2_1
	PORT(sel : IN STD_LOGIC;
		 input0 : IN STD_LOGIC;
		 input1 : IN STD_LOGIC;
		 muxOut : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT dec4_16
	PORT(inputs : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 outputs : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 



b2v_inst : counter4
PORT MAP(reset => KEY(0),
		 clk => SYNTHESIZED_WIRE_0,
		 enable => SW(0),
		 upDown_enable => SW(1),
		 cntOut => SYNTHESIZED_WIRE_5);


b2v_inst2 : decoder7led
PORT MAP(binInput => SYNTHESIZED_WIRE_5,
		 decOut_n => HEX0);


b2v_inst4 : geradordepulso4
GENERIC MAP(MAX => 12500000
			)
PORT MAP(clk => CLK,
		 reset => SW(2),
		 pulso => SYNTHESIZED_WIRE_2);


b2v_inst5 : geradordepulso1
GENERIC MAP(MAX => 50000000
			)
PORT MAP(clk => CLK,
		 reset => SW(2),
		 pulso => SYNTHESIZED_WIRE_3);


b2v_inst6 : mux2_1
PORT MAP(sel => KEY(1),
		 input0 => SYNTHESIZED_WIRE_2,
		 input1 => SYNTHESIZED_WIRE_3,
		 muxOut => SYNTHESIZED_WIRE_0);


b2v_inst8 : dec4_16
PORT MAP(inputs => SYNTHESIZED_WIRE_5,
		 outputs => LEDR);


END bdf_type;