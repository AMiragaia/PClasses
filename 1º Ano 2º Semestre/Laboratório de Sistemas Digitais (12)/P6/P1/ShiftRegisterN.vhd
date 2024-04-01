library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegisterN is
	generic ( n : positive := 4);
	port(si, clk : in std_logic;
		  dataout : out std_logic_vector((n-1) downto 0));
end ShiftRegisterN;

architecture behavioral of ShiftRegisterN is
	signal sdataout : std_logic_vector((n-1) downto 0);
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			sdataout((n-1) downto 1) <= sdataout((n-2) downto 0);
			sdataout(0) <= si;
		end if;
	end process;
	dataout <= sdataout;
end behavioral;