-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library IEEE;
-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;
-- SIGNED and UNSIGNED types, and relevant functions
use ieee.numeric_std.all;

entity mipsUc is
	port (
		-- Input ports
        INST_OPCODE     : in std_logic_vector(5 downto 0);
        
        -- Output ports
        MUX_PC_BEQ_JMP  : out STD_LOGIC;
        MUX_RT_RD       : out STD_LOGIC;
        HAB_ESCRITA_REG : out STD_LOGIC;
        MUX_RT_IMM      : out STD_LOGIC;
        MUX_ULA_MEM     : out STD_LOGIC;
        BEQ             : out STD_LOGIC;
        HAB_LEITURA_MEM : out STD_LOGIC;
        HAB_ESCRITA_MEM : out STD_LOGIC;                
        ULA_OP          : out STD_LOGIC_VECTOR(1 DOWNTO 0)    
	);
	
end entity;

architecture mipsUcArch of mipsUc is

begin
  process(all)
  begin
  case INST_OPCODE is
    when "000000" => 
        MUX_PC_BEQ_JMP  <= '0';
        MUX_RT_RD       <= '1';
        HAB_ESCRITA_REG <= '1';
        MUX_RT_IMM      <= '0';
        MUX_ULA_MEM     <= '0';
        BEQ             <= '0';
        HAB_LEITURA_MEM <= '0';
        HAB_ESCRITA_MEM <= '0';
        ULA_OP          <= "10";
    when "100011" =>
        MUX_PC_BEQ_JMP  <= '0';
        MUX_RT_RD       <= '0';
        HAB_ESCRITA_REG <= '1';
        MUX_RT_IMM      <= '1';         
        MUX_ULA_MEM     <= '1';
        BEQ             <= '0';
        HAB_LEITURA_MEM <= '1';
        HAB_ESCRITA_MEM <= '0';
        ULA_OP          <= "00";    
    when "101011" => 
        MUX_PC_BEQ_JMP  <= '0';
        MUX_RT_RD       <= '0';
        HAB_ESCRITA_REG <= '0';
        MUX_RT_IMM      <= '1';
        MUX_ULA_MEM     <= '0';
        BEQ             <= '0';
        HAB_LEITURA_MEM <= '0';
        HAB_ESCRITA_MEM <= '1';
        ULA_OP          <= "00";
    when "000100" => 
        MUX_PC_BEQ_JMP  <= '0';
        MUX_RT_RD       <= '0';
        HAB_ESCRITA_REG <= '0';
        MUX_RT_IMM      <= '0';
        MUX_ULA_MEM     <= '0';
        BEQ             <= '1';
        HAB_LEITURA_MEM <= '0';
        HAB_ESCRITA_MEM <= '0';
        ULA_OP          <= "01";

    when "000010" =>
        MUX_PC_BEQ_JMP  <= '1';
        MUX_RT_RD       <= 'X';
        HAB_ESCRITA_REG <= '0';
        MUX_RT_IMM      <= 'X';         
        MUX_ULA_MEM     <= 'X';
        BEQ             <= 'X';
        HAB_LEITURA_MEM <= '0';
        HAB_ESCRITA_MEM <= '0';
        ULA_OP          <= "XX";

    when OTHERS => 
        MUX_PC_BEQ_JMP  <= '0';
        MUX_RT_RD       <= '0';
        HAB_ESCRITA_REG <= '0';
        MUX_RT_IMM      <= '0';         
        MUX_ULA_MEM     <= '0';
        BEQ             <= '0';
        HAB_LEITURA_MEM <= '0';
        HAB_ESCRITA_MEM <= '0';
        ULA_OP          <= "00";
	end case;
	end process;
end architecture;

