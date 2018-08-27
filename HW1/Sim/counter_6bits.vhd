-- This is a 6 bit binary counter  
--
----------------------------------------------------------------------------------
library  IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter_6bits is
		Port 		( 	CK_in	 :	in		STD_LOGIC;
						clr		 : 	in  	STD_LOGIC;
						cntr_out	 : 	out  	STD_LOGIC_VECTOR (5 downto 0));
end counter_6bits;

--- signal cntr: STD_LOGIC_VECTOR(31 downto 0);

architecture counter of counter_6bits is
signal cntr: STD_LOGIC_VECTOR(5 downto 0);
	begin
		process(CK_in, clr)
		begin
			if clr = '1' then
				cntr <= b"000000";
			elsif CK_in 'event and CK_in = '1' then
				cntr <= cntr + 1 ;
			end if;
		end process;
		
		cntr_out <= cntr(5 downto 0);
		
end counter;
