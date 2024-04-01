library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RegisterDecoder is
	port(clk : in std_logic;
		 en : in std_logic;
		 WE : out std_logic);
end RegisterDecoder;

architecture Behavioral of RegisterDecoder is
begin
	process(clk)
		begin
			if rising_edge(clk) then
				if en = '1'then
					WE <= '1';
				else
					WE <= '0';
				end if;
			end if;
		end process;
end Behavioral;