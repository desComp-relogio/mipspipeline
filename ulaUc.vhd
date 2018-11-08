-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;
-- SIGNED and UNSIGNED types, and relevant functions
use ieee.numeric_std.all;

entity ulaUc is
	port (
		-- Input ports
		FUNCT : in std_logic_vector(5 downto 0);
		ULA_OP: in std_logic_vector(1 downto 0);
		-- Output ports
		Q		  : out std_logic_vector(3 downto 0)
	);
	
end entity;
-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture ulaUcArch of ulaUc is
	-- Declarations (optional)
signal out_aux  : std_logic_vector(3 DOWNTO 0) := (others => '-');
signal out_0_aux: std_logic;

begin
  out_aux(3) <= '0';
  out_aux(2) <= ULA_OP(0) or (FUNCT(1) and ULA_OP(1));
  out_aux(1) <= '1' when (FUNCT(3) = '1' or FUNCT(2) = '0' or ULA_OP(1) = '0') else '0'; -- or (FUNCT(2) = '0');
  out_0_aux <= '1' when (FUNCT(3 DOWNTO 0) = "0101" or FUNCT(3 DOWNTO 0) = "1010") else '0';
  out_aux(0) <= out_0_aux and ULA_OP(1);
  Q <= out_aux;
end architecture;
