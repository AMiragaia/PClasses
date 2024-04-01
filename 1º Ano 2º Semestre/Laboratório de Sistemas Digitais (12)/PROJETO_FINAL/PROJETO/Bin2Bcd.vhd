library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2Bcd is
    port (
            bin   : in std_logic_vector(7 downto 0);
            bcd_n : out std_logic_vector(3 downto 0);
            bcd_h : out std_logic_vector(3 downto 0);
            bcd_m : out std_logic_vector(3 downto 0);
            bcd_l: out std_logic_vector(3 downto 0));
end Bin2Bcd;

architecture Behavioral of Bin2Bcd is
    signal s_bin : unsigned( 7 downto 0);
     signal s_dez : unsigned(7 downto 0);
    signal h, m, l, meio, n : unsigned(3 downto 0);
begin
    process(bin,s_bin,s_dez,meio,h,m,l,n)
        begin
        if (bin(7) = '1') then
            n <= "1111";
				s_bin <= not(unsigned(bin)) + "1";
			else
				n <= "0000";
				s_bin <= (unsigned(bin));
        end if;
	  s_dez <= to_unsigned(10, 8);
	  meio <= unsigned(std_logic_vector(s_bin / s_dez)(3 downto 0));
	  l <= unsigned(std_logic_vector(s_bin rem s_dez)(3 downto 0));
	  h <= unsigned(std_logic_vector(meio / s_dez)(3 downto 0));
	  m <= unsigned(std_logic_vector(meio rem s_dez)(3 downto 0));
    
	  bcd_h <= std_logic_vector(h);
     bcd_m <= std_logic_vector(m);
     bcd_l <= std_logic_vector(l);
     bcd_n <= std_logic_vector(n);
    end process;
end Behavioral;
