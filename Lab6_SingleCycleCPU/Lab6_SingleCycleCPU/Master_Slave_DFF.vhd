LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Master_Slave_DFF is
	port( Data, Clk     : in STD_LOGIC;
	      Q, notQ	    : out STD_LOGIC);
end Master_Slave_DFF;

architecture arch of Master_Slave_DFF is

	component D_Latch			-- D_Latch component
		port ( D, C	   : in std_logic;
			   Q, notQ : buffer std_logic);
	end component;
	
	signal Inter, notInter : std_logic;		-- intermediate values,	
											-- between master and slave
	begin
		Master: D_Latch port map(Data, Clk, Inter, notInter);
		Slave : D_Latch port map(Inter, (not Clk), Q, notQ);
		
end arch;