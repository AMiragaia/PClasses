LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY accn IS
	GENERIC (n : POSITIVE := 4);
	PORT (
		reset : IN STD_LOGIC;
		enable : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		datain : IN STD_LOGIC_VECTOR((n - 1) DOWNTO 0);
		dataout : OUT STD_LOGIC_VECTOR((n - 1) DOWNTO 0));
END accn;

ARCHITECTURE behavioral OF accn IS
	SIGNAL regdataout, adderdataout : STD_LOGIC_VECTOR((n - 1) DOWNTO 0);
BEGIN
	adder : ENTITY work.addern(behavioral)
		GENERIC MAP(n => n)
		PORT MAP(
			operand0 => datain,
			operand1 => regdataout,
			result => adderdataout);
	result => adderdataout);
	reg : ENTITY work.regn(behavioral)
		GENERIC MAP(n => n)
		PORT MAP(
			reset => reset,
			enable => enable,
			clock => clock,
			datain => adderdataout,
			dataout => regdataout);
	dataout => regdataout);