------------------------------------------------------------------------------------
-- Circuito fixo para c�lculo da dist�ncia de Manhattan entre dois vetores de 8 bits
-- Cada vetor de entrada possui duas coordenadas de 4 bits cada (1 sinal + 3 bits)
------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;
---código com variáveis escritos manualmente
entity IC_SOM is
--	Generic (bitsI : integer := 8;									-- dimens�o do vetor de entrada
--				bitsD : integer := 5);									-- dimens�o da maior dist�ncia de manhattan
	Port 	  (X, Y : in std_logic_vector (99 downto 0);			-- Vetores de entrada
				Dif0, Dif1, Dif2, Dif3, Dif4, Dif5, Dif6, Dif7, Dif8, Dif9,
				Dif10, Dif11, Dif12, Dif13, Dif14, Dif15, Dif16, Dif17, Dif18, Dif19,
				Dif20, Dif21, Dif22, Dif23, Dif24, Dif25, Dif26, Dif27, Dif28, Dif29,
				Dif30, Dif31, Dif32, Dif33, Dif34, Dif35, Dif36, Dif37, Dif38, Dif39,
				Dif40, Dif41, Dif42, Dif43, Dif44, Dif45, Dif46, Dif47, Dif48, Dif49,
				Dif50, Dif51, Dif52, Dif53, Dif54, Dif55, Dif56, Dif57, Dif58, Dif59,
				Dif60, Dif61, Dif62, Dif63, Dif64, Dif65, Dif66, Dif67, Dif68, Dif69,
				Dif70, Dif71, Dif72, Dif73, Dif74, Dif75, Dif76, Dif77, Dif78, Dif79,
				Dif80, Dif81, Dif82, Dif83, Dif84, Dif85, Dif86, Dif87, Dif88, Dif89,
				Dif90, Dif91, Dif92, Dif93, Dif94, Dif95, Dif96, Dif97, Dif98, Dif99   : out std_logic_vector (1 downto 0);	-- Valores de subtra��o de cada dimens�o
				Z : out std_logic_vector (6 downto 0));			-- Valor de sa�da de dist�ncia de manhattan
end IC_SOM;

	architecture componente of IC_SOM is

-- O circuito faz a subtra��o entre cada coordenada dos vetores de entrada e a sa�da
-- do resultado � selecionado por 1 Mux: caso o MSB seja '0' o n�mero � positivo e �
-- copiado para a sa�da, caso seja '1' o Mux seleciona a outra entrada, na qual o 
-- n�mero passou por um circuito de convers�o de negativo para positivo em complemento
-- de dois. Por fim, os valores de dist�ncia de cada coordenada s�o somados.

signal SubOut0, SubOut1, SubOut2, SubOut3, SubOut4, SubOut5, SubOut6, SubOut7, SubOut8, SubOut9,
       SubOut10, SubOut11, SubOut12, SubOut13, SubOut14, SubOut15, SubOut16, SubOut17, SubOut18, SubOut19,
       SubOut20, SubOut21, SubOut22, SubOut23, SubOut24, SubOut25, SubOut26, SubOut27, SubOut28, SubOut29,
       SubOut30, SubOut31, SubOut32, SubOut33, SubOut34, SubOut35, SubOut36, SubOut37, SubOut38, SubOut39,
       SubOut40, SubOut41, SubOut42, SubOut43, SubOut44, SubOut45, SubOut46, SubOut47, SubOut48, SubOut49,
       SubOut50, SubOut51, SubOut52, SubOut53, SubOut54, SubOut55, SubOut56, SubOut57, SubOut58, SubOut59,
       SubOut60, SubOut61, SubOut62, SubOut63, SubOut64, SubOut65, SubOut66, SubOut67, SubOut68, SubOut69,
       SubOut70, SubOut71, SubOut72, SubOut73, SubOut74, SubOut75, SubOut76, SubOut77, SubOut78, SubOut79,
       SubOut80, SubOut81, SubOut82, SubOut83, SubOut84, SubOut85, SubOut86, SubOut87, SubOut88, SubOut89,
       SubOut90, SubOut91, SubOut92, SubOut93, SubOut94, SubOut95, SubOut96, SubOut97, SubOut98, SubOut99 : std_logic_vector(1 downto 0);

