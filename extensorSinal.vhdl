library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extensorSinal is
	port (
		-- Input ports
	    A       : in  std_logic_vector(15 downto 0);
		-- Output ports
        Q	    : out std_logic_vector(31 downto 0)
    );
end entity;

architecture extensorSinalArch of extensorSinal is
	signal sig: std_logic_vector(15 downto 0);
begin
	sig <= (others => A(15));
	Q <= sig & A;
end architecture;
