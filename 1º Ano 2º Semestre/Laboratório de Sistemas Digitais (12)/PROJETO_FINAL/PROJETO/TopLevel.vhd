
library ieee;
use ieee.std_logic_1164.all; 

entity TopLevel is 
	port(CLOCK_50 :  in  std_logic;
		  KEY  :  in  std_logic_Vector(2 downto 0);
		  SW 	 :  in  std_logic_Vector(0 to 0);
		  HEX0 :  out  std_logic_Vector(6 downto 0);
		  HEX1 :  out  std_logic_Vector(6 downto 0);
		  HEX2 :  out  std_logic_Vector(6 downto 0);
		  HEX3 :  out  std_logic_Vector(6 downto 0);
		  HEX4 :  out  std_logic_Vector(6 downto 0);
		  HEX5 :  out  std_logic_Vector(6 downto 0);
		  HEX6 :  out  std_logic_Vector(6 downto 0);
		  HEX7 :  out  std_logic_Vector(6 downto 0));
end TopLevel;

architecture structural of toplevel is 
	signal s_clock : std_logic;
	signal s_geradordepuslo2hz : std_logic;
	signal s_WERegisterBank : std_logic;
	signal s_WERam : std_logic;
	signal s_enable : std_logic;
	signal s_address : std_logic_vector(7 downto 0);
	signal s_dataout : std_logic_vector(7 downto 0);
	signal s_operand1, s_operand2, s_operand3, s_operand4 : std_logic_vector(7 downto 0);
	signal s_op1, s_op2, s_op3, s_op4 : std_logic_vector(7 downto 0);
	signal s_WriteDataRam : std_logic_vector(7 downto 0);
	signal s_result : std_logic_vector(7 downto 0);
	signal s_dataout_ram : std_logic_vector(7 downto 0);
	signal s_start : std_logic;
	signal s_filter_on : std_logic;
	signal s_reset_ram : std_logic;
	signal s_reset : std_logic;
	signal s_muxout : std_logic_vector(7 downto 0);
begin
		s_clock <= CLOCK_50;
		
		controlunit : entity work.ControlUnit(behavioral)
			port map(clk => s_clock,
						SW0 => Sw(0),
						K2 => not(KEY(2)),
						K1 => not(KEY(1)),
						K0 => not(KEY(0)),
						start => s_start,
						filter_on => s_filter_on,
						rst_ram => s_reset_ram,
						reset => s_reset);
						
		geradordepulso2hz : entity work.GeradorDePulso2Hz(behavioral)
			port map (clk => s_clock,
						 start => s_start,
						 pulse => s_enable);

		addresscounter : entity work.AddressGenerator(behavioral)
			port map(reset => s_reset,
						clk => s_clock,
						en => s_enable,
						addr => s_address);
	
		 rom : entity work.NoisyTriangSignal_ROM_256x8(behavioral)
			port map(address => s_address,
						dataOut => s_dataout);
						
		registerdecoder : entity work.RegisterDecoder(behavioral)
			port map(clk => s_clock,
						en => s_enable,
						WE => s_WERegisterBank);
		
	

		timer : entity work.Timer(behavioral)
			port map(clk => s_clock,
						reset => s_reset,
						start => s_enable,
						DelayP => s_WERam);
		
		bcddisplay : entity work.BcdDisplay(behavioral)
			port map(rom_out => s_dataout,
						led_out1 => HEX3,
						led_out2 => HEX2,
						led_out3 => HEX1,
						led_out4 => HEX0);
		
		
		registerbank : entity work.RegisterBank(behavioral)
			port map( reset => s_reset,
						 WE => s_WERegisterBank,
						 WriteData => s_dataout,
						 DataOut1 => s_operand1,
						 DataOut2 => s_operand2,
						 DataOut3 => s_operand3,
						 DataOut4 => s_operand4);
						
		
		aritmeticunit : entity work.AritmeticUnit(behavioral)
			port map(operand1 => s_op1,
						operand2 => s_op2,
						operand3 => s_op3,
						operand4 => s_op4,
						Result => s_WriteDataRam);
						s_op1 <= s_operand1;
						s_op2 <= s_operand2;
						s_op3 <= s_operand3;
						s_op4 <= s_operand4;
						s_result <= s_WriteDataRam;
						
		muxfilter : entity work.MuxFilter(behavioral)
			port map(filter_on => s_filter_on,
						input0 => s_result,
						input1 => s_dataout,
						muxOut => s_muxout);
	
		ram : entity work.ram_256x8(behavioral)
			port map(clk => s_clock,
						rst_ram => s_reset_ram,
						reset => s_reset,
						writeEnable => s_WERam,
						writeData => s_muxout,
						address => s_address,
						DataOut => s_dataout_ram);
		
		bcddisplayram : entity work.BcdDisplayRam(behavioral)
			port map(ram_out => s_dataout_ram,
						led_out1 => HEX7,
						led_out2 => HEX6,
						led_out3 => HEX5,
						led_out4 => HEX4);

end structural;