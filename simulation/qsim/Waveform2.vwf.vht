-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/30/2018 19:38:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          mipsFd
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY mipsFd_vhd_vec_tst IS
END mipsFd_vhd_vec_tst;
ARCHITECTURE mipsFd_arch OF mipsFd_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL BEQ : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL DATA_MEM_R : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DATA_MEM_W : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL EN_BUT : STD_LOGIC;
SIGNAL END_MEM : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL HAB_ESCRITA_MEM : STD_LOGIC;
SIGNAL HAB_ESCRITA_REG : STD_LOGIC;
SIGNAL HAB_LEITURA_MEM : STD_LOGIC;
SIGNAL INST_OPCODE : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL MEM_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MUX_PC_BEQ_JMP : STD_LOGIC;
SIGNAL MUX_RT_IMM : STD_LOGIC;
SIGNAL MUX_RT_RD : STD_LOGIC;
SIGNAL MUX_ULA_MEM : STD_LOGIC;
SIGNAL ULA_OP : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ULA_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT mipsFd
	PORT (
	BEQ : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	DATA_MEM_R : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	DATA_MEM_W : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	EN_BUT : IN STD_LOGIC;
	END_MEM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	HAB_ESCRITA_MEM : IN STD_LOGIC;
	HAB_ESCRITA_REG : IN STD_LOGIC;
	HAB_LEITURA_MEM : IN STD_LOGIC;
	INST_OPCODE : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	MEM_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	MUX_PC_BEQ_JMP : IN STD_LOGIC;
	MUX_RT_IMM : IN STD_LOGIC;
	MUX_RT_RD : IN STD_LOGIC;
	MUX_ULA_MEM : IN STD_LOGIC;
	ULA_OP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ULA_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : mipsFd
	PORT MAP (
-- list connections between master ports and signals
	BEQ => BEQ,
	CLK => CLK,
	DATA_MEM_R => DATA_MEM_R,
	DATA_MEM_W => DATA_MEM_W,
	EN_BUT => EN_BUT,
	END_MEM => END_MEM,
	HAB_ESCRITA_MEM => HAB_ESCRITA_MEM,
	HAB_ESCRITA_REG => HAB_ESCRITA_REG,
	HAB_LEITURA_MEM => HAB_LEITURA_MEM,
	INST_OPCODE => INST_OPCODE,
	MEM_OUT => MEM_OUT,
	MUX_PC_BEQ_JMP => MUX_PC_BEQ_JMP,
	MUX_RT_IMM => MUX_RT_IMM,
	MUX_RT_RD => MUX_RT_RD,
	MUX_ULA_MEM => MUX_ULA_MEM,
	ULA_OP => ULA_OP,
	ULA_OUT => ULA_OUT
	);

-- BEQ
t_prcs_BEQ: PROCESS
BEGIN
	BEQ <= '0';
WAIT;
END PROCESS t_prcs_BEQ;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 10000 ps;
	CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;
-- DATA_MEM_R[31]
t_prcs_DATA_MEM_R_31: PROCESS
BEGIN
	DATA_MEM_R(31) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_31;
-- DATA_MEM_R[30]
t_prcs_DATA_MEM_R_30: PROCESS
BEGIN
	DATA_MEM_R(30) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_30;
-- DATA_MEM_R[29]
t_prcs_DATA_MEM_R_29: PROCESS
BEGIN
	DATA_MEM_R(29) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_29;
-- DATA_MEM_R[28]
t_prcs_DATA_MEM_R_28: PROCESS
BEGIN
	DATA_MEM_R(28) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_28;
-- DATA_MEM_R[27]
t_prcs_DATA_MEM_R_27: PROCESS
BEGIN
	DATA_MEM_R(27) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_27;
-- DATA_MEM_R[26]
t_prcs_DATA_MEM_R_26: PROCESS
BEGIN
	DATA_MEM_R(26) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_26;
-- DATA_MEM_R[25]
t_prcs_DATA_MEM_R_25: PROCESS
BEGIN
	DATA_MEM_R(25) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_25;
-- DATA_MEM_R[24]
t_prcs_DATA_MEM_R_24: PROCESS
BEGIN
	DATA_MEM_R(24) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_24;
-- DATA_MEM_R[23]
t_prcs_DATA_MEM_R_23: PROCESS
BEGIN
	DATA_MEM_R(23) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_23;
-- DATA_MEM_R[22]
t_prcs_DATA_MEM_R_22: PROCESS
BEGIN
	DATA_MEM_R(22) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_22;
-- DATA_MEM_R[21]
t_prcs_DATA_MEM_R_21: PROCESS
BEGIN
	DATA_MEM_R(21) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_21;
-- DATA_MEM_R[20]
t_prcs_DATA_MEM_R_20: PROCESS
BEGIN
	DATA_MEM_R(20) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_20;
-- DATA_MEM_R[19]
t_prcs_DATA_MEM_R_19: PROCESS
BEGIN
	DATA_MEM_R(19) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_19;
-- DATA_MEM_R[18]
t_prcs_DATA_MEM_R_18: PROCESS
BEGIN
	DATA_MEM_R(18) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_18;
-- DATA_MEM_R[17]
t_prcs_DATA_MEM_R_17: PROCESS
BEGIN
	DATA_MEM_R(17) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_17;
-- DATA_MEM_R[16]
t_prcs_DATA_MEM_R_16: PROCESS
BEGIN
	DATA_MEM_R(16) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_16;
-- DATA_MEM_R[15]
t_prcs_DATA_MEM_R_15: PROCESS
BEGIN
	DATA_MEM_R(15) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_15;
-- DATA_MEM_R[14]
t_prcs_DATA_MEM_R_14: PROCESS
BEGIN
	DATA_MEM_R(14) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_14;
-- DATA_MEM_R[13]
t_prcs_DATA_MEM_R_13: PROCESS
BEGIN
	DATA_MEM_R(13) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_13;
-- DATA_MEM_R[12]
t_prcs_DATA_MEM_R_12: PROCESS
BEGIN
	DATA_MEM_R(12) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_12;
-- DATA_MEM_R[11]
t_prcs_DATA_MEM_R_11: PROCESS
BEGIN
	DATA_MEM_R(11) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_11;
-- DATA_MEM_R[10]
t_prcs_DATA_MEM_R_10: PROCESS
BEGIN
	DATA_MEM_R(10) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_10;
-- DATA_MEM_R[9]
t_prcs_DATA_MEM_R_9: PROCESS
BEGIN
	DATA_MEM_R(9) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_9;
-- DATA_MEM_R[8]
t_prcs_DATA_MEM_R_8: PROCESS
BEGIN
	DATA_MEM_R(8) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_8;
-- DATA_MEM_R[7]
t_prcs_DATA_MEM_R_7: PROCESS
BEGIN
	DATA_MEM_R(7) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_7;
-- DATA_MEM_R[6]
t_prcs_DATA_MEM_R_6: PROCESS
BEGIN
	DATA_MEM_R(6) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_6;
-- DATA_MEM_R[5]
t_prcs_DATA_MEM_R_5: PROCESS
BEGIN
	DATA_MEM_R(5) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_5;
-- DATA_MEM_R[4]
t_prcs_DATA_MEM_R_4: PROCESS
BEGIN
	DATA_MEM_R(4) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_4;
-- DATA_MEM_R[3]
t_prcs_DATA_MEM_R_3: PROCESS
BEGIN
	DATA_MEM_R(3) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_3;
-- DATA_MEM_R[2]
t_prcs_DATA_MEM_R_2: PROCESS
BEGIN
	DATA_MEM_R(2) <= '0';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_2;
-- DATA_MEM_R[1]
t_prcs_DATA_MEM_R_1: PROCESS
BEGIN
	DATA_MEM_R(1) <= '1';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_1;
-- DATA_MEM_R[0]
t_prcs_DATA_MEM_R_0: PROCESS
BEGIN
	DATA_MEM_R(0) <= '1';
WAIT;
END PROCESS t_prcs_DATA_MEM_R_0;

-- EN_BUT
t_prcs_EN_BUT: PROCESS
BEGIN
	EN_BUT <= '0';
WAIT;
END PROCESS t_prcs_EN_BUT;

-- HAB_ESCRITA_MEM
t_prcs_HAB_ESCRITA_MEM: PROCESS
BEGIN
	HAB_ESCRITA_MEM <= '0';
WAIT;
END PROCESS t_prcs_HAB_ESCRITA_MEM;

-- HAB_ESCRITA_REG
t_prcs_HAB_ESCRITA_REG: PROCESS
BEGIN
	HAB_ESCRITA_REG <= '1';
WAIT;
END PROCESS t_prcs_HAB_ESCRITA_REG;

-- HAB_LEITURA_MEM
t_prcs_HAB_LEITURA_MEM: PROCESS
BEGIN
	HAB_LEITURA_MEM <= '1';
WAIT;
END PROCESS t_prcs_HAB_LEITURA_MEM;

-- MUX_PC_BEQ_JMP
t_prcs_MUX_PC_BEQ_JMP: PROCESS
BEGIN
	MUX_PC_BEQ_JMP <= '0';
WAIT;
END PROCESS t_prcs_MUX_PC_BEQ_JMP;

-- MUX_RT_IMM
t_prcs_MUX_RT_IMM: PROCESS
BEGIN
	MUX_RT_IMM <= '0';
WAIT;
END PROCESS t_prcs_MUX_RT_IMM;

-- MUX_RT_RD
t_prcs_MUX_RT_RD: PROCESS
BEGIN
	MUX_RT_RD <= '1';
WAIT;
END PROCESS t_prcs_MUX_RT_RD;

-- MUX_ULA_MEM
t_prcs_MUX_ULA_MEM: PROCESS
BEGIN
	MUX_ULA_MEM <= '0';
WAIT;
END PROCESS t_prcs_MUX_ULA_MEM;
-- ULA_OP[1]
t_prcs_ULA_OP_1: PROCESS
BEGIN
	ULA_OP(1) <= '0';
WAIT;
END PROCESS t_prcs_ULA_OP_1;
-- ULA_OP[0]
t_prcs_ULA_OP_0: PROCESS
BEGIN
	ULA_OP(0) <= '0';
WAIT;
END PROCESS t_prcs_ULA_OP_0;
END mipsFd_arch;
