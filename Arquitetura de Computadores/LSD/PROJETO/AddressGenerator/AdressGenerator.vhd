library IEEE;
use IEEE.std_logic_1164.all;

entity AdressGenerator is
    port(clk   : in std_logic;
         en    : in std_logic;
         addr  : out std_logic_vector(7 downto 0));  
         
end AdressGenerator;

-- use the vhdl files in the folder and connects them
architecture behavioral of AdressGenerator is
    signal adress : std_logic_vector(7 downto 0);
    
begin
    freq_divider : entity work.FreqDivider;
    generic map(clk_freq => 2);
    port map(clk => clk, en => en, addr => adress);

    read_rom_counter : entity work.ReadRomCounter;
    generic map(clk_freq => 2);
    port map(clk => clk, en => en, addr => cntOut);
