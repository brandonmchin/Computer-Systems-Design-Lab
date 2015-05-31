Library ieee;
Use ieee.std_logic_1164.all;

Entity two_bit_equal is
Port (
a, b: in std_logic_vector(1 downto 0);
aeqb : out std_logic);
End two_bit_equal;

Architecture arch of two_bit_equal is
Signal p0, p1,p2,p3 : std_logic;
begin
aeqb <= P0 or P1 or P2 or P3;
P0 <= (not a(1)) and (not b(1)) and (not a(0)) and (not b(0));
P1<= (not a(1)) and (not b(1)) and a(0) and b(0);
P2<= a(1) and b(1) and (not a(0)) and (not b(0));
P3 <= a(1) and b(1) and a(0) and b(0);
End arch;
