library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifterLeft2 is
    generic (
        BYTE_WIDTH : integer := 32;
    );

	port (
		-- Input ports
	    A   : in  std_logic_vector(BYTE_WIDTH-1 downto 0);
		-- Output ports
        Q	: out std_logic_vector(BYTE_WIDTH-1 downto 0)
    );
end entity;

architecture shifterLeft2Arch of shifterLeft2 is
	signal sig: std_logic_vector(BYTE_WIDTH-3 downto 0);
begin
	sig <= A(BYTE_WIDTH-3 downto 0);
	Q <= sig & "00";
end architecture;
