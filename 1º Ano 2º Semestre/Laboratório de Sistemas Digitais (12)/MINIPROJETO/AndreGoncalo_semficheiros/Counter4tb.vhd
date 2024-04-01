library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Counter4tb is
end Counter4tb;

architecture Stimulus of Counter4tb is
    -- Sinais entrada
    signal s_reset, s_clk : std_logic;
    signal s_enable, s_upDown_enable :  std_logic;
    -- Sinais saída
    signal s_count : std_logic_vector(3 downto 0);
begin
    uut : entity work.Counter4(Behavioral)
    port map(reset => s_reset,
				 clk => s_clk,
             enable => s_enable,
				 upDown_enable => s_upDown_enable,
             cntOut => s_count);

	clock_proc : process
	begin
		s_clk <= '0'; wait for 100 ns;
		s_clk <= '1'; wait for 100 ns;
	end process;
--Process stim
		stim_proc : process
		begin
			s_reset <= '1';
			s_enable <= '0';
			s_upDown_enable <= '1';
			wait for 325 ns;
			s_reset <= '0';
			wait for 25 ns;
			s_enable <= '1';
			wait for 925 ns;
			s_enable <= '0';
			wait for 375 ns;
			s_upDown_enable <= '0';
			s_enable <= '1';
			wait for 975 ns;
			s_enable <= '0';
			wait for 125 ns;
		end process;
end Stimulus;
