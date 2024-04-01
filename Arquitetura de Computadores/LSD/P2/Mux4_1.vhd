library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1conditional is
	port (sel     : in std_logic;
			input0 : in std_logic;
			input1 : in std_logic;
			input2 : in std_logic;
			input3 : in std_logic;
			muxOut  : out std_logic_vector);
end Mux4_1conditional;

architecture Behavioral of Mux4_1conditional is
begin
	process( sel, input0, input1)
	begin
		if (sel = '00') then
			muxOut <= input0;
		elsif (sel = '01') then
			muxOut <= input1;
		elsif (sel = '10') then
			muxOut <= input2;
		else
			muxOut <= input3;
		end if;
	end process;
end Behavioral;