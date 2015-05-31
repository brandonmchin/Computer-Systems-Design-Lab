library ieee;
use ieee.std_logic_1164.all;

entity test_addsub16 is
end test_addsub16;

architecture arch of test_addsub16 is
   component addsub16 is 
      port( mode         : in std_logic;
		A	 : in std_logic_vector(15 downto 0);
		B	 : in std_logic_vector(15 downto 0);
		S	 : out std_logic_vector(15 downto 0);
                cout, overflow  : out std_logic);
   end component;

   signal mode		: std_logic;
   signal A, B		: std_logic_vector(15 downto 0);
   signal S		: std_logic_vector(15 downto 0);
   signal cout, overflow : std_logic;

begin
   mapping: addsub16 port map(
                                 mode,
                       A(15 downto 0),		
                       B(15 downto 0),		
                       S(15 downto 0),	
                             cout, overflow);

   process
   begin
      mode <= '1'; -- subtraction
      wait for 10 ns;
      mode <= '0'; -- addition
      wait for 10 ns;
   end process;

   process
      variable errCnt : integer := 0;
   begin
      -- TEST 1 (negative +- positive)
      A <= "1111111111111011";
      B <= "0000000000000110";

      wait for 20 ns;
      assert (cout = '1') report "Error" severity error;
      assert (S = "0000000000000001") report "Error" severity error;
      assert (overflow = '0') report "Error" severity error;
      if(cout /= '1' or overflow /= '0') then
         errCnt:= errCnt + 1;
      end if;

      --TEST 2 (positive +- positive)
      A <= "0000000000000111";
      B <= "0000000000000101";

      wait for 20 ns;
      assert (cout = '0') report "Error" severity error;
      assert (S = "0000000000001100") report "Error" severity error;
      assert (overflow = '0') report "Error" severity error;
      if(cout /= '0' or overflow /= '0') then
         errCnt:= errCnt + 1;
      end if;

      -- TEST 3 (positive +- negative)
      A <= "0000000000000110";
      B <= "1111111111111011";

      wait for 20 ns;
      assert (cout = '1') report "Error" severity error;
      assert (S = "0000000000000001") report "Error" severity error;
      assert (overflow = '0') report "Error" severity error;
      if (cout /= '1' or overflow /= '0') then
     	  errcnt := errcnt + 1;
      end if;

      -- TEST 4 (negaitve +- negative)
      A <= "1111111111111010";
      B <= "1111111111111011";

      wait for 20 ns;
      assert (cout = '1') report "Error" severity error;
      assert (S = "1111111111110101") report "Error" severity error;
      assert (overflow = '0') report "Error" severity error;
      if (cout /= '1' or overflow /= '0') then
     	  errcnt := errcnt + 1;
      end if;

      -- TEST 5 (positive overflow)
      A <= "0111111111111111";
      B <= "0111111111111111";

      wait for 20 ns;
      assert (cout = '0') report "Error" severity error;
      assert (S = "1111111111111110") report "Error" severity error;
      assert (overflow = '1') report "Error" severity error;
      if (cout /= '0' or overflow /= '1') then
     	  errcnt := errcnt + 1;
      end if;

      -- TEST 6 (negative overflow)
      A <= "1000000000000000";
      B <= "1000000000000000";

      wait for 20 ns;
      assert (cout = '1') report "Error" severity error;
      assert (S = "0000000000000000") report "Error" severity error;
      assert (overflow = '1') report "Error" severity error;
      if (cout /= '1' or overflow /= '1') then
     	  errcnt := errcnt + 1;
      end if;

      ------------ SUMMARY ----------------
      if(errCnt = 0) then
         assert false report "Good!"  severity note;
      else
         assert false report "Error!"  severity error;
      end if;

   end process;
end arch;
