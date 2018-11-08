library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Baseado no apendice C (Register Files) do COD (Patterson & Hennessy).
entity bancoRegistradores is
-- Leitura de 2 registradores e escrita em 1 registrador simultaneamente.
    port
    (
        HAB_ESCRITA_REG        : in std_logic := '0';
        CLK                    : in std_logic;
--
        END1                   : in std_logic_vector(4 downto 0);
        END2                   : in std_logic_vector(4 downto 0);
        END3                   : in std_logic_vector(4 downto 0);
--
        DADO_W_REG3          : in std_logic_vector(31 downto 0);
--
        
        DADO_R_REG1          : out std_logic_vector(31 downto 0);
        DADO_R_REG2          : out std_logic_vector(31 downto 0)
    );
end entity;

architecture comportamento of bancoRegistradores is

    subtype palavra_t is std_logic_vector(31 downto 0);
    type memoria_t is array(31 downto 0) of palavra_t;

    -- Declaracao dos registradores:
    shared variable registrador : memoria_t;
--  shared variable registrador : memoria_t := inicializa_regs;

begin
    process(CLK) is
    begin
        if (rising_edge(CLK)) then
            if (HAB_ESCRITA_REG = '1') then
                registrador(to_integer(unsigned(END3))) := DADO_W_REG3;
            end if;
        end if;
    end process;

    -- IF endereco = 0 : retorna ZERO
     process(all) is
     begin
         if (unsigned(END1) = 0) then
            DADO_R_REG1 <= (others => '0');
         else
            DADO_R_REG1 <= registrador(to_integer(unsigned(END1)));
         end if;
         if (unsigned(END2) = 0) then
            DADO_R_REG2 <= (others => '0');
         else
            DADO_R_REG2 <= registrador(to_integer(unsigned(END2)));
        end if;
     end process;
end architecture;