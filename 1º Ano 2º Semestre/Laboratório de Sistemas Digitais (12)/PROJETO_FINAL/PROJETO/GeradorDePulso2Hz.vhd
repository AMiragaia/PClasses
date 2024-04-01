library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GeradorDePulso2Hz is
    generic (max : positive := 25_000_000);
    port ( clk : in std_logic;
			  start : in std_logic;
            pulse : out std_logic);
end GeradorDePulso2Hz;

architecture Behavioral of GeradorDePulso2Hz is
    signal s_cnt : natural range 0 to MAX-1;
begin
    process(clk,start)
    begin
        if (rising_edge(clk)) then
			if start = '0' then
				pulse <= '0';
			else
            pulse <= '0';
            s_cnt <= s_cnt + 1;
            if (s_cnt = max-1) then
                s_cnt <= 0;
                pulse <= '1';
            end if;
        end if;
		end if;
    end process;
end Behavioral;