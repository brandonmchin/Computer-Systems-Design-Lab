LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sram_cell is
	port( DataIn, CS, WE     : in STD_LOGIC;
	      DataOut	         : out STD_LOGIC);
end sram_cell;

architecture arch of sram_cell is

	component Master_Slave_DFF			-- Master-Slave DFF component
		port( Data, Clk     : in STD_LOGIC;
	          Q, notQ	    : out STD_LOGIC);
	end component;
	
	signal tri, notOut:  std_logic;		-- tri-state buffer input, notQ output
	
	begin
		cell: Master_Slave_DFF port map(DataIn, (CS AND WE), tri, notOut);
		
		-- output changes on falling edge of WE
		DataOut <= tri when (CS = '1') else 'Z';	-- tri-state buffer
		
end arch;