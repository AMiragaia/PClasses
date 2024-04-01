library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegisterDecoder is
	port(clk : in std_logic;
		 en : in std_logic;
		 WE : out std_logic_vector(3 downto 0));
end RegisterDecoder;

architecture Behavioral of RegisterDecoder is
begin
	WE(0) <= (not clk(1)) and (not en(0));
	WE(1) <= (not clk(1)) and ( en(0));
	WE(2) <= (clk(1)) and (not en(0));
	WE(3) <= (clk(1)) and ( en(0));
end Behavioral;