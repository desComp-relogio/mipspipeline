library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mipsFd is
	port (
        -- PORTAS ENTRADA
        CLK             : in STD_LOGIC;
        MUX_PC_BEQ_JMP  : in STD_LOGIC;
        MUX_RT_RD       : in STD_LOGIC;
        HAB_ESCRITA_REG : in STD_LOGIC;

        HAB_LEITURA_MEM : in STD_LOGIC;
        HAB_ESCRITA_MEM : in STD_LOGIC;

        MUX_RT_IMM      : in STD_LOGIC;
        ULA_OP          : in STD_LOGIC_VECTOR(1 DOWNTO 0);
        MUX_ULA_MEM     : in STD_LOGIC;
        BEQ             : in STD_LOGIC;
		PC_RESET			: in STD_LOGIC;

        DATA_MEM_R      : in STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- PORTAS SAIDA MEMORIA
        END_MEM         : out STD_LOGIC_VECTOR(31 DOWNTO 0);
        DATA_MEM_W      : out STD_LOGIC_VECTOR(31 DOWNTO 0);
		ULA_OUT			: out STD_LOGIC_VECTOR(31 DOWNTO 0);

        
		  --TESTES
		AUX_OP_OUT		: out STD_LOGIC_VECTOR(3 DOWNTO 0);
        MEM_OUT			: out STD_LOGIC_VECTOR(31 DOWNTO 0);

        DADO_LIDO_1     : out STD_LOGIC_VECTOR(31 DOWNTO 0);
        DADO_LIDO_2     : out STD_LOGIC_VECTOR(31 DOWNTO 0);

        -- PORTAS SAIDA
        INST_OPCODE     : out STD_LOGIC_VECTOR(5 DOWNTO 0);
		ZERO_aux			: out std_logic;
        PC_OUT          : out STD_LOGIC_VECTOR(31 DOWNTO 0);
		SOM_BEQ			: out std_logic_vector(31 downto 0)
    );

end entity;

architecture mipsFdArch of mipsFd is
    constant FOUR: STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(4, 32));

    signal aux_pc_in            : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    signal aux_pc_out           : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    signal aux_mux_beq_out      : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_mem_inst_out     : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    signal aux_som_pc_out       : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_banco_reg1_out   : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_banco_reg2_out   : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_extensor_out     : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_mux_rt_imm_out   : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_op               : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal aux_ula_out          : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_shifter32_out    : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_shifter26_out    : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_som_beq_out      : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_ula_mem_out      : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_ula_z            : STD_LOGIC;
    signal aux_mux_rt_rd_out    : STD_LOGIC_VECTOR(4 DOWNTO 0);
    signal aux_pc_reset         : STD_LOGIC := '0';

    signal aux_ifid_pc4         : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_ifid_rr1         : STD_LOGIC_VECTOR()
    signal aux_ifid_inst        : STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    
    signal aux_idex_wb          : STD_LOGIC_VECTOR(1 DOWNTO 0);
    signal aux_idex_m           : STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal aux_idex_ex          : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal aux_idex_pc4         : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_idex_r1          : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_idex_r2          : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_idex_extend      : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_idex_i16         : STD_LOGIC_VECTOR(4 DOWNTO 0);    
    signal aux_idex_i11         : STD_LOGIC_VECTOR(4 DOWNTO 0);
    
