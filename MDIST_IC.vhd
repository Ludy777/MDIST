library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;
use ieee.numeric_std.all;




entity MDIST_IC is
	--Generic (--bitsI : integer := 8;									
				--bitsD : integer := 5)
				
					
	Port (	 X : in std_logic_vector(99 downto 0);
				 Y : in std_logic_vector(99 downto 0);
				Dif: out std_logic_vector(1 downto 0); 
				Z : out std_logic_vector (6 downto 0));			
				
				
end MDIST_IC;

	architecture componente of MDIST_IC is
	

signal SubOut : std_logic_vector(1 downto 0);




begin

process (X, Y) 

	
	variable i : integer := 0;
	
begin

	
	for i in 0 to 99 loop
		
			report "SubOut" & integer'image(i) &
           " <= ('" & integer'image(i) & "' & X(" & integer'image(i) &
           ")) - ('" & integer'image(i) & "' & Y(" & integer'image(i) & "));";
	end loop;
	
end process; 


end componente;

