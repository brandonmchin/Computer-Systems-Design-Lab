LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register16 is
	port( DataIn			    : in STD_LOGIC_VECTOR(15 downto 0);
	      Write_Enable          : in STD_LOGIC;
	      DataOut               : out STD_LOGIC_VECTOR(15 downto 0));
end register16;

architecture arch of register16 is

	component Master_Slave_DFF			-- Master-Slave DFF component
		port ( Data, Clk	   : in std_logic;
			   Q, notQ         : out std_logic);
	end component;
	
	begin
		DFF0: Master_Slave_DFF port map(DataIn(0), Write_Enable, DataOut(0));
		DFF1: Master_Slave_DFF port map(DataIn(1), Write_Enable, DataOut(1));
		DFF2: Master_Slave_DFF port map(DataIn(2), Write_Enable, DataOut(2));
		DFF3: Master_Slave_DFF port map(DataIn(3), Write_Enable, DataOut(3));
		DFF4: Master_Slave_DFF port map(DataIn(4), Write_Enable, DataOut(4));
		DFF5: Master_Slave_DFF port map(DataIn(5), Write_Enable, DataOut(5));
		DFF6: Master_Slave_DFF port map(DataIn(6), Write_Enable, DataOut(6));
		DFF7: Master_Slave_DFF port map(DataIn(7), Write_Enable, DataOut(7));
		DFF8: Master_Slave_DFF port map(DataIn(8), Write_Enable, DataOut(8));
		DFF9: Master_Slave_DFF port map(DataIn(9), Write_Enable, DataOut(9));
		DFF10: Master_Slave_DFF port map(DataIn(10), Write_Enable, DataOut(10));
		DFF11: Master_Slave_DFF port map(DataIn(11), Write_Enable, DataOut(11));
		DFF12: Master_Slave_DFF port map(DataIn(12), Write_Enable, DataOut(12));
		DFF13: Master_Slave_DFF port map(DataIn(13), Write_Enable, DataOut(13));
		DFF14: Master_Slave_DFF port map(DataIn(14), Write_Enable, DataOut(14));
		DFF15: Master_Slave_DFF port map(DataIn(15), Write_Enable, DataOut(15));
		
end arch;