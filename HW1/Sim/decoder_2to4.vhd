----------------------------------------------------------------------------------
-- This is a 2->4 binary decoder
-- 
--
----------------------------------------------------------------------------------
library  IEEE;
use  IEEE.STD_LOGIC_1164.ALL;


	
entity decoder_2to4 is
    Port ( in_no 	  : in   STD_LOGIC_VECTOR(1 downto 0);
           out_lines  : out  STD_LOGIC_VECTOR(3 downto 0));
end decoder_2to4;

architecture Behavioral of decoder_2to4 is

begin
	with in_no  select 
		out_lines  <=
		 "1110"  when b"00",
		 "1101"  when b"01",
		 "1011"  when b"10",
		 "0111"  when others ;

end Behavioral;



