library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu is
 Port ( 
		 Ainp : in STD_LOGIC_VECTOR(3 downto 0);
		 Binp : in STD_LOGIC_VECTOR(3 downto 0);
		 Cin : in std_logic;
		 ope : in STD_LOGIC_VECTOR (1 downto 0); 
		 Sal : out signed(4 downto 0)
		 );
end alu;


architecture Behavioral of alu is
	component alu1 is
	 Port(	 inputa : in std_logic;
			 inputb : in std_logic;	
			 cin : in std_logic;  
			 sele1 : in std_logic;
			 sele2 : in std_logic;
			 outalu : out std_logic; 
			 cout :out std_logic);
	end component;

signal C:std_logic_vector(2 downto 0);
begin

   FC0: alu1 port map(Ainp(0),Binp(0),Cin,ope(0),ope(1),Sal(0),C(0));
   FC1: alu1 port map(Ainp(1),Binp(1),C(0),ope(0),ope(1),Sal(1),C(1));
   FC2: alu1 port map(Ainp(2),Binp(2),C(1),ope(0),ope(1),Sal(2),C(2));
   FC3: alu1 port map(Ainp(3),Binp(3),C(2),ope(0),ope(1),Sal(3),Sal(4));
   
 
 
end Behavioral;
	