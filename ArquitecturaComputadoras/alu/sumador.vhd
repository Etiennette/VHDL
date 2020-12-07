library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sumador is	
	port(
	a,b,cin:in std_logic;
	s,cout:out std_logic
	);
end sumador;

architecture rtl of sumador is 
signal wire:std_logic_vector(2 downto 0);
begin		 
	wire(0) <=a xor b;
	s <= wire(0) xor cin;
	wire(1) <= wire(0) and cin;
	wire(2) <= a and b;
	cout <= wire(1) or wire(2);

end rtl;
