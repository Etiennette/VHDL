library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu1 is
 Port(	 inputa : in std_logic;
		 inputb : in std_logic;	
		 cin : in std_logic;  
		 sele1 : in std_logic;
		 sele2 : in std_logic;
		 outalu : out std_logic; 
		 cout :out std_logic
		 );
end alu1;


architecture Behavioral of alu1 is
signal wire:std_logic_vector(6 downto 0);

component mux is
	port(
	     A,B,C,D,Car1,Car2 : STD_LOGIC;
	     Sel0,Sel1: in STD_LOGIC;
	     out1,outCar: out STD_LOGIC
		 );			 
end component;	 

component sumador is
	port(
		a,b,cin:in std_logic;
		s,cout:out std_logic
		);
end component;	   

begin
	wire(0) <=inputa and inputb;  --op and
	wire(1) <=inputa or inputb;	--op or
	wire(2) <=not inputb;	  --negamos B para la resta
	FB0: sumador port map(inputa,inputb,cin,wire(5),wire(6));  --suma
	FB1: sumador port map(inputa,wire(2),cin,wire(3),wire(4)); --resta
	FB2: mux port map(wire(0),wire(1),wire(5),wire(3),wire(6),wire(4),sele1,sele2,outalu,cout);
   
end Behavioral;
	