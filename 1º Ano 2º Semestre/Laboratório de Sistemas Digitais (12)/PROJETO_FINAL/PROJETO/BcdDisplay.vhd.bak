library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BcdDisplay is
    port( rom_out : in std_logic_vector(7 downto 0);
          led_out1 : out std_logic_vector(6 downto 0);
          led_out2 : out std_logic_vector(6 downto 0);
          led_out3 : out std_logic_vector(6 downto 0);
          led_out4 : out std_logic_vector(6 downto 0));

    
end BcdDisplay;

architecture Behavioral of BcdDisplay is
    signal Bin2Bcd_out1 : std_logic_vector(3 downto 0);
    bin2bcd : entity work.Bin2Bcd(behavioral);
    port map();
