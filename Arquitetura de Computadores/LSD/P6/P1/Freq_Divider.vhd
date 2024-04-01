library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
 
entity Freq_Divider is 
  generic(K : positive := 8); 
  port(clkin        : in  std_logic; 
       clkout       : out std_logic); 
end Freq_Divider; 
 
architecture behavioral of Freq_Divider is 
 
  subtype tcounter is natural range 0 to (K-1); 
  signal s_counter : tcounter := 0; 
 
begin 
  assert(K >= 2); 
 
  process(clkin) 
  begin 
    if (rising_edge(clkin)) then 
      if (s_counter >= (K - 1)) then 
			clkout       <= '0'; 
			s_counter <= 0; 
      else 
        if (s_counter = (K / 2 - 1)) then 
          clkout <= '1'; 
        end if; 
        s_counter <= s_counter + 1; 
      end if; 
    end if; 
  end process; 
end behavioral;