library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux4 is
	port (
		SEL : in  STD_LOGIC_VECTOR (1 downto 0);   
		A   : in  STD_LOGIC_VECTOR (31 downto 0);  
		B   : in  STD_LOGIC_VECTOR (31 downto 0);  
		C   : in  STD_LOGIC_VECTOR (31 downto 0);
		D   : in  STD_LOGIC_VECTOR (31 downto 0);  
		Q   : out STD_LOGIC_VECTOR (31 downto 0)
	);                    
end entity;

architecture mux4Arch of mux4 is
begin
with SEL select
    Q <= A when "00",
         B when "01",
         C when "10",
         D when "11",
         (others => '0') when others;

end architecture;