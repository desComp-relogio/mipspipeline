entity memoriaDeInst is
    generic (
        DATA_WIDTH : natural := 8;
        ADDR_WIDTH : natural := 9
    );

    port (
        CLK: in std_logic;
        ADDR: in natural range 0 to 2**ADDR_WIDTH-1;
        Q: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end entity;

architecture memoriaDeInstArch of memoriaDeInst is

type memory_t is array (2**ADDR_WIDTH-1 downto 0) of std_logic_vector (DATA_WIDTH-1 downto 0);
signal content: memory_t;
attribute ram_init_file : string;
attribute ram_init_file of content:
signal is "initROM.mif";

begin
    process(CLK)
    begin
        if (RISING_EDGE(CLK)) then
            Q <= content(ADDR);
        end if;
    end process;
end architecture;