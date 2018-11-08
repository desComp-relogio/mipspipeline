library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ulinha is
	port (
		-- Input ports
		A	: in  std_logic_vector(31 downto 0);
		B	: in  std_logic_vector(31 downto 0);
		CIN: in  std_logic;

		-- Output ports
		Q	: out std_logic_vector(31 downto 0);
		Z	: out std_logic;
		OVERFLOW : out std_logic
	);
	
end ulinha;

architecture ulinhaArch of ulinha is
	signal COUT:  std_logic_vector(31 downto 0);
	signal INTER: std_logic_vector(31 downto 0);
	signal INTER2: std_logic_vector(31 downto 0);
	signal INTER3: std_logic_vector(31 downto 0);


begin
	INTER <= A xor B; 
	INTER2 <= A and B;
	INTER3(0) <= INTER(0) and CIN;
	INTER3(31 downto 1) <= INTER(31 downto 1) and COUT (30 downto 0);
	COUT <= INTER2 xor INTER3;
	
	Q(0) <= INTER(0) xor CIN;
	Q(31 downto 1) <= INTER(31 downto 1) xor COUT(30 downto 0);
	
	OVERFLOW <= COUT(30) xor COUT(31);

	Z <= not(Q(0) or Q (1) or Q(2) or Q(3) or Q(4) or Q (5) or Q (6) or Q(7) or Q(8) or Q(9) or Q(10)
	      or Q(11) or Q(12) or Q(13) or Q(14) or Q(15) or Q(16) or Q(17) or Q(18) or Q(19) or Q(20) 
      or Q(21) or Q(22) or Q(23) or Q(24) or Q(25) or Q(26) or Q(27) or Q(28) or Q(29) or Q(30) or Q(31));	
      
end architecture;
