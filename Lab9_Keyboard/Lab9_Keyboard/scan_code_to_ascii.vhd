Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Entity scan_code_to_ascii is
Port(
scan_code : in STD_LOGIC_VECTOR(7 downto 0);
shift : in STD_LOGIC;
ascii : out STD_LOGIC_VECTOR(7 downto 0)
);
End scan_code_to_ascii;
Architecture arch of scan_code_to_ascii is
Begin
process(shift, scan_code)
  begin
	  --b
		if (shift ='0' and scan_code = "00110010") then
		  ascii <= "01100010";
		--r
		elsif (shift ='0' and scan_code = "00101101") then
		  ascii <= "01110010";
		 --a
		elsif (shift ='0' and scan_code = "00011100") then
		  ascii <= "01100001";
		  --n
		elsif (shift ='0' and scan_code = "00110001") then
		  ascii <= "01101110";
		  --d
		elsif (shift ='0' and scan_code = "00100011") then
		  ascii <= "01100100";
		  --space
		elsif (shift ='0' and scan_code = "00101001") then
		  ascii <= "00100000";
		 --o 
		elsif (shift ='0' and scan_code = "01000100") then
		  ascii <= "01101111";

	  --B
		elsif (shift ='1' and scan_code = "00110010") then
		  ascii <= "01000010";
		--R
		elsif (shift ='1'and scan_code = "00101101") then
		  ascii <= "01010010";
		 --A
		elsif (shift ='1' and scan_code = "00011100") then
		  ascii <= "01000001";
		  --N
		elsif (shift ='1' and scan_code = "00110001") then
		  ascii <= "01001110";
		  --D
		elsif (shift ='1' and scan_code = "00100011") then
		  ascii <= "01000100";
		  --O
		elsif (shift ='1' and scan_code = "01000100") then
		  ascii <= "01001111";
		 
	   end if;
	end process;
End arch;

