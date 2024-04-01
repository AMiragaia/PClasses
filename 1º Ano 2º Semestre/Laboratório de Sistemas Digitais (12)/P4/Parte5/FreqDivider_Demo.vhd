library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FreqDivider_Demo is
    port(CLOCK_50 : in  std_logic;
	      SW       : in  std_logic_vector(1 downto 0);
			HEX0     : out std_logic_vector(6 downto 0);
	      LEDG     : out std_logic_vector(3 downto 0));
end FreqDivider_Demo;

architecture Structural of FreqDivider_Demo is
    signal modifiedClock : std_logic;
	 signal internalCount : std_logic_vector(3 downto 0);
begin
    freqDiv1 : entity work.FreqDivider(Behavioral)
	            port map(clkIn  => CLOCK_50,
					         k      => x"02FAF080",
					         clkOut => modifiedClock);
								
	 cUpDown : entity work.CounterUpDown4(Behavioral)
	           port map(clk    => modifiedClock,
				           upDown => SW(0),
							  reset  => SW(1),
							  count  => internalCount);
							  
	 bin7Seg : entity work.Bin7SegDecoder(Behavioral)
	           port map(enable   => '1',
				           binInput => internalCount,
							  decOut_n => HEX0);
							  
	 LEDG <= internalCount;
end Structural;