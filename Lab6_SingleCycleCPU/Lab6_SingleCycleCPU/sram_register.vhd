LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 16-bit register
entity sram_register is
	port( DataIn		                  : in STD_LOGIC_VECTOR(15 downto 0);
	      Clock, WE, RA, RB, RW           : in STD_LOGIC;
	      DataOutA, DataOutB, DataOutW    : out STD_LOGIC_VECTOR(15 downto 0));
end sram_register;

architecture arch of sram_register is

	component sram_cell			-- SRAM Cell component
		port( DataIn, Clock, WE, RA, RB, RW     : in STD_LOGIC;
	          DataOutA, DataOutB, DataOutW	    : out STD_LOGIC);
	end component;
	
	signal tri1, tri2:		std_logic_vector(15 downto 0);		-- tri-state buffer inputs
	
	begin
		cell0: sram_cell port map(DataIn(0), Clock, WE, RA, RB, RW, DataOutA(0), DataOutB(0), DataOutW(0));
		cell1: sram_cell port map(DataIn(1), Clock, WE, RA, RB, RW, DataOutA(1), DataOutB(1), DataOutW(1));
		cell2: sram_cell port map(DataIn(2), Clock, WE, RA, RB, RW, DataOutA(2), DataOutB(2), DataOutW(2));
		cell3: sram_cell port map(DataIn(3), Clock, WE, RA, RB, RW, DataOutA(3), DataOutB(3), DataOutW(3));
		cell4: sram_cell port map(DataIn(4), Clock, WE, RA, RB, RW, DataOutA(4), DataOutB(4), DataOutW(4));
		cell5: sram_cell port map(DataIn(5), Clock, WE, RA, RB, RW, DataOutA(5), DataOutB(5), DataOutW(5));
		cell6: sram_cell port map(DataIn(6), Clock, WE, RA, RB, RW, DataOutA(6), DataOutB(6), DataOutW(6));
		cell7: sram_cell port map(DataIn(7), Clock, WE, RA, RB, RW, DataOutA(7), DataOutB(7), DataOutW(7));
		cell8: sram_cell port map(DataIn(8), Clock, WE, RA, RB, RW, DataOutA(8), DataOutB(8), DataOutW(8));
		cell9: sram_cell port map(DataIn(9), Clock, WE, RA, RB, RW, DataOutA(9), DataOutB(9), DataOutW(9));
		cell10: sram_cell port map(DataIn(10), Clock, WE, RA, RB, RW, DataOutA(10), DataOutB(10), DataOutW(10));
		cell11: sram_cell port map(DataIn(11), Clock, WE, RA, RB, RW, DataOutA(11), DataOutB(11), DataOutW(11));
		cell12: sram_cell port map(DataIn(12), Clock, WE, RA, RB, RW, DataOutA(12), DataOutB(12), DataOutW(12));
		cell13: sram_cell port map(DataIn(13), Clock, WE, RA, RB, RW, DataOutA(13), DataOutB(13), DataOutW(13));
		cell14: sram_cell port map(DataIn(14), Clock, WE, RA, RB, RW, DataOutA(14), DataOutB(14), DataOutW(14));
		cell15: sram_cell port map(DataIn(15), Clock, WE, RA, RB, RW, DataOutA(15), DataOutB(15), DataOutW(15));
		
end arch;