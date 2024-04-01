library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlUnit is
		port(clk   		 : in std_logic;
			  reset 		 : out std_logic;
			  start      : out std_logic;
			  filter_on  : out std_logic;
			  rst_ram	 :	out std_logic;
			  SW0 		 : in std_logic;
			  K2         : in std_logic;
			  K1			 : in std_logic;
			  K0 			 : in std_logic);
	
end ControlUnit;
architecture behavioral of ControlUnit is
	type estados is (S,ReadData,ResetRam,WriteData,Filter0,Filter1);
	signal estado: estados;
begin
	reset <= K2;
	rst_ram <= K1;
	start <= K0;
	filter_on <= SW0;
	process(clk,K2)
		begin
			if (K2 = '1') then
				estado <= S;
			elsif rising_edge(clk) then
				case estado is
					When S =>
						if K0 = '1' then
							estado <= ReadData;
						else 
							estado <= S;
						end if;
					when ReadData =>
						if K0 = '1' then
							estado <= ResetRam;
						else 
							estado <= ReadData;
						end if;
					when ResetRam =>
						if K0 = '1' then
							estado <= WriteData;
						end if;
					when WriteData =>
						if (SW0 = '1') then
							estado <= Filter0;
						elsif(SW0 = '0') then
							estado <= Filter1;
						end if;
					when Filter0 =>
						if (K1 = '1') then
							estado <= WriteData;
						elsif (K2 = '1') then
							estado <= ReadData;
						end if;
					when Filter1 =>
						if (K1 = '1') then
							estado <= WriteData;
						elsif (K2 = '1') then
							estado <= ReadData;
						end if;
					when others =>
						estado <= S;
				end case;
		end if;
	end process;
end behavioral;
					
				
			  
			  
			  