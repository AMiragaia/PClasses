library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register8bits is
	port(WE	 : in std_logic_vector(1 downto 0);
		  Reset	 : in std_logic;
		  WrData  : in std_logic_vector(7 downto 0);
		  dataOut : out std_logic_vector(7 downto 0));
end Register8bits;

architecture Behavioral of Register8bits is
begin
	process(reset)
	begin
		if reset = '1' then
			dataOut <= (others => '0');
		else
			if WE = '01' then
				dataOut <= WrData;
			else
				dataOut <= dataOut;
			end if;
		end if;
	end process;
	
end Behavioral;