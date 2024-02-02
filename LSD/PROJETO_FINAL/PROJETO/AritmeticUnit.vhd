library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AritmeticUnit is
  port (operand1 : in std_logic_vector(7 downto 0); -- x(-2)
        operand2 : in std_logic_vector(7 downto 0); -- x(-1)
        operand3 : in std_logic_vector(7 downto 0);--x(0)
        operand4 : in std_logic_vector(7 downto 0);--x(1)
        Result   : out std_logic_vector(7 downto 0));
end AritmeticUnit;

architecture Behavioral of AritmeticUnit is
  signal soma1 : std_logic_vector(8 downto 0);
  signal soma2 : std_logic_vector(9 downto 0);
  signal soma3 : std_logic_vector(9 downto 0);
  signal soma_s : std_logic_vector(8 downto 0);
  signal soma_s2 : std_logic_vector(9 downto 0);
  signal final : signed(9 downto 0);
  signal s_numero : std_logic_vector(7 downto 0);
  
  begin
	 s_numero <=  operand3;
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
					 
					 
		process (operand4,operand1,soma3,s_numero,final)
			begin            
				if (operand4 /= "00000000") and (operand1 /= "00000000") then
					final <= shift_right((signed(soma3)+1),2);-- para acertar arredondamentos e dividir por 4
					Result <= std_logic_vector(final(7 downto 0));
				else
					final <= "0000000000";
					Result <= s_numero;
				end if;
			end process;
					 
					 
					 
  end Behavioral;
