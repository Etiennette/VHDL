library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux  is
 port(
     A,B,C,D,Car1,Car2 : STD_LOGIC;
     Sel0,Sel1: in STD_LOGIC;
     out1,outCar: out STD_LOGIC);
end mux ;
 
architecture bhv of mux  is
begin
process (A,B,C,D,Car1,Car2,Sel0,Sel1) is
begin
  if (Sel0 ='0' and Sel1 = '0') then
      out1 <= A;
  elsif (Sel0 ='1' and Sel1 = '0') then
      out1 <= B;
  elsif (Sel0 ='0' and Sel1 = '1') then
      out1 <= C;
	  outCar <= Car1;
  else
      out1 <= D;
	  outCar <= Car2;
  end if;
 
end process;
end bhv;