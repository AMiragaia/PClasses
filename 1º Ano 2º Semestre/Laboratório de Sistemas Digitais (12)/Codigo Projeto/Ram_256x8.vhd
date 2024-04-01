library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ram_256x8 is
    port(clk: in std_logic;
         rst_ram: in std_logic;
         writeEnable: in std_logic;
         reset: in std_logic;
         writeData: in std_logic_vector(7 downto 0);
         address: in std_logic_vector(7 downto 0);
         DataOut: out std_logic_vector(7 downto 0));

end Ram_256x8;

architecture Behavioral of Ram_256x8 is
    begin
        signal ram_data: std_logic_vector(7 downto 0);
        signal ram_address: std_logic_vector(7 downto 0);
        signal ram_write: std_logic;
        signal ram_read: std_logic;
        signal ram_write_enable: std_logic;

        process(clk)
        begin
            if rst_ram = '1' then
                ram_data <= (others => '0');
                ram_address <= (others => '0');
                ram_write <= '0';
                ram_read <= '0';
                ram_write_enable <= '0';
            elsif rising_edge(clk) then
                if reset = '1' then
                    ram_data <= (others => '0');
                elsif ram_write_enable = '1' then
                    ram_data <= ram_data;
                elsif ram_read = '1' then
                    ram_data <= ram_data;
                elsif ram_write = '1' then
                    ram_data <= ram_data;
                end if;
            end if;
            dataOut <= ram_data;
        end process;

end Behavioral;
        