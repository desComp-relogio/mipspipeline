library IEEE;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mipssingle is
	port (
    CLOCK_50 : in STD_LOGIC;
    KEY: in STD_LOGIC_VECTOR(3 DOWNTO 0);
    SW: in STD_LOGIC_VECTOR(17 DOWNTO 0);
	 
    LEDR  : out STD_LOGIC_VECTOR(17 DOWNTO 0) := (others => '0');
    LEDG  : out STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');
	 
    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 downto 0)
  );

end entity;

architecture mipssingleArch of mipssingle is
    signal aux_inst_opcode      : STD_LOGIC_VECTOR(5 downto 0);
    signal aux_ula_op           : STD_LOGIC_VECTOR(1 DOWNTO 0);

    signal aux_mux_pc_beq_jmp   : STD_LOGIC;
    signal aux_mux_rt_rd        : STD_LOGIC;
    signal aux_mux_rt_imm       : STD_LOGIC;
    signal aux_mux_ula_mem      : STD_LOGIC;

    signal aux_hab_escrita_reg  : STD_LOGIC;
    signal aux_hab_leitura_mem  : STD_LOGIC;
    signal aux_hab_escrita_mem  : STD_LOGIC;
    
    signal aux_beq              : STD_LOGIC;
    
    signal aux_end_mem          : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_data_mem_r       : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_data_mem_w       : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_habMEM           : STD_LOGIC;
	 
    signal aux_ula_out  		  : STD_LOGIC_VECTOR(31 downto 0);
    signal aux_mem_out		      : STD_LOGIC_VECTOR(31 downto 0);
    signal aux_op_out_top		  : STD_LOGIC_VECTOR(3 downto 0);
    signal aux_dado_lido_1, aux_dado_lido_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_pc_out 			  : STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal aux_hm				  : STD_LOGIC;
    signal aux_ula_z			  : STD_LOGIC;
    signal aux_som_beq			  : STD_LOGIC_VECTOR(31 downto 0);
	 
	 signal aux_hab_escrita_reg_debug  : STD_LOGIC;

	 signal aux_write_data        : STD_LOGIC_VECTOR(31 DOWNTO 0);

    signal aux_write_register	  : STD_LOGIC_VECTOR(4 downto 0);
	 
	 signal aux_sel_ula_mem			: STD_LOGIC;

    signal aux_hex_0, aux_hex_1, aux_hex_2, aux_hex_3, aux_hex_4, aux_hex_5, aux_hex_6, aux_hex_7 : STD_LOGIC_VECTOR(3 downto 0);
    signal sw_value : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal edge_detector_clk	: STD_LOGIC;
    signal clock                : STD_LOGIC;
	 
    -- eae meu bacano é quarta feira ja? amanha e quarta feira meus bacanos
