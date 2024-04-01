library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_16_8 is
	port (
		addr : in STD_LOGIC_VECTOR(3 downto 0);
		data : out STD_LOGIC_VECTOR(7 downto 0)
	);
end ROM_16_8;
architecture Behavioral of ROM_16_8 is
	subtype ROM_16_8_type is STD_LOGIC_VECTOR(7 downto 0);
	type ROM_16_8_array_type is array (0 to 15) of ROM_16_8_type;
	constant c_memory : ROM_16_8_array_type := (
		"00000000", "00000001", "00000010", "00000011",
		"00000100", "00000101", "00000110", "00000111",
		"00001000", "00001001", "00001010", "00001011",
		"00001100", "00001101", "00001110", "00001111"
	);

begin
	data <= c_memory(to_integer(unsigned(addr)));
end Behavioral;