begin
process (X, Y) begin
	SubOut0<=('0'&X(0))-('0'&Y(0));
	SubOut1<=('0'&X(1))-('0'&Y(1));
	SubOut2<=('0'&X(2))-('0'&Y(2));
	SubOut3<=('0'&X(3))-('0'&Y(3));
	SubOut4<=('0'&X(4))-('0'&Y(4));
	SubOut5<=('0'&X(5))-('0'&Y(5));
	SubOut6<=('0'&X(6))-('0'&Y(6));
	SubOut7<=('0'&X(7))-('0'&Y(7));
	SubOut8<=('0'&X(8))-('0'&Y(8));
	SubOut9<=('0'&X(9))-('0'&Y(9));
	SubOut10<=('0'&X(10))-('0'&Y(10));
	SubOut11<=('0'&X(11))-('0'&Y(11));
	SubOut12<=('0'&X(12))-('0'&Y(12));
	SubOut13<=('0'&X(13))-('0'&Y(13));
	SubOut14<=('0'&X(14))-('0'&Y(14));
	SubOut15<=('0'&X(15))-('0'&Y(15));
	SubOut16<=('0'&X(16))-('0'&Y(16));
	SubOut17<=('0'&X(17))-('0'&Y(17));
	SubOut18<=('0'&X(18))-('0'&Y(18));
	SubOut19<=('0'&X(19))-('0'&Y(19));
	SubOut20<=('0'&X(20))-('0'&Y(20));
	SubOut21<=('0'&X(21))-('0'&Y(21));
	SubOut22<=('0'&X(22))-('0'&Y(22));
	SubOut23<=('0'&X(23))-('0'&Y(23));
	SubOut24<=('0'&X(24))-('0'&Y(24));
	SubOut25<=('0'&X(25))-('0'&Y(25));
	SubOut26<=('0'&X(26))-('0'&Y(26));
	SubOut27<=('0'&X(27))-('0'&Y(27));
	SubOut28<=('0'&X(28))-('0'&Y(28));
	SubOut29<=('0'&X(29))-('0'&Y(29));
	SubOut30<=('0'&X(30))-('0'&Y(30));
	SubOut31<=('0'&X(31))-('0'&Y(31));
	SubOut32<=('0'&X(32))-('0'&Y(32));
	SubOut33<=('0'&X(33))-('0'&Y(33));
	SubOut34<=('0'&X(34))-('0'&Y(34));
	SubOut35<=('0'&X(35))-('0'&Y(35));
	SubOut36<=('0'&X(36))-('0'&Y(36));
	SubOut37<=('0'&X(37))-('0'&Y(37));
	SubOut38<=('0'&X(38))-('0'&Y(38));
	SubOut39<=('0'&X(39))-('0'&Y(39));
	SubOut40<=('0'&X(40))-('0'&Y(40));
	SubOut41<=('0'&X(41))-('0'&Y(41));
	SubOut42<=('0'&X(42))-('0'&Y(42));
	SubOut43<=('0'&X(43))-('0'&Y(43));
	SubOut44<=('0'&X(44))-('0'&Y(44));
	SubOut45<=('0'&X(45))-('0'&Y(45));
	SubOut46<=('0'&X(46))-('0'&Y(46));
	SubOut47<=('0'&X(47))-('0'&Y(47));
	SubOut48<=('0'&X(48))-('0'&Y(48));
	SubOut49<=('0'&X(49))-('0'&Y(49));
	SubOut50<=('0'&X(50))-('0'&Y(50));
	SubOut51<=('0'&X(51))-('0'&Y(51));
	SubOut52<=('0'&X(52))-('0'&Y(52));
	SubOut53<=('0'&X(53))-('0'&Y(53));
	SubOut54<=('0'&X(54))-('0'&Y(54));
	SubOut55<=('0'&X(55))-('0'&Y(55));
	SubOut56<=('0'&X(56))-('0'&Y(56));
	SubOut57<=('0'&X(57))-('0'&Y(57));
	SubOut58<=('0'&X(58))-('0'&Y(58));
	SubOut59<=('0'&X(59))-('0'&Y(59));
	SubOut60<=('0'&X(60))-('0'&Y(60));
	SubOut61<=('0'&X(61))-('0'&Y(61));
	SubOut62<=('0'&X(62))-('0'&Y(62));
	SubOut63<=('0'&X(63))-('0'&Y(63));
	SubOut64<=('0'&X(64))-('0'&Y(64));
	SubOut65<=('0'&X(65))-('0'&Y(65));
	SubOut66<=('0'&X(66))-('0'&Y(66));
	SubOut67<=('0'&X(67))-('0'&Y(67));
	SubOut68<=('0'&X(68))-('0'&Y(68));
	SubOut69<=('0'&X(69))-('0'&Y(69));
	SubOut70<=('0'&X(70))-('0'&Y(70));
	SubOut71<=('0'&X(71))-('0'&Y(71));
	SubOut72<=('0'&X(72))-('0'&Y(72));
	SubOut73<=('0'&X(73))-('0'&Y(73));
	SubOut74<=('0'&X(74))-('0'&Y(74));
	SubOut75<=('0'&X(75))-('0'&Y(75));
	SubOut76<=('0'&X(76))-('0'&Y(76));
	SubOut77<=('0'&X(77))-('0'&Y(77));
	SubOut78<=('0'&X(78))-('0'&Y(78));
	SubOut79<=('0'&X(79))-('0'&Y(79));
	SubOut80<=('0'&X(80))-('0'&Y(80));
	SubOut81<=('0'&X(81))-('0'&Y(81));
	SubOut82<=('0'&X(82))-('0'&Y(82));
	SubOut83<=('0'&X(83))-('0'&Y(83));
	SubOut84<=('0'&X(84))-('0'&Y(84));
	SubOut85<=('0'&X(85))-('0'&Y(85));
	SubOut86<=('0'&X(86))-('0'&Y(86));
	SubOut87<=('0'&X(87))-('0'&Y(87));
	SubOut88<=('0'&X(88))-('0'&Y(88));
	SubOut89<=('0'&X(89))-('0'&Y(89));
	SubOut90<=('0'&X(90))-('0'&Y(90));
	SubOut91<=('0'&X(91))-('0'&Y(91));
	SubOut92<=('0'&X(92))-('0'&Y(92));
	SubOut93<=('0'&X(93))-('0'&Y(93));
	SubOut94<=('0'&X(94))-('0'&Y(94));
	SubOut95<=('0'&X(95))-('0'&Y(95));
	SubOut96<=('0'&X(96))-('0'&Y(96));
	SubOut97<=('0'&X(97))-('0'&Y(97));
	SubOut98<=('0'&X(98))-('0'&Y(98));
	SubOut99<=('0'&X(99))-('0'&Y(99));
	
