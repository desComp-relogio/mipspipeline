library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux32 is
    port (
        IN_0, IN_1, IN_2, IN_3, IN_4, IN_5, IN_6, IN_7, IN_8, IN_9, IN_10, IN_11, IN_12, IN_13, IN_14, 
            IN_15, IN_16, IN_17, IN_18, IN_19, IN_20, IN_21, IN_22, IN_23, IN_24, IN_25, IN_26, IN_27, IN_28, IN_29, IN_30, IN_31: in std_logic_vector (31 downto 0);
		SEL: in std_logic_vector (4 downto 0);
		Q_OUT: out std_logic_vector(31 downto 0)
    );
	
end mux32;   

architecture mux32Arch of mux32 is
begin

    Q_OUT <= 
		IN_0  when SEL = "00000" else
		IN_1  when SEL = "00001" else
		IN_2  when SEL = "00010" else
		IN_3  when SEL = "00011" else
		IN_4  when SEL = "00100" else
		IN_5  when SEL = "00101" else
		IN_6  when SEL = "00110" else
		IN_7  when SEL = "00111" else
		IN_8  when SEL = "01000" else
		IN_9  when SEL = "01001" else
		IN_10 when SEL = "01010" else
		IN_11 when SEL = "01011" else
		IN_12 when SEL = "01100" else
		IN_13 when SEL = "01101" else
		IN_14 when SEL = "01110" else
		IN_15 when SEL = "01111" else
		IN_16 when SEL = "10000" else
		IN_17 when SEL = "10001" else
		IN_18 when SEL = "10010" else
		IN_10 when SEL = "10011" else
		IN_20 when SEL = "10100" else
		IN_21 when SEL = "10101" else
		IN_22 when SEL = "10110" else
		IN_23 when SEL = "10111" else
		IN_24 when SEL = "11000" else
		IN_25 when SEL = "11001" else
		IN_26 when SEL = "11010" else
		IN_27 when SEL = "11011" else
		IN_28 when SEL = "11100" else
		IN_29 when SEL = "11101" else
		IN_30 when SEL = "11110" else
		IN_31;
		
end mux32Arch;