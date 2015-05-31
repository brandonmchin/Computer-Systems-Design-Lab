LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode7seg is
	port( hex_digit     : in STD_LOGIC_VECTOR(3 downto 0);
	      segment	    : out STD_LOGIC_VECTOR(6 downto 0));
end decode7seg;

architecture arch of decode7seg is
	
	signal segment_data: std_logic_vector(6 downto 0);
	
	begin process(hex_digit)
		begin case hex_digit is		-- each hex digit is four bits
			when "0000" => segment_data <= "1111110";
			when "0001" => segment_data <= "0110000";
			when "0010" => segment_data <= "1101101";
			when "0011" => segment_data <= "1111001";
			when "0100" => segment_data <= "0110011";
			when "0101" => segment_data <= "1011011";
			when "0110" => segment_data <= "1011111";
			when "0111" => segment_data <= "1110000";
			when "1000" => segment_data <= "1111111";
			when "1001" => segment_data <= "1110011";
			when "1010" => segment_data <= "1110111";
			when "1011" => segment_data <= "0011111";
			when "1100" => segment_data <= "1001110";
			when "1101" => segment_data <= "0111101";
			when "1110" => segment_data <= "1001111";
			when "1111" => segment_data <= "1000111";
		end case;
	end process;
	
	-- must invert each bit because the LED driver circuit is inverted
	segment(6) <= not segment_data(6);
	segment(5) <= not segment_data(5);
	segment(4) <= not segment_data(4);
	segment(3) <= not segment_data(3);
	segment(2) <= not segment_data(2);
	segment(1) <= not segment_data(1);
	segment(0) <= not segment_data(0);
	
end arch;