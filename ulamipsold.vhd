library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_misc.nor_reduce;

entity ulaMipsDlx is
	port (
      -- Input ports
		A	        : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		B	        : in STD_LOGIC_VECTOR(31 DOWNTO 0);
		SEL       : in STD_LOGIC_VECTOR(1 DOWNTO 0);
		INVERTE_A : in STD_LOGIC;
		INVERTE_B : in STD_LOGIC;
    C_OUT     : in STD_LOGIC;
		C_IN 	    : in STD_LOGIC;
		
      -- Output ports
    Q     : out STD_LOGIC_VECTOR(31 DOWNTO 0);
		ZERO  : out STD_LOGIC
	);
end entity;

architecture ulaMipsDlxArch of ulaMipsDlx is
	-- Declarations (optional)
  signal aux_a        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal aux_b        : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal aux_ula_in_a : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal aux_ula_in_b : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal aux_result   : STD_LOGIC_VECTOR(31 DOWNTO 0);
  
  begin
--    ULINHA:entity work.ulinha PORT MAP ()
    MUX2A: entity work.mux2 PORT MAP (A => aux_a, B => not aux_a, sel => INVERTE_A, q => aux_ula_in_a);
    MUX2B: entity work.mux2 PORT MAP (A => aux_b, B => not aux_b, sel => INVERTE_B, q => aux_ula_in_b);
    MUX4 : entity work.mux4 PORT MAP (A => aux_ula_in_b and aux_ula_in_a, B => aux_ula_in_a or aux_ula_in_b, C => ?, D => ?, X => auxResult);
    aux_a <= A;
    aux_b <= B;
    Q <= aux_result;
    ZERO <= nor_reduce(aux_result);

end architecture;