----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:03 06/19/2022 
-- Design Name: 
-- Module Name:    sas - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity MemoriaRAM is
		Port(clk: in STD_LOGIC;
					datoEntrada, direccion : in STD_LOGIC_VECTOR(1 downto 0);
					CE, OE, WE : in STD_LOGIC;
					datoSalida : out STD_LOGIC_VECTOR(1 downto 0));
end MemoriaRAM;

architecture arq of MemoriaRAM is
type datos is array (0 to 3) of STD_LOGIC_VECTOR(1 downto 0);
signal signalDatos : datos;
begin
process(clk)
begin
	if CE = '0' then
		if (clk'event and clk='1') then
			if WE = '0' then
				signalDatos(to_integer(unsigned(direccion))) <= datoEntrada;
			else
				datoSalida <= signalDatos(to_integer(unsigned(direccion)));
			end if;
		end if;
	end if;
end process;
end arq;