begin
    IFID            : entity work.registradorGenerico 
                      generic map(larguraDados => 64) 
                      port map (
                            DIN(31 DOWNTO 0)  =>  aux_som_pc_out 
                            DIN(63 downto 32) =>  aux_mem_inst_out,
                            DOUT(63 DOWNTO 31)=>  aux_ifid_pc4,
                            DOUT(31 DOWNTO 0) =>  aux_ifid_inst,  
                            ENABLE => '1', 
                            CLK => CLK, 
                            RST => '0'
                      );


    IDEX            : entity work.registradorGenerico generic map(larguraDados => 147) port map(
        DIN(4 DOWNTO 0)     => aux_ifid_inst(15 DOWNTO 11),
        DIN(9 DOWNTO 5)     => aux_ifid_inst(20 DOWNTO 16),
        DIN(41 DOWNTO 10)   => aux_extensor_out,
        DIN(73 DOWNTO 42)   => aux_banco_reg2_out,
        DIN(105 DOWNTO 74)  => aux_banco_reg1_out, 
        DIN(137 DOWNTO 106) => aux_ifid_pc4,
        DIN(141 DOWNTO 138) => MUX_RT_RD & ULA_OP & MUX_RT_IMM,        
        DIN(144 DOWNTO 142) => BEQ & HAB_LEITURA_MEM & HAB_ESCRITA_MEM
        DIN(146 DOWNTO 145) => HAB_ESCRITA_REG & MUX_ULA_MEM
        DOUT(146 DOWNTO 145)=> aux_idex_wb,
        DOUT(144 DOWNTO 142)=> aux_idex_m,
        DOUT(141 DOWNTO 138)=> aux_idex_ex,
        DOUT(137 DOWNTO 106)=> aux_idex_pc4,
        DOUT(105 DOWNTO 74) => aux_idex_r1,
        DOUT(73 DOWNTO 42)  => aux_idex_r2,
        DOUT(41 DOWNTO 10)  => aux_idex_extend,
        DOUT(9 DOWNTO 5)    => aux_idex_i16,
        DOUT(4 DOWNTO 0)    => aux_idex_i11,

        ENABLE => '1',
        CLK => CLK,
        RST => '0'
    );

    EXMEM           : entity work.registradorGenerico generic map(larguraDados => 107) port map(

    )


	PC				: entity work.registradorGenerico port map(DIN => aux_pc_in, DOUT => aux_pc_out, ENABLE => '1', CLK => CLK, RST => aux_pc_reset);
    memoriaDeInst   : entity work.memoriaDeInst port map(ADDR => to_integer(unsigned(aux_pc_out(31 DOWNTO 2))), CLK => CLK, Q => aux_mem_inst_out);
    bancoReg        : entity work.bancoRegistradores port map(
        HAB_ESCRITA_REG => HAB_ESCRITA_REG, CLK => CLK,
        END1 => aux_ifid_inst(25 DOWNTO 21), END2 => aux_ifid_inst(20 DOWNTO 16), END3 => aux_mux_rt_rd_out,
        DADO_W_REG3 => aux_ula_mem_out,
        DADO_R_REG1 => aux_banco_reg1_out, DADO_R_REG2 => aux_banco_reg2_out
    );

    ula             : entity work.ulaMips port map(
        A => aux_banco_reg1_out, B => aux_mux_rt_imm_out, SEL => aux_op(1 DOWNTO 0), INVERTE_A => aux_op(3), INVERTE_B => aux_op(2), CIN => aux_op(2),
        R => aux_ula_out, ZERO => aux_ula_z
    );
	 
	 
    ucUla           : entity work.ulaUc port map(FUNCT => aux_mem_inst_out(5 DOWNTO 0), ULA_OP => ULA_OP, Q => aux_op);

    somadorPc       : entity work.somador port map(A => FOUR, B => aux_pc_out, Q => aux_som_pc_out);
    somadorBeq      : entity work.somador port map(A => aux_shifter32_out, B => aux_som_pc_out, Q => aux_som_beq_out);

    extensorSinal   : entity work.extensorSinal port map(A => aux_ifid_inst(15 DOWNTO 0), Q => aux_extensor_out); -- entra 16 sai 32

    shifter2_26     : entity work.shifterLeft2 port map(A => "000000" & aux_mem_inst_out(25 DOWNTO 0), Q => aux_shifter26_out);
    shifter2_32     : entity work.shifterLeft2 port map(A => aux_extensor_out, Q => aux_shifter32_out);
    
    muxPc           : entity work.mux2 port map(A => aux_mux_beq_out, B => aux_som_pc_out(31 DOWNTO 28) & aux_shifter26_out(27 DOWNTO 0), SEL => MUX_PC_BEQ_JMP, Q => aux_pc_in);
    muxRtRd         : entity work.mux2 generic map (data_len => 5) port map(A => aux_mem_inst_out(20 DOWNTO 16), B => aux_mem_inst_out(15 DOWNTO 11), SEL => MUX_RT_RD, Q => aux_mux_rt_rd_out);
    muxRtImm        : entity work.mux2 port map(A => aux_banco_reg2_out, B => aux_extensor_out, SEL => MUX_RT_IMM, Q => aux_mux_rt_imm_out);
    muxUlaMem       : entity work.mux2 port map(A => aux_ula_out, B => DATA_MEM_R, SEL => MUX_ULA_MEM, Q => aux_ula_mem_out);
    muxBeq          : entity work.mux2 port map(A => aux_som_pc_out, B => aux_som_beq_out, SEL => BEQ and aux_ula_z, Q => aux_mux_beq_out);
	 
	 
    MEM_OUT <= aux_mem_inst_out;
    DADO_LIDO_1 <= aux_banco_reg1_out;
    DADO_LIDO_2 <= aux_banco_reg2_out;
    AUX_OP_OUT <= aux_op;
    PC_OUT <= aux_pc_out;
	ULA_OUT <= aux_ula_out;
	 
	--CONCERTOS
	INST_OPCODE <= aux_mem_inst_out(31 downto 26);
	DATA_MEM_W  <= aux_banco_reg2_out;
	END_MEM 	 <= aux_ula_out;
	aux_pc_reset <= PC_RESET;
	ZERO_aux <= aux_ula_z;
	SOM_BEQ <= aux_som_beq_out;


end architecture;
