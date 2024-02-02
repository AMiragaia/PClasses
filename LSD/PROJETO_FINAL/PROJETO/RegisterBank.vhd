library ieee;
use ieee.std_logic_1164.all;

entity RegisterBank is
	port(Reset : IN std_logic;
		  WE:    IN std_logic;
		  WriteData:  IN std_logic_vector (7 downto 0);
	     DataOut1:  OUT std_logic_vector (7 downto 0);
		  DataOut2:  OUT std_logic_vector (7 downto 0);
		  DataOut3:  OUT std_logic_vector (7 downto 0);
		  DataOut4:  OUT std_logic_vector (7 downto 0));
end RegisterBank;

architecture behavioral of RegisterBank is
	subtype regX is std_logic_vector(7 downto 0);
	type reg_array is array (0 to 3) of regX;
	signal array1 : reg_array;
begin
	process(WE,Reset,array1)
	begin
			if reset = '1' then
				array1(0) <= (others => '0');
				array1(1) <= (others => '0');
				array1(2) <= (others => '0');
				array1(3) <= (others => '0');
			else
				if (rising_edge(WE)) then
					array1(1 to 3) <= array1(0 to 2);
					array1(0) <= WriteData;
					
				else
					array1(0) <= array1(0);
					array1(1) <= array1(1);
					array1(2) <= array1(2);
					array1(3) <= array1(3);
				end if;
			end if;
	end process;
		DataOut1 <= array1(0);
		DataOut2 <= array1(1);
		DataOut3 <= array1(2);
		DataOut4 <=	array1(3);
	
	
end behavioral;
