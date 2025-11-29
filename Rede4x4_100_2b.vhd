---------------------------------------------------------------------------------------------------
-- 
---------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package SOM_pkg is
	type vetor_pesos is array (99 downto 0) of std_logic_vector (1 downto 0);
	type matriz_pesos is array(1 to 4) of vetor_pesos; -- ALTERADO
	type vetor_dif is array   (99 downto 0) of std_logic_vector (1 downto 0);
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.SOM_pkg.ALL;

entity Rede4x4_100_2b is
	Generic (bitsI : integer := 100;						-- dimens�o do vetor de entrada
				bitsD : integer := 8;						-- dimens�o da maior dist�ncia de manhattan
				bitsN : integer := 4);						-- dimens�o do maior valor de vizinhan�a
	Port 	  (X : in vetor_pesos;                          -- 
				Clock : in  std_logic;						-- Usado como reset do sistema a cada itera��o
				MatrizdePesos : out matriz_pesos);		    -- Sa�da: vetores de pesos de cada neur�nio
end Rede4x4_100_2b;														

architecture Behavioral of Rede4x4_100_2b is

component Neuron
	Port (Data : in vetor_pesos; 				 -- Entrada de dados 
			R : in  std_logic;													 -- Reset
			VectorIn  : in  vetor_pesos;		 -- Peso do neur�nio
			VectorOut : out vetor_pesos;		 -- Peso ajustado do neur�nio
			N, S, E, W : in std_logic_vector (bitsD+bitsN-1 downto 0);-- Entradas de dist�ncia e vizinhan�a
			NOut : out std_logic_vector (bitsD+bitsN-1 downto 0));	 -- Sa�das de dist�ncia e vizinhan�a
end component;

-- Sinais de interligação entre os neur�nios
signal N1, N2, N3, N4 : std_logic_vector (bitsD+bitsN-1 downto 0);-- := (others=>'0'); -- MUDEI AQUI


-- Vetores iniciais dos neurônios
signal peso_in : matriz_pesos := (
("00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00"),
("00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01"),
("01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00","00"),
("01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01","01")
);


-- Sinais de interligação de pesos
signal peso_out : matriz_pesos;

constant endmap : std_logic_vector (bitsD+bitsN-1 downto 0) := (others => '1');
											-- valor de interligaçãoo de neurônios na borda do mapa

begin

-- Declaração da rede de interligaçãoo dos neurônios
Neuron1: Neuron port map(Data => X, VectorIn => peso_in(1), R => Clock, VectorOut => peso_out(1),
								 N => endmap, S => N3,     E => N2,     W => endmap, NOut => N1);

Neuron2: Neuron port map(Data => X, VectorIn => peso_in(2), R => Clock, VectorOut => peso_out(2),
								 N => endmap, S => N4,     E => endmap,     W => N1,     NOut => N2);

Neuron3: Neuron port map(Data => X, VectorIn => peso_in(3), R => Clock, VectorOut => peso_out(3),
								 N => N1, S => endmap,     E => N4,		 W => endmap,     NOut => N3);

Neuron4: Neuron port map(Data => X, VectorIn => peso_in(4), R => Clock, VectorOut => peso_out(4),
								 N => N2, S => endmap,     E => endmap,     W => N3,     NOut => N4);


-- o processo de atualizaçãoo de pesos ocorre na borda de subida do clock
process (Clock) begin
	if (Clock'event and Clock = '1') then
		peso_in <= peso_out;
	end if;
end process;

-- Composiçao das saídas
MatrizdePesos <= peso_out;
end Behavioral;