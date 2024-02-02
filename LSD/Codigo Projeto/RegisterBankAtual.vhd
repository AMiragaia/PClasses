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
	signal sdataout1 : std_logic_vector(7 downto 0);
	signal sdataout2 : std_logic_vector(7 downto 0);
	signal sdataout3 : std_logic_vector(7 downto 0);
	signal sdataout4 : std_logic_vector(7 downto 0);
	subtype regX is std_logic_vector(7 downto 0);
	type reg_array is array (0 to 3) of regX;
	signal array1 : reg_array;
begin
	process(Reset,WE,WriteData)
	begin
		if reset = '1' then
			dataOut1 <= "00000000";
			dataOut2 <= "00000000";
			dataOut3 <= "00000000";
			dataOut4 <= "00000000";
		else
			if (WE = '1') then
				array1(0 to 2) <= array1(1 to 3);
				array1(0) <= WriteData;
			else
				DataOut1 <= sdataOut1;
				DataOut2 <= sdataOut2;
				DataOut3 <= sdataOut3;
				DataOut4 <= sdataOut4;
			end if;
		end if;
	end process;
	sdataOut1 <= array1(0);
	sdataOut2 <= array1(1);
	sdataOut3 <= array1(2);
	sdataOut4 <= array1(3);
	
end behavioral;
