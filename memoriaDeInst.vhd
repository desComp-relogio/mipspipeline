library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity memoriaDeInst is
    generic (
        DATA_WIDTH : natural := 32;
        ADDR_WIDTH : natural := 6
    );

    port (
			ADDR: in integer range 0 to 2**ADDR_WIDTH-1 := 0;
			CLK : in STD_LOGIC;
			
			Q: out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end entity;

architecture memoriaDeInstArch of memoriaDeInst is

type memory_t is array (2**ADDR_WIDTH-1 downto 0) of std_logic_vector (DATA_WIDTH-1 downto 0);
signal content: memory_t;
attribute ram_init_file : string;
attribute ram_init_file of content: signal is "initROM.mif";

begin
    process(CLK)
    begin
        if (RISING_EDGE(CLK)) then
            Q <= content(ADDR);
		end if;
    end process;
end architecture;