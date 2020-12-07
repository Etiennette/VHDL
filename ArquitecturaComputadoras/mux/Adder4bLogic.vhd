library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity Adder4bLogic is
 port(
  A    : in std_logic_vector(3 downto 0);
  B    : in std_logic_vector(3 downto 0);
  Cin   :  in std_logic;
  Cout : out std_logic;
  R    : out std_logic_vector(7 downto 0)
 );
end Adder4bLogic;

architecture Behavioral of Adder4bLogic is

 COMPONENT Adder1b
 PORT(
  A : IN std_logic;
  B : IN std_logic;
  Cin : IN std_logic;          
  Cout : OUT std_logic;
  S : OUT std_logic
  );
 END COMPONENT;
 
signal C : STD_LOGIC_VECTOR (14 downto 0);
signal Carry : STD_LOGIC_VECTOR (10 downto 0);
signal E : STD_LOGIC_VECTOR (5 downto 0);

 begin
  R(0) <= A(0)and B(0);
 
  C(0) <= A(1)and B(0); 
  C(1) <= A(0)and B(1);
  C(2) <= A(2)and B(0);
  C(3) <= A(1)and B(1);
  C(4) <= A(3)and B(0);
  C(5) <= A(2)and B(1);
  C(6) <= A(3)and B(1);
  C(7) <= A(0)and B(2);
  C(8) <= A(1)and B(2);
  C(9) <= A(2)and B(2);
  C(10) <= A(3)and B(2);
  C(11) <= A(0)and B(3);
  C(12) <= A(1)and B(3);
  C(13) <= A(2)and B(3);
  C(14) <= A(3)and B(3);
  
 U0: Adder1b PORT MAP(
  A => C(1),
  B => C(0),
  Cin => '0',
  Cout => Carry(0),
  S => R(1)
 );
 
 U1: Adder1b PORT MAP(
  A => C(3),
  B => C(2),
  Cin => Carry(0),
  Cout => Carry(1),
  S => E(0)
 );
 
   U2: Adder1b PORT MAP(
  A => C(5),
  B => C(4),
  Cin => Carry(1),
  Cout => Carry(2),
  S => E(1)
 );
 
 U3: Adder1b PORT MAP(
  A => C(6),
  B => '0',
  Cin => Carry(2),
  Cout => Carry(3),
  S => E(2)
 );

 U4: Adder1b PORT MAP(
  A => C(7),
  B => E(0),
  Cin => '0',
  Cout => Carry(4),
  S => R(2)
 );
 
 U5: Adder1b PORT MAP(
  A => C(8),
  B => E(1),
  Cin => Carry(4),
  Cout => Carry(5),
  S => E(3)
 ); 
 
 U6: Adder1b PORT MAP(
  A => C(9),
  B => E(2),
  Cin => Carry(5),
  Cout => Carry(6),
  S => E(4)
 );  

 U7: Adder1b PORT MAP(
  A => C(10),
  B => Carry(3),
  Cin => Carry(6),
  Cout => Carry(7),
  S => E(5)
 );  

 U8: Adder1b PORT MAP(
  A => C(11),
  B => E(3),
  Cin => '0',
  Cout => Carry(8),
  S => R(3)
 );  
 
 U9: Adder1b PORT MAP(
  A => C(12),
  B => E(4),
  Cin => Carry(8),
  Cout => Carry(9),
  S => R(4)
 );  

 U10: Adder1b PORT MAP(
  A => C(13),
  B => E(5),
  Cin => Carry(9),
  Cout => Carry(10),
  S => R(5)
 ); 
 
 U11: Adder1b PORT MAP(
  A => C(14),
  B => Carry(7),
  Cin => Carry(10),
  Cout => R(7),
  S => R(6)
 );  
 
end Behavioral;