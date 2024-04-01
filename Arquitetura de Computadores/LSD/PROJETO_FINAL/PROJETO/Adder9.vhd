library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Adder9 is
  port (cin : in std_logic;
		  operand1 : in std_logic_vector(8 downto 0);
        operand2 : in std_logic_vector(7 downto 0);
        cout : out std_logic;
		  Result   : out std_logic_vector(9 downto 0));
end Adder9;

architecture Behavioral of Adder9 is
    signal carryOut : std_logic_vector(8 downto 0);
	 signal operand2_1 : std_logic_vector(8 downto 0);
    begin
			operand2_1 <= ('0' & operand2);
        	bit0 : entity work.FullAdder(behavioral)
			 port map(a => operand1(0),
						 b => operand2_1(0),
						 cin => cin,
						 s => Result(0),
						 cout => carryOut(0));
						
			bit1 : entity work.FullAdder(behavioral)
			 port map(a => operand1(1),
						 b => operand2_1(1),
						 cin => carryOut(0),
						 s => Result(1),
						 cout => carryOut(1)); 
		  
			bit2 : entity work.FullAdder(behavioral)
			 port map(a => operand1(2),
						 b => operand2_1(2),
						 cin => carryOut(1),
						 s => Result(2),
						 cout => carryOut(2));
			bit3 : entity work.FullAdder(behavioral)
			 port map(a => operand1(3),
						 b => operand2_1(3),
						 cin => carryOut(2),
						 s => Result(3),
						 cout => carryOut(3));
			
			bit4 : entity work.FullAdder(behavioral)
			 port map(a => operand1(4),
						 b => operand2_1(4),
						 cin => carryOut(3),
						 s => Result(4),
						 cout => carryOut(4));
			bit5 : entity work.FullAdder(behavioral)
			 port map(a => operand1(5),
						 b => operand2_1(5),
						 cin => carryOut(4),
						 s => Result(5),
						 cout => carryOut(5));
			bit6 : entity work.FullAdder(behavioral)
			 port map(a => operand1(6),
						 b => operand2_1(6),
						 cin => carryOut(5),
						 s => Result(6),
						 cout => carryOut(6));
			bit7 : entity work.FullAdder(behavioral)
			 port map(a => operand1(7),
						 b => operand2_1(7),
						 cin => carryOut(6),
						 s => Result(7),
						 cout => carryOut(7));
			bit8 : entity work.FullAdder(behavioral)
			 port map(a => operand1(8),
						 b => operand2_1(8),
						 cin => carryOut(7),
						 s => Result(8),
						 cout => carryOut(8));
						 Result(9) <= carryout(8);
						 
				
			
						 
			
        
    end Behavioral;
