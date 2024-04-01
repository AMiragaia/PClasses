library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity AddressGenerator is
    port(clk   : in std_logic; -- clock
         en    : in std_logic; -- enable signal
		 reset : in std_logic; -- reset
         addr  : out std_logic_vector(7 downto 0)); -- variável que armazena o endereço 
         
end AddressGenerator;

architecture behavioral of AddressGenerator is

    signal counter_data_out : std_logic_vector(7 downto 0);

begin
	adder : entity work.AddressCounter(behavioral)
	port map(clk => clk,
			 enable => en,
			 reset => reset,
			 cntOut => counter_data_out); -- instancia o componente, e atribui os seus portos

	addr <= counter_data_out; -- atribui o valor do counter ao adereço (output)

end behavioral;