LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch is
	port( S, R    : in STD_LOGIC;
	      Q, notQ : buffer STD_LOGIC );
end SR_Latch;

architecture arch of SR_Latch is
begin
	Q <= (R NOR notQ);  
	notQ <= (S NOR Q);
end arch;