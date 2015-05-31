LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sram_cell is
	port( DataIn, Clock, WE, RA, RB, RW     : in STD_LOGIC;
	      DataOutA, DataOutB, DataOutW	    : out STD_LOGIC);
end sram_cell;

architecture arch of sram_cell is

	component Master_Slave_DFF			-- Master-Slave DFF component
		port( Data, Clk     : in STD_LOGIC;
	          Q, notQ	    : out STD_LOGIC);
	end component;
	
	signal tri, notQ:  std_logic;		-- tri-state buffer input, notQ output
	
	begin
		cell: Master_Slave_DFF port map(DataIn, (Clock AND (WE AND RW)), tri, notQ);
		
		DataOutA <= tri when (RA = '1') else 'Z';	-- tri-state buffer
		DataOutB <= tri when (RB = '1') else 'Z';	-- tri-state buffer
		DataOutW <= tri when (RW = '1') else 'Z';	-- tri-state buffer
		
end arch;