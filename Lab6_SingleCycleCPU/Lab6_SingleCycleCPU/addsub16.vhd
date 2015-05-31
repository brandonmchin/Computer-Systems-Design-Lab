-- XOR gate
library ieee;
use ieee.std_logic_1164.all;

entity xorGate is	
   port( a, b : in std_logic;
            f : out std_logic);
end xorGate;

architecture ARCH of xorGate is 
begin
   f <= a xor b; 
end ARCH;

-- FULL BIT ADDER
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
   port( x, y, cin : in std_logic;
         sum, cout : out std_logic);
end full_adder;

architecture ARCH of full_adder is
begin
   sum <= (x xor y) xor cin;
   cout <= (x and (y or cin)) or (cin and y);
end ARCH;

-- SEVEN SEGMENT HEX CONVERTER
library ieee;
use ieee.std_logic_1164.all;

entity convert is
   port( X         : in std_logic_vector(3 downto 0);
         Y         : out std_logic_vector(6 downto 0));
end convert;

architecture ARCH of convert is
begin
  process(X)
    begin
      case X is
        -- 0 = on, 1 = off
        when "0000" => Y <= "1000000";		-- 0
        when "0001" => Y <= "1111001";		-- 1
        when "0010" => Y <= "0100100";		-- 2
        when "0011" => Y <= "0110000";		-- 3
        when "0100" => Y <= "0011001";		-- 4
        when "0101" => Y <= "0010010";		-- 5
        when "0110" => Y <= "0000010";		-- 6
        when "0111" => Y <= "1111000";		-- 7
        when "1000" => Y <= "0000000";		-- 8
        when "1001" => Y <= "0011000";		-- 9
        when "1010" => Y <= "0001000";		-- A
        when "1011" => Y <= "0000011";		-- B
        when "1100" => Y <= "1000110";		-- C
        when "1101" => Y <= "0100001";		-- D
        when "1110" => Y <= "0000110";		-- E
        when "1111" => Y <= "0001110";		-- F
      end case;
  end process;

end ARCH;

-- 16-bit Adder/Subtractor
library ieee;
use ieee.std_logic_1164.all;

entity addsub16 is 
   port( mode                : in std_logic;
	  A		                 : in std_logic_vector(15 downto 0);
	  B		                 : in std_logic_vector(15 downto 0);
	  S		                 : buffer std_logic_vector(15 downto 0);
      HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0));
end addsub16;

architecture struct of addsub16 is

   component xorGate is             --XOR component
       port( a, b : in std_logic;
                f : out std_logic);
   end component;

   component full_adder is	         --FULL ADDER component
      port( x, y, cin : in std_logic;
            sum, cout : out std_logic);
   end component;
   
   component convert is               -- HEX_CONVERTER component
       port(X : in std_logic_vector(3 downto 0);
            Y : out std_logic_vector(6 downto 0));
   end component;

   signal C	:std_logic_vector(15 downto 0);		-- intermediate carries
   signal X	: std_logic_vector(15 downto 0);	-- xor outputs
  
begin
   
   GX0: xorGate port map(mode, B(0), X(0)); 
   GX1: xorGate port map(mode, B(1), X(1)); 
   GX2: xorGate port map(mode, B(2), X(2)); 
   GX3: xorGate port map(mode, B(3), X(3));
   GX4: xorGate port map(mode, B(4), X(4)); 
   GX5: xorGate port map(mode, B(5), X(5));
   GX6: xorGate port map(mode, B(6), X(6)); 
   GX7: xorGate port map(mode, B(7), X(7)); 
   GX8: xorGate port map(mode, B(8), X(8)); 
   GX9: xorGate port map(mode, B(9), X(9)); 
   GX10: xorGate port map(mode, B(10), X(10)); 
   GX11: xorGate port map(mode, B(11), X(11)); 
   GX12: xorGate port map(mode, B(12), X(12)); 
   GX13: xorGate port map(mode, B(13), X(13));
   GX14: xorGate port map(mode, B(14), X(14)); 
   GX15: xorGate port map(mode, B(15), X(15));   

   FA0: full_adder port map(A(0), X(0), mode,  S(0), C(0));
   FA1: full_adder port map(A(1), X(1), C(0),  S(1), C(1));
   FA2: full_adder port map(A(2), X(2), C(1),  S(2), C(2));
   FA3: full_adder port map(A(3), X(3), C(2),  S(3), C(3));
   FA4: full_adder port map(A(4), X(4), C(3),  S(4), C(4));
   FA5: full_adder port map(A(5), X(5), C(4),  S(5), C(5));
   FA6: full_adder port map(A(6), X(6), C(5),  S(6), C(6));
   FA7: full_adder port map(A(7), X(7), C(6),  S(7), C(7));
   FA8: full_adder port map(A(8), X(8), C(7),  S(8), C(8));
   FA9: full_adder port map(A(9), X(9), C(8),  S(9), C(9));
   FA10: full_adder port map(A(10), X(10), C(9),  S(10), C(10));
   FA11: full_adder port map(A(11), X(11), C(10),  S(11), C(11));
   FA12: full_adder port map(A(12), X(12), C(11),  S(12), C(12));
   FA13: full_adder port map(A(13), X(13), C(12),  S(13), C(13));
   FA14: full_adder port map(A(14), X(14), C(13),  S(14), C(14));
   FA15: full_adder port map(A(15), X(15), C(14),  S(15), C(15)); 
   
   DISPLAY0: convert port map(S(3)&S(2)&S(1)&S(0), HEX0);   
   DISPLAY1: convert port map(S(7)&S(6)&S(5)&S(4), HEX1);
   DISPLAY2: convert port map(S(11)&S(10)&S(9)&S(8), HEX2);   
   DISPLAY3: convert port map(S(15)&S(14)&S(13)&S(12), HEX3);
                                            
end struct;
