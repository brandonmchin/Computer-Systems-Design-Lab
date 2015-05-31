LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity completeSRAM is
	port( DataIn		 : in STD_LOGIC_VECTOR(3 downto 0);
	      Address		 : in STD_LOGIC_VECTOR(3 downto 0);
	      WE, CS, OE     : in STD_LOGIC;
	      DataOut        : buffer STD_LOGIC_VECTOR(3 downto 0);
	      Hex			 : out STD_LOGIC_VECTOR(6 downto 0));
end completeSRAM;

architecture arch of completeSRAM is

	component decode4to16	-- address decoder component
		port (oct     : in STD_LOGIC_VECTOR(3 downto 0);
	          dec	  : out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component sram	-- SRAM component
		port (DataIn		 : in STD_LOGIC_VECTOR(3 downto 0);
	          Reg			 : in STD_LOGIC_VECTOR(15 downto 0);
	          WE, CS, OE     : in STD_LOGIC;
	          DataOut        : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component decode7seg	-- 7-segment display decoder component
		port (hex_digit     : in STD_LOGIC_VECTOR(3 downto 0);
	          segment	    : out STD_LOGIC_VECTOR(6 downto 0));
	end component;
	
	signal A: std_logic_vector(15 downto 0);		-- intermediate address input
	
	begin
		AddressPort: decode4to16 port map(Address, A);
		
		sram_chip: sram port map(DataIn, A, WE, CS, OE, DataOut);
		
		display: decode7seg port map(DataOut, Hex);
	
end arch;