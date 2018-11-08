library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2 is
	generic(
		data_len: natural:= 32
	);
	port (
		-- Input ports
		A	: in  std_logic_vector(data_len-1 downto 0);
		B	: in  std_logic_vector(data_len-1 downto 0);
		SEL	: in  std_logic;
		-- Output ports
		Q	: out std_logic_vector(data_len-1 downto 0)
	);
	
end entity;
architecture mux2Arch of mux2 is
begin
	process(all)
	begin
		case SEL is
			when '0' => Q <= A;
			when '1' => Q <= B;
		end case;
	end process;
end architecture;
