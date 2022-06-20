--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:57:42 06/19/2022
-- Design Name:   
-- Module Name:   C:/Users/Joan/Desktop/ISE PROYECT/Ejercicios/test_ALU4Bits.vhd
-- Project Name:  Ejercicios
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_4BITS
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
 
ENTITY test_ALU4Bits IS
END test_ALU4Bits;
 
ARCHITECTURE behavior OF test_ALU4Bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_4BITS
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         opcode : IN  std_logic_vector(2 downto 0);
         Cout : OUT  std_logic;
         Yout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal opcode : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   --signal Yout : std_logic_vector(3 downto 0);
	signal Result : std_logic_vector(3 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
begin
	uut: ALU_4BITS PORT MAP (A,B,opcode,Cout,Result);
	
	A <= "1100" after 80 ns;
	B <= "1010" after 80 ns;
	opcode <= opcode + '1' after 10 ns;
end architecture;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_4BITS PORT MAP (
          A => A,
          B => B,
          opcode => opcode,
          Cout => Cout,
          Yout => Yout
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;