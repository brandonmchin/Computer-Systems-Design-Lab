-- 1-bit Adder Testbench

-- A testbench is used to rigorously test a design that you have made.
-- The output of the testbench should allow the designer to see if
-- the design worked.  The testbench should also report where the testbench
-- failed.

-- This is just to make a reference to some common things needed.

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Decare a testbench.  Notice that the testbench does not have any
-- input or output ports.

entity TEST_ADD2 is
end TEST_ADD2;

-- Describes the functionality of the testbench.

architecture TEST of TEST_ADD2 is 

	component add2
		port( a, b	: in    STD_LOGIC_VECTOR(1 downto 0);
		      ans	: out	STD_LOGIC_VECTOR(1 downto 0);
		      cout	: out 	STD_LOGIC	);
	end component;

	for U1: add2 use entity WORK.ADD2(STRUCTURE);
	signal a, b		: STD_LOGIC_VECTOR(1 downto 0);
	signal ans		: STD_LOGIC_VECTOR(1 downto 0);
	signal cout		: STD_LOGIC;
	
	begin
	U1: add2 port map (a,b,ans,cout);
	
		process
		begin

		-- Case 1 that we are testing.

			a <= "00";
			b <= "00";
			wait for 10 ns;
			assert ( ANS = "00" )	report "Failed Case 1 - ANS" severity error;
			assert ( Cout = '0' )   report "Failed Case 1 - Cout" severity error;
			wait for 40 ns;

		-- Case 2 that we are testing.

			a <= "11";
			b <= "11";
			wait for 10 ns;
			assert ( ANS = "10" )	report "Failed Case 2 - ANS" severity error;
			assert ( Cout = '1' )   report "Failed Case 2 - Cout" severity error;
			wait for 40 ns;
		end process;
END TEST;