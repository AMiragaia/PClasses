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
signal decOut: std_logic_vector(3 downto 0);
signal decOut1: std_logic_vector(3 downto 0);
signal decOut2: std_logic_vector(3 downto 0);
signal decOut3: std_logic_vector(3 downto 0);
begin
    decOut <= bcdInput(15) & bcdInput(14) & bcdInput(13) & bcdInput(12); --Algarismo 
    decOut_n <=  "1111001" when (decOut = "0001") else --1
                 "0100100" when (decOut = "0010") else --2
                 "0110000" when (decOut = "0011") else --3
                 "0011001" when (decOut = "0100") else --4
                 "0010010" when (decOut = "0101") else --5
                 "0000010" when (decOut = "0110") else --6
                 "1111000" when (decOut = "0111") else --7
                 "0000000" when (decOut = "1000") else --8
                 "0010000" when (decOut = "1001") else --9
					  "0111111" when (decOut = "1111") else -- (-)
                 "1000000"; --0
    decOut1 <= bcdInput(11) & bcdInput(10) & bcdInput(9) & bcdInput(8); -- Algarismo 
	decOut_n2 <= "1111001" when (decOut1  = "0001") else --1
                 "0100100" when (decOut1  = "0010") else --2
                 "0110000" when (decOut1  = "0011") else --3
                 "0011001" when (decOut1  = "0100") else --4
                 "0010010" when (decOut1  = "0101") else --5
                 "0000010" when (decOut1  = "0110") else --6
                 "1111000" when (decOut1  = "0111") else --7
                 "0000000" when (decOut1  = "1000") else --8
                 "0010000" when (decOut1  = "1001") else --9
                 "1000000"; --0
    decOut2 <= bcdInput(7) & bcdInput(6) & bcdInput(5) & bcdInput(4); -- Algarismo 
	decOut_n3 <= "1111001" when (decOut2 = "0001") else --1
                 "0100100" when (decOut2 = "0010") else --2
                 "0110000" when (decOut2 = "0011") else --3
                 "0011001" when (decOut2 = "0100") else --4
                 "0010010" when (decOut2 = "0101") else --5
                 "0000010" when (decOut2 = "0110") else --6
                 "1111000" when (decOut2 = "0111") else --7
                 "0000000" when (decOut2 = "1000") else --8
                 "0010000" when (decOut2 = "1001") else --9
                 "1000000"; --0
    decOut3 <= bcdInput(3) & bcdInput(2) & bcdInput(1) & bcdInput(0); -- Algarismo 
    decOut_n4 <= "1111001" when (decOut3 = "0001") else --1
                 "0100100" when (decOut3 = "0010") else --2
                 "0110000" when (decOut3 = "0011") else --3
                 "0011001" when (decOut3 = "0100") else --4
                 "0010010" when (decOut3 = "0101") else --5
                 "0000010" when (decOut3 = "0110") else --6
                 "1111000" when (decOut3 = "0111") else --7
                 "0000000" when (decOut3 = "1000") else --8
                 "0010000" when (decOut3 = "1001") else --9
                 "1000000"; --0
end Behavioral;