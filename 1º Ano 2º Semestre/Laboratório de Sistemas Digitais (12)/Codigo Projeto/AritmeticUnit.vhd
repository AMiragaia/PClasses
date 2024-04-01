library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AritmeticUnit is
  port (operand1 : in std_logic_vector(7 downto 0);
        operand2 : in std_logic_vector(7 downto 0);
        operand3 : in std_logic_vector(7 downto 0);
        operand4 : in std_logic_vector(7 downto 0);
        Result   : out std_logic_vector(7 downto 0));
end AritmeticUnit;

architecture Behavioral of AritmeticUnit is
  signal soma1 : std_logic_vector(8 downto 0);
  signal soma2 : std_logic_vector(9 downto 0);
  signal soma3 : std_logic_vector(9 downto 0);
  signal soma_s : std_logic_vector(8 downto 0);
  signal soma_s2 : std_logic_vector(9 downto 0);
  signal soma_s3 : std_logic_vector(9 downto 0);
  signal final : unsigned(9 downto 0);
  signal final2 : unsigned(9 downto 0);
  signal final3 : unsigned(9 downto 0);
  begin
    adder8_1: entity work.Adder8(behavioral)
      port map (operand1 => operand1,
                operand2 => operand2,
                cin => '0',
                Result   => soma1);
					 soma_s <= soma1;
                
    adder9_1: entity work.Adder9(behavioral)
      port map (operand1 => soma_s,
                operand2 => operand3,
                cin => '0',
                Result   => soma2);
					 soma_s2 <= soma2;
    
	 adder10_1: entity work.Adder10(behavioral)
      port map (operand1 => soma_s2,
                operand2 => operand4,
                cin => '0',
                Result  => soma3);
					 soma_s3 <= soma3;
					 final <= (unsigned(soma_s3));
					 final2 <= shift_right(final,1);
					 final3 <= shift_right(final2,1);
					 Result <= std_logic_vector(final3(7 downto 0));
					 
					 
  end Behavioral;
