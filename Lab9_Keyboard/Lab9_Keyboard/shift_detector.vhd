library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity shift_detector is
	PORT(
		clk : IN STD_LOGIC;
		done : IN STD_LOGIC;
		hex : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		shift : OUT STD_LOGIC := '0'
	);
END shift_detector;

architecture arch of shift_detector is
type statetype is (
Idle,
Break_Received);
signal current_state, next_state : statetype;
signal LSBit, RSBit :STD_LOGIC:='0' ;

begin
process (Clk) begin
	if(rising_edge(Clk)) then
		current_state <= next_state;
	end if;
end process;

process(done) begin
	if (done = '1') then
		if (current_state = Idle) then
			     if (hex = "01011001") then
				       RSBit <= '1';
						  next_state<=Idle;
			     elsif  (hex = "00010010" ) then
				        LSBit <= '1';
						  next_state <=Idle;
			     elsif (hex = "11110000") then
				        next_state <= Break_Received;
					else
						next_state<=Idle;
			
			     end if;
			
	   elsif (current_state = Break_Received ) then
				
				if  (hex = "01011001") then
				  RSBit <= '0';
				  next_state <= Idle;
				  elsif (hex = "00010010" ) then
				  LSBit <= '0';
				  next_state <= Idle;
				else 
				  next_state <= Idle;
			
			 end if ;
	
		end if;
	end if;
end process;
shift <= (RSBit or LSBit);
end arch;

