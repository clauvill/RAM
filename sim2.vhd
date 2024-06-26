--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:02:02 03/27/2024
-- Design Name:   
-- Module Name:   /home/ise/tade/RAM1/sim2.vhd
-- Project Name:  RAM1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_ng
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim1 IS
END sim1;
 
ARCHITECTURE behavior OF sim1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_ng
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         wr : IN  std_logic;
         din : IN  std_logic_vector(31 downto 0);
         addr : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal wr : std_logic := '0';
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_ng PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          wr => wr,
          din => din,
          addr => addr,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		en <= '1';
		rst <= '1';
		wait for 100 ns;
		rst <= '0';
		wr <= '1';
		addr <= "00000000";
		din <= "00110100000000000000000000001111";
		
		wait for clk_period*3 ;
		
		wr <= '0';
		addr <= "00000000";
		
      wait;
   end process;

END;