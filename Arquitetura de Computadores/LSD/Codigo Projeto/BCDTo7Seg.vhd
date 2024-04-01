library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Decoder7Led is
    port(bcdInput : in std_logic_vector(15 downto 0);
         decOut_n : out std_logic_vector(6 downto 0);
         decOut_n2 : out std_logic_vector(6 downto 0);
         decOut_n3 : out std_logic_vector(6 downto 0);
         decOut_n4 : out std_logic_vector(6 downto 0));
end Decoder7Led;

architecture Behavioral of Decoder7Led is
begin
    decOut_n <= bcdInput(0) & bcdInput(1) & bcdInput(2) & bcdInput(3); --Algarismo 1
    decOut_n <=  "1111001" when (bcdInput = "0001") else --1
                 "0100100" when (bcdInput = "0010") else --2
                 "0110000" when (bcdInput = "0011") else --3
                 "0011001" when (bcdInput = "0100") else --4
                 "0010010" when (bcdInput = "0101") else --5
                 "0000010" when (bcdInput = "0110") else --6
                 "1111000" when (bcdInput = "0111") else --7
                 "0000000" when (bcdInput = "1000") else --8
                 "0010000" when (bcdInput = "1001") else --9
                 "1000000"; --0
    decOut_n2 <= bcdInput(4) & bcdInput(5) & bcdInput(6) & bcdInput(7); -- Algarismo 2
	decOut_n2 <= "1111001" when (bcdInput = "0001") else --1
                 "0100100" when (bcdInput = "0010") else --2
                 "0110000" when (bcdInput = "0011") else --3
                 "0011001" when (bcdInput = "0100") else --4
                 "0010010" when (bcdInput = "0101") else --5
                 "0000010" when (bcdInput = "0110") else --6
                 "1111000" when (bcdInput = "0111") else --7
                 "0000000" when (bcdInput = "1000") else --8
                 "0010000" when (bcdInput = "1001") else --9
                 "1000000"; --0
    decOut_n3 <= bcdInput(8) & bcdInput(9) & bcdInput(10) & bcdInput(11); -- Algarismo 3
	decOut_n3 <= "1111001" when (bcdInput = "0001") else --1
                 "0100100" when (bcdInput = "0010") else --2
                 "0110000" when (bcdInput = "0011") else --3
                 "0011001" when (bcdInput = "0100") else --4
                 "0010010" when (bcdInput = "0101") else --5
                 "0000010" when (bcdInput = "0110") else --6
                 "1111000" when (bcdInput = "0111") else --7
                 "0000000" when (bcdInput = "1000") else --8
                 "0010000" when (bcdInput = "1001") else --9
                 "1000000"; --0
    decOut_n4 <= bcdInput(12) & bcdInput(13) & bcdInput(14) & bcdInput(15); -- Algarismo 4
    decOut_n4 <= "1111001" when (bcdInput = "0001") else --1
                 "0100100" when (bcdInput = "0010") else --2
                 "0110000" when (bcdInput = "0011") else --3
                 "0011001" when (bcdInput = "0100") else --4
                 "0010010" when (bcdInput = "0101") else --5
                 "0000010" when (bcdInput = "0110") else --6
                 "1111000" when (bcdInput = "0111") else --7
                 "0000000" when (bcdInput = "1000") else --8
                 "0010000" when (bcdInput = "1001") else --9
                 "1000000"; --0
end Behavioral;