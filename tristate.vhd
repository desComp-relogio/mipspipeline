library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tristate is
    port (
        DIN             : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
        EN      			: in  STD_LOGIC;
		  DOUT         	: out STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end entity;

architecture tristateArch of tristate is
begin
    DOUT <= DIN when EN = '1' else (OTHERS => 'Z');
end architecture;