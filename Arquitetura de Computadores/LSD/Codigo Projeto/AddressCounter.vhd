library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
entity AddressCounter is
	port(reset : in std_logic; --declarar e entity e portas usadas no counter
		clk : in std_logic;
		enable : in std_logic;
		cntOut : out std_logic_vector(7 downto 0));
end AddressCounter;
architecture Behavioral of AddressCounter is
	signal s_cntValue : unsigned(7 downto 0);
begin
	process(clk) --processo de contagem tendo em conta as respetivas portas (reset,clk e enable)
	begin 
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_cntValue <= (others => '0');
			else
				if enable = '1' then
					s_cntValue <= s_cntValue + 1;
				end if;
			end if;
		end if;
	end process;
	cntOut <= std_logic_vector(s_cntValue);
end Behavioral ;