-- CONVERTER
library ieee;
use ieee.std_logic_1164.all;

entity converter is
   port( a         : in std_logic;
         newA      : out std_logic);
end converter;

architecture ARCH of converter is
begin
   newA <= a;    
end ARCH;

-- SIGN EXTENSION
library ieee;
use ieee.std_logic_1164.all;

entity sign_ext is
   port( A         : in std_logic_vector(7 downto 0);
         newA      : out std_logic_vector(15 downto 0));
end sign_ext;

architecture ARCH of sign_ext is

component converter is      -- CONVERTER component
	   port( a         : in std_logic;
             newA      : out std_logic);
end component;

begin
   extend0: converter port map(A(0), newA(0));
   extend1: converter port map(A(1), newA(1));
   extend2: converter port map(A(2), newA(2));
   extend3: converter port map(A(3), newA(3));
   extend4: converter port map(A(4), newA(4));
   extend5: converter port map(A(5), newA(5));
   extend6: converter port map(A(6), newA(6));
   extend7: converter port map(A(7), newA(7));
   extend8: converter port map(A(7), newA(8));
   extend9: converter port map(A(7), newA(9));
   extend10: converter port map(A(7), newA(10));
   extend11: converter port map(A(7), newA(11));
   extend12: converter port map(A(7), newA(12));
   extend13: converter port map(A(7), newA(13));
   extend14: converter port map(A(7), newA(14));
   extend15: converter port map(A(7), newA(15));
     
end ARCH;
