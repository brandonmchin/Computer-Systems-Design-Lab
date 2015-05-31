library ieee;
use ieee.std_logic_1164.all;

entity Test_ps2_rec is
port
(
rec_done: out std_logic
);
end Test_ps2_rec;

Architecture arch_test of Test_ps2_rec is

component ps2_rec
	port
	(
		Clk ,Reset: in std_logic;
		ps2Data   : in std_logic;
		ps2Clock : in std_logic;
		rec_en : in std_logic;
		rec_done: out std_logic;
		Dout: out std_logic_vector(7 downto 0)
	);
end component;

Signal clk: std_logic := '0';
Signal ps2Data, ps2Clock: std_logic;
Signal Dout: std_logic_vector(7 downto 0);
signal data : std_logic_vector(8 downto 0) := "011010000";

begin

rec: ps2_rec port map
(
	Clk => Clk,
	Reset => '0',
	ps2Data => ps2Data,
	ps2Clock => ps2Clock,
	rec_en => '1',
	rec_done => rec_done,
	Dout => Dout
	);

process
begin
wait for 50 ns;
clk <= not clk;
end process;

process
begin
	ps2Data <= '1';
	ps2Clock <= '1';
	wait for 100 us;
	ps2Data <= '0';
	ps2Clock <= '1';
	wait for 35 us;
	ps2Data <= '0';
	ps2Clock <= '0';
	wait for 35 us;
	
	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(0);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(1);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(2);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(3);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(4);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(5);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(6);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(7);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= Data(8);
	wait for 35 us;

	ps2Clock <= not ps2Clock;
	wait for 35 us;
	ps2Clock <= not ps2Clock;
	ps2Data <= '1';
	wait for 35 us;

	ps2Clock <= '1';
	wait for 35 us;

if (Data(7 downto 0) = Dout) then
	   report "No error detected. Simulation successful" severity failure;
	else
	    report "Error detected" severity failure;
end if;	
	
	
end process;

end arch_test;


