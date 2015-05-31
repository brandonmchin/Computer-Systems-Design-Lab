Library ieee;
Use ieee.std_logic_1164.all;

Entity equal is
Port(
I0, I1	: in std_logic;
Eq	: out std_logic);
End equal;

Architecture arch of equal is
Signal P0, P1 : std_logic;
begin
Eq <= P0 or P1;
P0 <= (not I0) and (not I1);
P1<= I0 and I1;
End arch;
