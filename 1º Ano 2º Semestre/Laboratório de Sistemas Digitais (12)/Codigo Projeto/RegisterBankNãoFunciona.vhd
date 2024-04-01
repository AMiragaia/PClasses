library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


ENTITY RegisterBank IS PORT(Reset :       IN std_logic;
									 WE:    			IN std_logic_vector(3 downto 0);
									 WriteData:    IN std_logic_vector (7 downto 0);
									 DataOut1:     OUT std_logic_vector (7 downto 0);
									 DataOut2:     OUT std_logic_vector (7 downto 0);
								    DataOut3:     OUT std_logic_vector (7 downto 0);
									 DataOut4:     OUT std_logic_vector (7 downto 0));
END RegisterBank;
 
ARCHITECTURE behavioral OF RegisterBank is 
BEGIN
  
first:  PROCESS (WE,Reset, WriteData)
        TYPE reg_array IS ARRAY(0 to 3) OF std_logic_vector(7 downto 0); 
        BEGIN
          
				IF Reset = '0' THEN
                    CASE WE IS
                         when "0001" => reg_array(0):=WriteData;
                         when "0010" => reg_array(1):=WriteData;
                         when "0100" => reg_array(2):=WriteData;
                         when "1000" => reg_array(3):=WriteData; 
								 when others => reg_array(0):="00000000";
													 reg_array(1):="00000000";
													 reg_array(2):="00000000";
													 reg_array(3):="00000000";
                     END CASE;
            ELSE
                 reg(0):="00000000";
				 reg(1):="00000000";
			     reg(2):="00000000";
				 reg(3):="00000000";
                      
               
           END IF;
			  dataOut1 <= reg_array(0);
			  dataOut2 <= reg_array(1);
			  dataOut3 <= reg_array(2);
			  dataOut4 <= reg_array(3);
     END PROCESS first;
END behavioral;
