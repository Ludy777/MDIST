library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;
use ieee.numeric_std.all;


entity IC is
				
	Port (
				X,Y: std_logic_vector (99 downto 0); 
				Dif: std_logic_vector (1 downto 0); 
				Z : out std_logic_vector (6 downto 0));			
				
				
end IC;

	architecture componente of IC is
	

signal SubOut: std_logic_vector(1 downto 0);




begin

process (X, Y) 

	
	variable i : integer := 0;
	
	begin

	for i in 0 to 99 loop
	
		
		SubOut(i) <= ('0'&X(i)) - ('0'&Y(i));
		
	end loop;

	
end process;


process(Dif)

	variable i : integer := 0;
	
	begin
	
	for i in 0 to 99 loop

	Dif(i) <= SubOut(i);
	
	end loop;
	
end process;

	
--process(Z)

   -- variable soma : unsigned(1 downto 0);
	 
--begin

    -- cálculo combinacional
	 
    --soma <= (others => '0'); -- inicializa
	 
    --process(SubOut)
	 
      --  variable temp : unsigned(1 downto 0);
		  
    --begin
	 
        --temp := (others => '0');
		  
        --for i in 0 to 98 loop
		  
           -- temp := temp + unsigned(abs(SubOut(i)));  -- acumula valores absolutos
				
        --end loop;
		  
       -- soma <= temp;
		  
    

    --Z <= std_logic_vector(soma);  -- saída combinacional

--end process;

	

end componente;