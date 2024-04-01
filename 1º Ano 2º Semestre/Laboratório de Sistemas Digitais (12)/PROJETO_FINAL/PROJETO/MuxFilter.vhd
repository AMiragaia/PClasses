library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxFilter is
    port (filter_on     : in std_logic;
            input0 : in std_logic_vector(7 downto 0);
            input1 : in std_logic_vector(7 downto 0);
            muxOut  : out std_logic_vector(7 downto 0));
end MuxFilter;

architecture Behavioral of MuxFilter is
begin
    process( filter_on, input0, input1)
    begin
        if (filter_on = '1') then
            muxOut <= input0;
        else
            muxOut <= input1;
        end if;
    end process;
end Behavioral;