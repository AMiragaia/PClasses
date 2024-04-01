library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BcdDisplayRam is
    port( ram_out : in std_logic_vector(7 downto 0);
          led_out1 : out std_logic_vector(6 downto 0);
          led_out2 : out std_logic_vector(6 downto 0);
          led_out3 : out std_logic_vector(6 downto 0);
          led_out4 : out std_logic_vector(6 downto 0));

    
end BcdDisplayRam;

architecture Behavioral of BcdDisplayRam is
    signal Bin2Bcd_out1 : std_logic_vector(3 downto 0);
	 signal Bin2Bcd_out2 : std_logic_vector(3 downto 0);
	 signal Bin2Bcd_out3 : std_logic_vector(3 downto 0);
	 signal Bin2Bcd_out4 : std_logic_vector(3 downto 0);
	 signal Bin2Bcd_out : std_logic_vector(15 downto 0);
	begin
		bin2bcd: entity work.Bin2Bcd(behavioral)
			port map (bin => ram_out,
						 bcd_l => Bin2Bcd_out1,
						 bcd_m => Bin2Bcd_out2,
						 bcd_h => Bin2Bcd_out3,
						 bcd_n => Bin2Bcd_out4);
						 Bin2Bcd_out <= Bin2Bcd_out4 & Bin2Bcd_out3 & Bin2Bcd_out2 & Bin2Bcd_out1;
		
		Decoder7Led: entity work.Decoder7Led(behavioral)
			port map (bcdInput => Bin2Bcd_out,
						 decOut_n => led_out1,
						 decOut_n2 => led_out2,
						 decOut_n3 => led_out3,
						 decOut_n4 => led_out4);
						 
	 
end Behavioral;
