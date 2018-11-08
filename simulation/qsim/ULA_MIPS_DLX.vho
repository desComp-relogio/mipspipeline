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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "10/16/2018 14:49:07"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ULA_UC IS
    PORT (
	FUNCT : IN std_logic_vector(5 DOWNTO 0);
	UC_OUT : IN std_logic_vector(1 DOWNTO 0);
	Q : OUT std_logic_vector(3 DOWNTO 0)
	);
END ULA_UC;

ARCHITECTURE structure OF ULA_UC IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_FUNCT : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_UC_OUT : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_Q : std_logic_vector(3 DOWNTO 0);
SIGNAL \FUNCT[4]~input_o\ : std_logic;
SIGNAL \FUNCT[5]~input_o\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \Q[3]~output_o\ : std_logic;
SIGNAL \UC_OUT[1]~input_o\ : std_logic;
SIGNAL \FUNCT[0]~input_o\ : std_logic;
SIGNAL \FUNCT[1]~input_o\ : std_logic;
SIGNAL \FUNCT[2]~input_o\ : std_logic;
SIGNAL \FUNCT[3]~input_o\ : std_logic;
SIGNAL \outAux~0_combout\ : std_logic;
SIGNAL \outAux~1_combout\ : std_logic;
SIGNAL \UC_OUT[0]~input_o\ : std_logic;
SIGNAL \outAux~2_combout\ : std_logic;
SIGNAL \ALT_INV_UC_OUT[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_FUNCT[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_FUNCT[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_FUNCT[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_FUNCT[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_UC_OUT[0]~input_o\ : std_logic;

BEGIN

ww_FUNCT <= FUNCT;
ww_UC_OUT <= UC_OUT;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_UC_OUT[1]~input_o\ <= NOT \UC_OUT[1]~input_o\;
\ALT_INV_FUNCT[0]~input_o\ <= NOT \FUNCT[0]~input_o\;
\ALT_INV_FUNCT[1]~input_o\ <= NOT \FUNCT[1]~input_o\;
\ALT_INV_FUNCT[2]~input_o\ <= NOT \FUNCT[2]~input_o\;
\ALT_INV_FUNCT[3]~input_o\ <= NOT \FUNCT[3]~input_o\;
\ALT_INV_UC_OUT[0]~input_o\ <= NOT \UC_OUT[0]~input_o\;

\Q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \outAux~0_combout\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

\Q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \outAux~1_combout\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

\Q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \outAux~2_combout\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

\Q[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Q[3]~output_o\);

\UC_OUT[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_UC_OUT(1),
	o => \UC_OUT[1]~input_o\);

\FUNCT[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FUNCT(0),
	o => \FUNCT[0]~input_o\);

\FUNCT[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FUNCT(1),
	o => \FUNCT[1]~input_o\);

\FUNCT[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FUNCT(2),
	o => \FUNCT[2]~input_o\);

\FUNCT[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FUNCT(3),
	o => \FUNCT[3]~input_o\);

\outAux~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \outAux~0_combout\ = ( \FUNCT[3]~input_o\ & ( (\UC_OUT[1]~input_o\ & (!\FUNCT[0]~input_o\ & (\FUNCT[1]~input_o\ & !\FUNCT[2]~input_o\))) ) ) # ( !\FUNCT[3]~input_o\ & ( (\UC_OUT[1]~input_o\ & (\FUNCT[0]~input_o\ & (!\FUNCT[1]~input_o\ & 
-- \FUNCT[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000001000000000000000000000100000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_UC_OUT[1]~input_o\,
	datab => \ALT_INV_FUNCT[0]~input_o\,
	datac => \ALT_INV_FUNCT[1]~input_o\,
	datad => \ALT_INV_FUNCT[2]~input_o\,
	datae => \ALT_INV_FUNCT[3]~input_o\,
	combout => \outAux~0_combout\);

\outAux~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \outAux~1_combout\ = (!\UC_OUT[1]~input_o\) # ((!\FUNCT[2]~input_o\) # (\FUNCT[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111111101111111011111110111111101111111011111110111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_UC_OUT[1]~input_o\,
	datab => \ALT_INV_FUNCT[2]~input_o\,
	datac => \ALT_INV_FUNCT[3]~input_o\,
	combout => \outAux~1_combout\);

\UC_OUT[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_UC_OUT(0),
	o => \UC_OUT[0]~input_o\);

\outAux~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \outAux~2_combout\ = ((\UC_OUT[1]~input_o\ & \FUNCT[1]~input_o\)) # (\UC_OUT[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111100011111000111110001111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_UC_OUT[1]~input_o\,
	datab => \ALT_INV_FUNCT[1]~input_o\,
	datac => \ALT_INV_UC_OUT[0]~input_o\,
	combout => \outAux~2_combout\);

\FUNCT[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FUNCT(4),
	o => \FUNCT[4]~input_o\);

\FUNCT[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FUNCT(5),
	o => \FUNCT[5]~input_o\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;

ww_Q(3) <= \Q[3]~output_o\;
END structure;


