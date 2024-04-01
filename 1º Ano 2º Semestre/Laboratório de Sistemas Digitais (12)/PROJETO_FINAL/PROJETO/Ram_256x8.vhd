library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ram_256x8 is
    port(clk: in std_logic;
         rst_ram: in std_logic;
         writeEnable: in std_logic;
         reset: in std_logic;
         writeData: in std_logic_vector(7 downto 0);
         address: in std_logic_vector(7 downto 0);
         DataOut: out std_logic_vector(7 downto 0));

end Ram_256x8;

architecture Behavioral of Ram_256x8 is
		  type Memoria is array (0 to 255) of std_logic_vector (7 downto 0);
		  signal s_Memoria: Memoria;
		  signal s_address : std_logic_vector(7 downto 0);
	begin
        process(clk)
        begin
					if(rising_edge(clk)) then
						if(reset ='1') then
							s_Memoria <= (OTHERS => (OTHERS => '0'));
						elsif(writeEnable = '1') then
							s_Memoria(to_integer(unsigned(address))) <= writeData;
						elsif(rst_ram = '1') then
							s_Memoria <= (OTHERS => (OTHERS => '0'));
						end if;
					dataout <= s_Memoria(to_integer(unsigned(address)));
					end if;

        end process;

end Behavioral;
        