library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity RegisterBank is
    port(Reset    : in std_logic; 
         WE    	  : in std_logic_vector(3 downto 0); 
		 DataOut1 : out std_logic_vector(7 downto 0);
		 DataOut2 : out std_logic_vector(7 downto 0);
		 DataOut3 : out std_logic_vector(7 downto 0);
		 DataOut4 : out std_logic_vector(7 downto 0);
         WrData   : in std_logic_vector(7 downto 0));
         
end RegisterBank;

architecture behavioral of RegisterBank is

    signal DataIn1 : std_logic_vector(7 downto 0);
	 signal DataIn2 : std_logic_vector(7 downto 0);
	 signal DataIn3 : std_logic_vector(7 downto 0);
	 signal DataIn4 : std_logic_vector(7 downto 0);

begin

	reg8bits1 : entity work.Register8bits(behavioral)
	port map(WE => WE,
			 Reset => Reset,
			 DataOut => DataOut1,
			 WrData => DataIn1); 

	
	reg8bits2 : entity work.Register8bits(behavioral)
	port map(WE => WE,
			 Reset => Reset,
			 DataOut => DataOut2,
			 WrData => DataIn2); 
	
	reg8bits3 : entity work.Register8bits(behavioral)
	port map(WE => WE,
			 Reset => Reset,
			 DataOut => DataOut3,
			 WrData => DataIn3); 
	
	reg8bits4 : entity work.Register8bits(behavioral)
	port map(WE => WE,
			 Reset => Reset,
			 DataOut => DataOut4,
			 WrData => DataIn4);
			 
	process(WE)
	begin
		if (WE = "0001") then
			dataOut1 <= WrData;
		elsif (WE = "0010") then
			dataOut2 <= WrData;
		elsif (WE = "0100") then
			dataOut3 <= WrData;
		elsif (WE = "1000") then
			dataOut4 <= WrData;
		end if;
	end process;
	
end behavioral;



			



