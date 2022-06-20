----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:25:43 06/19/2022 
-- Design Name: 
-- Module Name:    ALU_4BITS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_4BITS is
    Port ( 
			  --Entradas
			  A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  --Salidas
           opcode : in  STD_LOGIC_VECTOR (2 downto 0);
           Cout : out  STD_LOGIC;
           Yout : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_4BITS;

architecture Behavioral of ALU_4BITS is
	signal Y_tmp: std_logic_vector(4 downto 0) := (others => '0');
begin
	--Para que aparezca el acarreo se debe concatenar un cero a la izquierda
	--Operaciones Logicas
	with opcode(2 downto 0) select
		Y_tmp <= ('0' & A) when "000",
					('0' & B) when "001",
					('0' & A) and ('0' & B) when "010",
					('0' & A) or  ('0' & B) when "011",
	--Operaciones Arimeticas
					('0' & A) + B		when "100",
					('0' & A) + '1'	when "101",
					('0' & A) - '1'	when "110",
					('0' & A) - B		when others;
					
	Cout <= Y_tmp(4);	
	Yout <= Y_tmp(3 downto 0);
	
end Behavioral;

