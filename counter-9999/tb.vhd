LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cnt9999
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         out1 : OUT  std_logic_vector(6 downto 0);
         digit : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal out1 : std_logic_vector(6 downto 0):= (others => '0');
   signal digit : std_logic_vector(3 downto 0):= (others => '0');

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cnt9999 PORT MAP (
          clk => clk,
          reset => reset,
          out1 => out1,
          digit => digit
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';
        wait for 100 ns;
        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';
        wait;  
	 end process;

END;