end process;                              

	Dif0<=SubOut0; Dif1<=SubOut1; Dif2<=SubOut2; Dif3<=SubOut3; Dif4<=SubOut4; Dif5<=SubOut5; Dif6<=SubOut6; Dif7<=SubOut7; Dif8<=SubOut8; Dif9<=SubOut9;
	Dif10<=SubOut10; Dif11<=SubOut11; Dif12<=SubOut12; Dif13<=SubOut13; Dif14<=SubOut14; Dif15<=SubOut15; Dif16<=SubOut16; Dif17<=SubOut17; Dif18<=SubOut18; Dif19<=SubOut19;
	Dif20<=SubOut20; Dif21<=SubOut21; Dif22<=SubOut22; Dif23<=SubOut23; Dif24<=SubOut24; Dif25<=SubOut25; Dif26<=SubOut26; Dif27<=SubOut27; Dif28<=SubOut28; Dif29<=SubOut29;
	Dif30<=SubOut30; Dif31<=SubOut31; Dif32<=SubOut32; Dif33<=SubOut33; Dif34<=SubOut34; Dif35<=SubOut35; Dif36<=SubOut36; Dif37<=SubOut37; Dif38<=SubOut38; Dif39<=SubOut39;
	Dif40<=SubOut40; Dif41<=SubOut41; Dif42<=SubOut42; Dif43<=SubOut43; Dif44<=SubOut44; Dif45<=SubOut45; Dif46<=SubOut46; Dif47<=SubOut47; Dif48<=SubOut48; Dif49<=SubOut49;
	Dif50<=SubOut50; Dif51<=SubOut51; Dif52<=SubOut52; Dif53<=SubOut53; Dif54<=SubOut54; Dif55<=SubOut55; Dif56<=SubOut56; Dif57<=SubOut57; Dif58<=SubOut58; Dif59<=SubOut59;
	Dif60<=SubOut60; Dif61<=SubOut61; Dif62<=SubOut62; Dif63<=SubOut63; Dif64<=SubOut64; Dif65<=SubOut65; Dif66<=SubOut66; Dif67<=SubOut67; Dif68<=SubOut68; Dif69<=SubOut69;
	Dif70<=SubOut70; Dif71<=SubOut71; Dif72<=SubOut72; Dif73<=SubOut73; Dif74<=SubOut74; Dif75<=SubOut75; Dif76<=SubOut76; Dif77<=SubOut77; Dif78<=SubOut78; Dif79<=SubOut79;
	Dif80<=SubOut80; Dif81<=SubOut81; Dif82<=SubOut82; Dif83<=SubOut83; Dif84<=SubOut84; Dif85<=SubOut85; Dif86<=SubOut86; Dif87<=SubOut87; Dif88<=SubOut88; Dif89<=SubOut89;
	Dif90<=SubOut90; Dif91<=SubOut91; Dif92<=SubOut92; Dif93<=SubOut93; Dif94<=SubOut94; Dif95<=SubOut95; Dif96<=SubOut96; Dif97<=SubOut97; Dif98<=SubOut98; Dif99<=SubOut99;

	Z <= ("00000"&abs(SubOut0)) + ("00000"&abs(SubOut1)) + ("00000"&abs(SubOut2)) + ("00000"&abs(SubOut3)) + ("00000"&abs(SubOut4)) +
     ("00000"&abs(SubOut5)) + ("00000"&abs(SubOut6)) + ("00000"&abs(SubOut7)) + ("00000"&abs(SubOut8)) + ("00000"&abs(SubOut9)) +
     ("00000"&abs(SubOut10)) + ("00000"&abs(SubOut11)) + ("00000"&abs(SubOut12)) + ("00000"&abs(SubOut13)) + ("00000"&abs(SubOut14)) +
     ("00000"&abs(SubOut15)) + ("00000"&abs(SubOut16)) + ("00000"&abs(SubOut17)) + ("00000"&abs(SubOut18)) + ("00000"&abs(SubOut19)) +
     ("00000"&abs(SubOut20)) + ("00000"&abs(SubOut21)) + ("00000"&abs(SubOut22)) + ("00000"&abs(SubOut23)) + ("00000"&abs(SubOut24)) +
     ("00000"&abs(SubOut25)) + ("00000"&abs(SubOut26)) + ("00000"&abs(SubOut27)) + ("00000"&abs(SubOut28)) + ("00000"&abs(SubOut29)) +
     ("00000"&abs(SubOut30)) + ("00000"&abs(SubOut31)) + ("00000"&abs(SubOut32)) + ("00000"&abs(SubOut33)) + ("00000"&abs(SubOut34)) +
     ("00000"&abs(SubOut35)) + ("00000"&abs(SubOut36)) + ("00000"&abs(SubOut37)) + ("00000"&abs(SubOut38)) + ("00000"&abs(SubOut39)) +
     ("00000"&abs(SubOut40)) + ("00000"&abs(SubOut41)) + ("00000"&abs(SubOut42)) + ("00000"&abs(SubOut43)) + ("00000"&abs(SubOut44)) +
     ("00000"&abs(SubOut45)) + ("00000"&abs(SubOut46)) + ("00000"&abs(SubOut47)) + ("00000"&abs(SubOut48)) + ("00000"&abs(SubOut49)) +
     ("00000"&abs(SubOut50)) + ("00000"&abs(SubOut51)) + ("00000"&abs(SubOut52)) + ("00000"&abs(SubOut53)) + ("00000"&abs(SubOut54)) +
     ("00000"&abs(SubOut55)) + ("00000"&abs(SubOut56)) + ("00000"&abs(SubOut57)) + ("00000"&abs(SubOut58)) + ("00000"&abs(SubOut59)) +
     ("00000"&abs(SubOut60)) + ("00000"&abs(SubOut61)) + ("00000"&abs(SubOut62)) + ("00000"&abs(SubOut63)) + ("00000"&abs(SubOut64)) +
     ("00000"&abs(SubOut65)) + ("00000"&abs(SubOut66)) + ("00000"&abs(SubOut67)) + ("00000"&abs(SubOut68)) + ("00000"&abs(SubOut69)) +
     ("00000"&abs(SubOut70)) + ("00000"&abs(SubOut71)) + ("00000"&abs(SubOut72)) + ("00000"&abs(SubOut73)) + ("00000"&abs(SubOut74)) +
     ("00000"&abs(SubOut75)) + ("00000"&abs(SubOut76)) + ("00000"&abs(SubOut77)) + ("00000"&abs(SubOut78)) + ("00000"&abs(SubOut79)) +
     ("00000"&abs(SubOut80)) + ("00000"&abs(SubOut81)) + ("00000"&abs(SubOut82)) + ("00000"&abs(SubOut83)) + ("00000"&abs(SubOut84)) +
     ("00000"&abs(SubOut85)) + ("00000"&abs(SubOut86)) + ("00000"&abs(SubOut87)) + ("00000"&abs(SubOut88)) + ("00000"&abs(SubOut89)) +
     ("00000"&abs(SubOut90)) + ("00000"&abs(SubOut91)) + ("00000"&abs(SubOut92)) + ("00000"&abs(SubOut93)) + ("00000"&abs(SubOut94)) +
     ("00000"&abs(SubOut95)) + ("00000"&abs(SubOut96)) + ("00000"&abs(SubOut97)) + ("00000"&abs(SubOut98)) +  ("00000"&abs(SubOut99));

end componente;