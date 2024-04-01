library ieee;
use ieee.std_logic_1164.all;


entity fulladder is
	port (cin  : in  std_logic;
	      b    : in  std_logic;
			a    : in  std_logic;
			s    : out std_logic;
			cout : out std_logic);
end fulladder;

architecture behavioral of fulladder is
begin
	s <= ((not cin) and (not a) and b) or (cin and (not a) and (not b)) or (cin and a and b) or ((not cin) and (not b) and a);
	cout <= (a and b) or (cin and b) or (cin and a);
end behavioral;