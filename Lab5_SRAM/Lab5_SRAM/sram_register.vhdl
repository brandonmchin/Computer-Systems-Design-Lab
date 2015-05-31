LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 16-bit register
entity sram_register is
	port( DataIn			    							: in STD_LOGIC_VECTOR(15 downto 0);
	      Sel, Write_Enable, Chip_Select, Output_Enable     : in STD_LOGIC;
	      DataOut               							: out STD_LOGIC_VECTOR(15 downto 0));
end sram_register;

architecture arch of sram_register is

	component sram_cell			-- SRAM Cell component
		port( DataIn, CS, WE     : in STD_LOGIC;
	          DataOut	         : out STD_LOGIC);
	end component;
	
	signal tri:		std_logic_vector(15 downto 0);		-- tri-state buffer inputs
	
	begin
		cell0: sram_cell port map(DataIn(0), Sel, (Write_Enable AND Chip_Select), tri(0));
		cell1: sram_cell port map(DataIn(1), Sel, (Write_Enable AND Chip_Select), tri(1));
		cell2: sram_cell port map(DataIn(2), Sel, (Write_Enable AND Chip_Select), tri(2));
		cell3: sram_cell port map(DataIn(3), Sel, (Write_Enable AND Chip_Select), tri(3));
		cell4: sram_cell port map(DataIn(4), Sel, (Write_Enable AND Chip_Select), tri(4));
		cell5: sram_cell port map(DataIn(5), Sel, (Write_Enable AND Chip_Select), tri(5));
		cell6: sram_cell port map(DataIn(6), Sel, (Write_Enable AND Chip_Select), tri(6));
		cell7: sram_cell port map(DataIn(7), Sel, (Write_Enable AND Chip_Select), tri(7));
		cell8: sram_cell port map(DataIn(8), Sel, (Write_Enable AND Chip_Select), tri(8));
		cell9: sram_cell port map(DataIn(9), Sel, (Write_Enable AND Chip_Select), tri(9));
		cell10: sram_cell port map(DataIn(10), Sel, (Write_Enable AND Chip_Select), tri(10));
		cell11: sram_cell port map(DataIn(11), Sel, (Write_Enable AND Chip_Select), tri(11));
		cell12: sram_cell port map(DataIn(12), Sel, (Write_Enable AND Chip_Select), tri(12));
		cell13: sram_cell port map(DataIn(13), Sel, (Write_Enable AND Chip_Select), tri(13));
		cell14: sram_cell port map(DataIn(14), Sel, (Write_Enable AND Chip_Select), tri(14));
		cell15: sram_cell port map(DataIn(15), Sel, (Write_Enable AND Chip_Select), tri(15));
		
		-- tri-state buffers (output only when chip select and output enable is 1)
		DataOut(0) <= tri(0) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(1) <= tri(1) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(2) <= tri(2) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(3) <= tri(3) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(4) <= tri(4) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(5) <= tri(5) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(6) <= tri(6) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(7) <= tri(7) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(8) <= tri(8) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(9) <= tri(9) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(10) <= tri(10) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(11) <= tri(11) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(12) <= tri(12) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(13) <= tri(13) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(14) <= tri(14) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		DataOut(15) <= tri(15) when ((Chip_Select AND Output_Enable) = '1') else 'Z';
		
end arch;