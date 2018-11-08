library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity memoriaDeDados is
    port (
        CLK     : in STD_LOGIC;
        LER     : in std_logic;
        ESCREVER: in std_logic;
        ENDERECO: in std_logic_vector(15 downto 0);
        DADO_W  : in std_logic_vector(31 downto 0);
		  
        DADO_R: out std_logic_vector(31 downto 0)
	);
end entity;

architecture memoriaDeDadosArch of memoriaDeDados is

type memory_t is array (63 downto 0) of std_logic_vector (31 downto 0);
signal content: memory_t;
attribute ram_init_file : string;
attribute ram_init_file of content: signal is "initDATAMEM.mif";

begin
    process(CLK)
    begin
        if (RISING_EDGE(CLK)) then
            if(ESCREVER) then
                content(to_integer(unsigned(ENDERECO))) <= DADO_W;
            end if;
        end if;
    end process;
	 
	DADO_R <= content(to_integer(unsigned(ENDERECO))) when LER = '1' else (OTHERS =>'0'); 
end architecture;