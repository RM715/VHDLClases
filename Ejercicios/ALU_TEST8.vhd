--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:04:16 06/19/2022
-- Design Name:   
-- Module Name:   C:/Users/Joan/Desktop/ISE PROYECT/Ejercicios/ALU_TEST8.vhd
-- Project Name:  Ejercicios
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU8_BITS
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
 
ENTITY ALU_TEST8 IS
END ALU_TEST8;
 
ARCHITECTURE behavior OF ALU_TEST8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU8_BITS
    PORT(
         a_i : IN  std_logic_vector(7 downto 0);
         b_i : IN  std_logic_vector(7 downto 0);
         opcode_i : IN  std_logic_vector(1 downto 0);
         d_o : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a_s : std_logic_vector(7 downto 0) := (others => '0');
   signal b_s : std_logic_vector(7 downto 0) := (others => '0');
   signal opcode_s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal d_s : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU8_BITS PORT MAP (a_s, b_s,opcode_s, d_s);
          a_s => "00010001", "01100101" after 5 ns,
          b_s => "00100011", "00000010" after 5 ns;
          opcode_s => "00", "01" after 5 ns,
          --d_o => d_o
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
