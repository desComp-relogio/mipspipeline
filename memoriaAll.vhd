library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaAll is
    port (
        CLK             : in STD_LOGIC;
        END_MEM         : in STD_LOGIC_VECTOR(31 DOWNTO 0);
        DATA_MEM_W      : in STD_LOGIC_VECTOR(31 DOWNTO 0);
        RD              : in STD_LOGIC;
        WR              : in STD_LOGIC;

        DATA_MEM_R      : out STD_LOGIC_VECTOR(31 DOWNTO 0);
		HM			    : out std_logic
	);
end entity;

architecture memoriaAllArch of memoriaAll is
    signal HM_aux: std_logic;
begin
    decoder: entity work.decoder port map(ENDERECO => END_MEM, habMEM => HM_aux);
    memoria64k: entity work.memoriaDeDados port map(CLK => CLK, LER => RD and HM_aux, ESCREVER => WR and HM_aux,
        ENDERECO => "00" & END_MEM(15 downto 2), DADO_W => DATA_MEM_W, DADO_R => DATA_MEM_R);
	 HM <= HM_aux;
end architecture;