library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ulaMips is
	port (
		-- Input ports
		A				: in  std_logic_vector(31 downto 0);
		B				: in  std_logic_vector(31 downto 0);
		SEL 			: in  std_logic_vector(1 downto 0);
		INVERTE_A	: in std_logic;
		INVERTE_B	: in std_logic;
		CIN 		: in std_logic;

		-- Output ports
		R 			: out std_logic_vector(31 downto 0);
		ZERO		: out std_logic;
		DEBUG_ULA_SLT: out std_logic_vector(31 downto 0)
	);
end ulaMips;

architecture arch_mips of ulaMips is
	signal r_ula	:  std_logic_vector(31 downto 0);
	signal r_or		:  std_logic_vector(31 downto 0);
	signal r_and	:  std_logic_vector(31 downto 0);
	signal slt		:  std_logic_vector(31 downto 0);
	signal z		:  std_logic;
	signal v		:  std_logic;
	signal r_a		:  std_logic_vector(31 downto 0);
	signal r_b		:  std_logic_vector(31 downto 0);
begin
	
	Mux_A: entity work.mux2 port map (A => A, B => not A, SEL => INVERTE_A, q => r_a);
	Mux_B: entity work.mux2 port map (A => B, B => not B, SEL => INVERTE_B, q => r_b);
	ULA  : entity work.ulinha port map (A => r_a, B => r_b, CIN => CIN, Q => r_ula, Z => z, OVERFLOW => v);
	Mux_4: entity work.mux4 port map (A => r_and, B => R_or, C => r_ula, D => slt, SEL => SEL, q => R);
	r_or <=	r_a or r_b;
 	r_and <=	r_a and r_b;
	
	slt <= (0 => (r_ula(31) xor v), others => '0');
	DEBUG_ULA_SLT <= slt;
	
	
	
	ZERO <= not(R(0) or R(1) or R(2) or R(3) or R(4) or R(5) or R(6) or R(7) or R(8) or R(9) or R(10)
	      or R(11) or R(12) or R(13) or R(14) or R(15) or R(16) or R(17) or R(18) or R(19) or R(20) 
			or R(21) or R(22) or R(23) or R(24) or R(25) or R(26) or R(27) or R(28) or R(29) or R(30) or R(31)) ;	

end arch_mips;
