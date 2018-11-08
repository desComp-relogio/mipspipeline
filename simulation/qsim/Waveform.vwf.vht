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
-- Generated on "10/16/2018 14:49:02"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ULA_UC
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ULA_UC_vhd_vec_tst IS
END ULA_UC_vhd_vec_tst;
ARCHITECTURE ULA_UC_arch OF ULA_UC_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL FUNCT : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL Q : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL UC_OUT : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT ULA_UC
	PORT (
	FUNCT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	UC_OUT : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ULA_UC
	PORT MAP (
-- list connections between master ports and signals
	FUNCT => FUNCT,
	Q => Q,
	UC_OUT => UC_OUT
	);
-- FUNCT[5]
t_prcs_FUNCT_5: PROCESS
BEGIN
	FUNCT(5) <= '1';
	WAIT FOR 320000 ps;
	FUNCT(5) <= '0';
WAIT;
END PROCESS t_prcs_FUNCT_5;
-- FUNCT[4]
t_prcs_FUNCT_4: PROCESS
BEGIN
	FUNCT(4) <= '1';
	WAIT FOR 120000 ps;
	FUNCT(4) <= '0';
WAIT;
END PROCESS t_prcs_FUNCT_4;
-- FUNCT[3]
t_prcs_FUNCT_3: PROCESS
BEGIN
	FUNCT(3) <= '1';
	WAIT FOR 120000 ps;
	FUNCT(3) <= '0';
	WAIT FOR 160000 ps;
	FUNCT(3) <= '1';
	WAIT FOR 40000 ps;
	FUNCT(3) <= '0';
WAIT;
END PROCESS t_prcs_FUNCT_3;
-- FUNCT[2]
t_prcs_FUNCT_2: PROCESS
BEGIN
	FUNCT(2) <= '1';
	WAIT FOR 120000 ps;
	FUNCT(2) <= '0';
	WAIT FOR 80000 ps;
	FUNCT(2) <= '1';
	WAIT FOR 80000 ps;
	FUNCT(2) <= '0';
WAIT;
END PROCESS t_prcs_FUNCT_2;
-- FUNCT[1]
t_prcs_FUNCT_1: PROCESS
BEGIN
	FUNCT(1) <= '1';
	WAIT FOR 120000 ps;
	FUNCT(1) <= '0';
	WAIT FOR 40000 ps;
	FUNCT(1) <= '1';
	WAIT FOR 40000 ps;
	FUNCT(1) <= '0';
	WAIT FOR 80000 ps;
	FUNCT(1) <= '1';
	WAIT FOR 40000 ps;
	FUNCT(1) <= '0';
WAIT;
END PROCESS t_prcs_FUNCT_1;
-- FUNCT[0]
t_prcs_FUNCT_0: PROCESS
BEGIN
	FUNCT(0) <= '1';
	WAIT FOR 120000 ps;
	FUNCT(0) <= '0';
	WAIT FOR 120000 ps;
	FUNCT(0) <= '1';
	WAIT FOR 40000 ps;
	FUNCT(0) <= '0';
WAIT;
END PROCESS t_prcs_FUNCT_0;
-- UC_OUT[1]
t_prcs_UC_OUT_1: PROCESS
BEGIN
	UC_OUT(1) <= '0';
	WAIT FOR 80000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 40000 ps;
	UC_OUT(1) <= '0';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '0';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '0';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '0';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '0';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 20000 ps;
	UC_OUT(1) <= '0';
	WAIT FOR 30000 ps;
	UC_OUT(1) <= '1';
	WAIT FOR 70000 ps;
	UC_OUT(1) <= '0';
WAIT;
END PROCESS t_prcs_UC_OUT_1;
-- UC_OUT[0]
t_prcs_UC_OUT_0: PROCESS
BEGIN
	UC_OUT(0) <= '0';
	WAIT FOR 40000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 40000 ps;
	UC_OUT(0) <= '0';
	WAIT FOR 50000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 10000 ps;
	UC_OUT(0) <= '0';
	WAIT FOR 30000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 10000 ps;
	UC_OUT(0) <= '0';
	WAIT FOR 30000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 10000 ps;
	UC_OUT(0) <= '0';
	WAIT FOR 30000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 10000 ps;
	UC_OUT(0) <= '0';
	WAIT FOR 30000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 10000 ps;
	UC_OUT(0) <= '0';
	WAIT FOR 120000 ps;
	UC_OUT(0) <= '1';
	WAIT FOR 40000 ps;
	UC_OUT(0) <= '0';
WAIT;
END PROCESS t_prcs_UC_OUT_0;
END ULA_UC_arch;