begin
    edgeDetector: entity work.edgeDetector(bordaSubida) port map(clk => CLOCK_50, entrada => not KEY(0), saida => edge_detector_clk);
    mux_clk: entity work.mux2 generic map(data_len => 1) port map (A(0) => CLOCK_50, B(0) => edge_detector_clk, SEL => SW(16), Q(0) => clock);

    --  freqPisca : entity work.divisorGenerico (divisaoGenerica)  generic map (divisor => 25) --(divisaoGenerica) := 2^divisor  
    sw_value <= SW(3 DOWNTO 0);
    mipsUc      : entity work.mipsUc port map(
        INST_OPCODE => aux_inst_opcode,
        MUX_PC_BEQ_JMP => aux_mux_pc_beq_jmp, MUX_RT_RD => aux_mux_rt_rd,
        MUX_RT_IMM => aux_mux_rt_imm, MUX_ULA_MEM => aux_mux_ula_mem,
        HAB_ESCRITA_REG => aux_hab_escrita_reg,
        HAB_LEITURA_MEM => aux_hab_leitura_mem, HAB_ESCRITA_MEM => aux_hab_escrita_mem,
        BEQ => aux_beq, ULA_OP => aux_ula_op
    );
		  

    mipsFd      : entity work.mipsFd port map(
          -- PORTAS ENTRADA
          CLK             => clock,

          --UNIDADE DE CONTROLE
          MUX_PC_BEQ_JMP        => aux_mux_pc_beq_jmp,
          MUX_RT_RD             => aux_mux_rt_rd,
          HAB_ESCRITA_REG       => aux_hab_escrita_reg,
          HAB_LEITURA_MEM       => aux_hab_leitura_mem,
          HAB_ESCRITA_MEM       => aux_hab_escrita_mem,
          MUX_RT_IMM            => aux_mux_rt_imm,
          ULA_OP                => aux_ula_op,
          MUX_ULA_MEM           => aux_mux_ula_mem,
          BEQ                   => aux_beq,
          
            --OPCODE SAIDA
          INST_OPCODE           => aux_inst_opcode,
  
          --PLACA
          PC_RESET		        => not KEY(3),    
  
          -- DEBUG
          DEBUG_MEM_OUT			=> aux_mem_out,
          DEBUG_DADO_LIDO_1     => aux_dado_lido_1,
          DEBUG_DADO_LIDO_2     => aux_dado_lido_2,
          DEBUG_ULA_OUT      	=> aux_ula_out,
          DEBUG_AUX_OP_OUT		=> aux_op_out_top,
          DEBUG_AUX_HM          => aux_hm,
          DEBUG_ZERO_aux	    => aux_ula_z,
          DEBUG_MEM_W           => aux_data_mem_w,
			 DEBUG_MEM_R			  => aux_data_mem_r,
          DEBUG_DATA_MEM_ADDR   => aux_end_mem,
          DEBUG_PC_OUT          => aux_pc_out,
          DEBUG_PC4_BADD        => aux_som_beq,
			 DEBUG_WRITE_REGISTER  => aux_write_register,
			 DEBUG_HAB_ESCRITA_REG => aux_hab_escrita_reg_debug,
			 DEBUG_WRITE_DATA		  => aux_write_data,
			 DEBUG_SEL_ULA_MEM		=> aux_sel_ula_mem
    );

	
    display0 : entity work.conversorHex7seg
    Port map (saida7seg => HEX0, dadoHex => aux_hex_0);
	 
    display1 : entity work.conversorHex7seg
    Port map (saida7seg => HEX1, dadoHex => aux_hex_1);

    display2 : entity work.conversorHex7seg
    Port map (saida7seg => HEX2, dadoHex => aux_hex_2);

    display3 : entity work.conversorHex7seg
    Port map (saida7seg => HEX3, dadoHex => aux_hex_3);

    display4 : entity work.conversorHex7seg
    Port map (saida7seg => HEX4, dadoHex => aux_hex_4);
    
    display5 : entity work.conversorHex7seg	
    Port map (saida7seg => HEX5, dadoHex => aux_hex_5);

    display6 : entity work.conversorHex7seg
    Port map (saida7seg => HEX6, dadoHex => aux_hex_6);
    
    display7 : entity work.conversorHex7seg
    Port map (saida7seg => HEX7, dadoHex => aux_hex_7);
     
    process(all)
    begin
		  
        case sw_value is
            when "0000" =>
                aux_hex_0 <= aux_mem_out(3 DOWNTO 0);
                aux_hex_1 <= aux_mem_out(7 DOWNTO 4);
                aux_hex_2 <= aux_mem_out(11 DOWNTO 8);		
                aux_hex_3 <= aux_mem_out(15 DOWNTO 12);
                aux_hex_4 <= aux_mem_out(19 DOWNTO 16);	
                aux_hex_5 <= aux_mem_out(23 DOWNTO 20);
                aux_hex_6 <= aux_mem_out(27 DOWNTO 24);
                aux_hex_7 <= aux_mem_out(31 DOWNTO 28);

            when "0001" =>
                aux_hex_0 <= aux_dado_lido_1(3 DOWNTO 0);
                aux_hex_1 <= aux_dado_lido_1(7 DOWNTO 4);
                aux_hex_2 <= aux_dado_lido_1(11 DOWNTO 8);		
                aux_hex_3 <= aux_dado_lido_1(15 DOWNTO 12);
                aux_hex_4 <= aux_dado_lido_1(19 DOWNTO 16);	
                aux_hex_5 <= aux_dado_lido_1(23 DOWNTO 20);
                aux_hex_6 <= aux_dado_lido_1(27 DOWNTO 24);
                aux_hex_7 <= aux_dado_lido_1(31 DOWNTO 28);

            when "0010" =>
                aux_hex_0 <= aux_dado_lido_2(3 DOWNTO 0);
                aux_hex_1 <= aux_dado_lido_2(7 DOWNTO 4);
                aux_hex_2 <= aux_dado_lido_2(11 DOWNTO 8);		
                aux_hex_3 <= aux_dado_lido_2(15 DOWNTO 12);
                aux_hex_4 <= aux_dado_lido_2(19 DOWNTO 16);	
                aux_hex_5 <= aux_dado_lido_2(23 DOWNTO 20);
                aux_hex_6 <= aux_dado_lido_2(27 DOWNTO 24);
                aux_hex_7 <= aux_dado_lido_2(31 DOWNTO 28);

            when "0011" =>
                aux_hex_0 <= aux_ula_out(3 DOWNTO 0);
                aux_hex_1 <= aux_ula_out(7 DOWNTO 4);
                aux_hex_2 <= aux_ula_out(11 DOWNTO 8);		
                aux_hex_3 <= aux_ula_out(15 DOWNTO 12);
                aux_hex_4 <= aux_ula_out(19 DOWNTO 16);	
                aux_hex_5 <= aux_ula_out(23 DOWNTO 20);
                aux_hex_6 <= aux_ula_out(27 DOWNTO 24);
                aux_hex_7 <= aux_ula_out(31 DOWNTO 28);
            
            when "0100" =>
                aux_hex_0 <= aux_op_out_top;
                aux_hex_1 <= "000" & aux_hm;
                aux_hex_2 <= "000" & aux_ula_z;
                aux_hex_3 <= "000" & aux_beq; -- ! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                aux_hex_4 <= "000" & aux_mux_pc_beq_jmp;
                aux_hex_5 <= "000" & aux_hab_escrita_reg_debug;
                aux_hex_6 <= "000" & aux_sel_ula_mem;
                aux_hex_7 <= "0000";

            when "0101" =>
                aux_hex_0 <= aux_data_mem_w(3 DOWNTO 0);
                aux_hex_1 <= aux_data_mem_w(7 DOWNTO 4);
                aux_hex_2 <= aux_data_mem_w(11 DOWNTO 8);		
                aux_hex_3 <= aux_data_mem_w(15 DOWNTO 12);
                aux_hex_4 <= aux_data_mem_w(19 DOWNTO 16);	
                aux_hex_5 <= aux_data_mem_w(23 DOWNTO 20);
                aux_hex_6 <= aux_data_mem_w(27 DOWNTO 24);
                aux_hex_7 <= aux_data_mem_w(31 DOWNTO 28);

            when "0110" =>
                aux_hex_0 <= aux_data_mem_r(3 DOWNTO 0);
                aux_hex_1 <= aux_data_mem_r(7 DOWNTO 4);
                aux_hex_2 <= aux_data_mem_r(11 DOWNTO 8);		
                aux_hex_3 <= aux_data_mem_r(15 DOWNTO 12);
                aux_hex_4 <= aux_data_mem_r(19 DOWNTO 16);	
                aux_hex_5 <= aux_data_mem_r(23 DOWNTO 20);
                aux_hex_6 <= aux_data_mem_r(27 DOWNTO 24);
                aux_hex_7 <= aux_data_mem_r(31 DOWNTO 28);


            when "0111" =>
                aux_hex_0 <= aux_end_mem(3 DOWNTO 0);
                aux_hex_1 <= aux_end_mem(7 DOWNTO 4);
                aux_hex_2 <= aux_end_mem(11 DOWNTO 8);		
                aux_hex_3 <= aux_end_mem(15 DOWNTO 12);
                aux_hex_4 <= aux_end_mem(19 DOWNTO 16);	
                aux_hex_5 <= aux_end_mem(23 DOWNTO 20);
                aux_hex_6 <= aux_end_mem(27 DOWNTO 24);
                aux_hex_7 <= aux_end_mem(31 DOWNTO 28);

            when "1000" =>
                aux_hex_0 <= aux_pc_out(3 DOWNTO 0);
                aux_hex_1 <= aux_pc_out(7 DOWNTO 4);
                aux_hex_2 <= aux_pc_out(11 DOWNTO 8);		
                aux_hex_3 <= aux_pc_out(15 DOWNTO 12);
                aux_hex_4 <= aux_pc_out(19 DOWNTO 16);	
                aux_hex_5 <= aux_pc_out(23 DOWNTO 20);
                aux_hex_6 <= aux_pc_out(27 DOWNTO 24);
                aux_hex_7 <= aux_pc_out(31 DOWNTO 28);
					 
            when "1001" => 
				aux_hex_0 <= aux_som_beq(3 DOWNTO 0);
                aux_hex_1 <= aux_som_beq(7 DOWNTO 4);
                aux_hex_2 <= aux_som_beq(11 DOWNTO 8);		
                aux_hex_3 <= aux_som_beq(15 DOWNTO 12);
                aux_hex_4 <= aux_som_beq(19 DOWNTO 16);	
                aux_hex_5 <= aux_som_beq(23 DOWNTO 20);
                aux_hex_6 <= aux_som_beq(27 DOWNTO 24);
                aux_hex_7 <= aux_som_beq(31 DOWNTO 28);
				
				when "1011" => 
					 aux_hex_0 <= aux_write_register(3 DOWNTO 0);
                aux_hex_1 <= "000" & aux_write_register(4);
                aux_hex_2 <= "0000";		
                aux_hex_3 <= "0000";
                aux_hex_4 <= "0000";
                aux_hex_5 <= "0000";
                aux_hex_6 <= "0000";
                aux_hex_7 <= "0000";
					 
				when "1101" => 
                aux_hex_0 <= aux_write_data(3 DOWNTO 0);
                aux_hex_1 <= aux_write_data(7 DOWNTO 4);
                aux_hex_2 <= aux_write_data(11 DOWNTO 8);		
                aux_hex_3 <= aux_write_data(15 DOWNTO 12);
                aux_hex_4 <= aux_write_data(19 DOWNTO 16);	
                aux_hex_5 <= aux_write_data(23 DOWNTO 20);
                aux_hex_6 <= aux_write_data(27 DOWNTO 24);
                aux_hex_7 <= aux_write_data(31 DOWNTO 28);
					 
            when others =>
                aux_hex_0 <= "1111";
                aux_hex_1 <= "1111";
                aux_hex_2 <= "1111";
                aux_hex_3 <= "1111";
                aux_hex_4 <= "1111";
                aux_hex_5 <= "1111";
                aux_hex_6 <= "1111";
                aux_hex_7 <= "1111";
			end case;
			
--			if(RISING_EDGE(CLOCK_50))
--				
--			end if;
    end process; 	
	
    -- Chave: tristate
    -- LED: FLIP FLOP
end architecture;
