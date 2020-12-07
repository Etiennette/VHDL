library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder1b is
port(
 A,B,Cin : in std_logic;
 S,Cout  : out std_logic);
end Adder1b;

architecture Behavioral of Adder1b is

begin

Cout <= (B and Cin) or (A and Cin) or (A and B);
S <= A xor (B xor Cin);
end Behavioral;