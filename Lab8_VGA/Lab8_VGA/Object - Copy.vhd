library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Object is
port
(
Color: in std_logic_vector(2 downto 0);
Init_X, Init_Y: in std_logic_vector(9 downto 0);
Pixel_X, Pixel_Y: in std_logic_vector(9 downto 0);
RGB : out std_logic_vector(2 downto 0);
Object_On: out std_logic
);
end Object;

architecture arch of Object is
Constant W : unsigned(9 downto 0):= "0011010000"; --208
Constant H : unsigned(9 downto 0):= "0001000000"; --64

begin
process(Pixel_X, Pixel_Y)
begin
RGB <= Color;
if(
	(Pixel_X >=init_X) and
	(pixel_Y>=init_Y) and
	(unsigned (Pixel_X)<(unsigned(init_x)+w)) and
	(unsigned(pixel_y)<(unsigned (init_Y)+H)) )then 
	Object_On <= '1';
else
	object_On <='0';
end if;
end process;
end arch;