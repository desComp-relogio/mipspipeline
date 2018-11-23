library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador is
	port (
		-- Input ports
        A   : in std_logic_vector(31 downto 0);
        B   : in std_logic_vector(31 downto 0);
		-- Output ports
        Q	: out std_logic_vector(31 downto 0)
    );
end entity;

architecture somadorArch of somador is
begin
	Q <=  std_logic_vector(to_unsigned(to_integer(unsigned(A)) + to_integer(unsigned(B)), Q'length));
end architecture;
