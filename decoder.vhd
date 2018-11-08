library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    port (
        ENDERECO: in std_logic_vector(31 downto 0);		
        habMEM  : out std_logic
	);
end entity;

architecture decoderArch of decoder is

begin
    habMEM <= not(ENDERECO(16) or ENDERECO(17) or ENDERECO(18) or ENDERECO(19) or ENDERECO(20) or ENDERECO(21) 
				  or ENDERECO(22) or ENDERECO(23) or ENDERECO(24) or ENDERECO(25) or ENDERECO(26) or ENDERECO(27) 
				  or ENDERECO(28) or ENDERECO(29) or ENDERECO(30) or ENDERECO(31));	
end architecture;