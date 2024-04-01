library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister_Demo is
	port( SW: in std_logic_vector(0 downto 0);
			CLOCK_50 : in std_logic;
			LEDR: out std_logic_vector(7 downto 0));
end ShiftRegister_Demo;

architecture Shell of ShiftRegister_Demo is

signal clock: std_logic;

begin

	top_level: entity work.ShiftRegisterN(Behavioral)
		generic map (n => 8)
		port map (   clk     => clock,
					 si      => SW(0),
					 dataOut => LEDR);
	
	divisor: entity work.Freq_Divider(Behavioral)
		generic map (K => 50000000)
		port map ( clkIn => CLOCK_50,
					  clkOut => clock);
end Shell;