library IEEE;
use IEEE.std_logic_1164.all;

entity sumador_4bits is
	port(A,B: in std_logic_vector(3 downto 0);
	--Cin:in std_logic;
	S: out std_logic_vector(4 downto 0));
end sumador_4bits;

architecture behavioral of sumador_4bits is
component sumador is   
	port(
	a,b,cin:in std_logic; 
	s,cout:out std_logic);	   
end component;
signal C: std_logic_vector(2 downto 0);	
begin
	
	FA0: sumador port map(A(0),B(0),'0',S(0),C(0));
	FA1: sumador port map(A(1),B(1),C(0),S(1),C(1));
	FA2: sumador port map(A(2),B(2),C(1),S(2),C(2));
	FA3: sumador port map(A(3),B(3),C(2),S(3),S(4));	
	end behavioral; 
	