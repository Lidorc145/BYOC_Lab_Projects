--
-- 
-- This package includes definition of filenames used for all dat files in simulations

--
--
----------------------------------------------------------------------------------
library	 ieee;


package  BYOC_filenames is
	
use  ieee.std_logic_arith.all;  
use  ieee.std_logic_unsigned.all;
use  ieee.std_logic_1164.all;
use  std.textio.all;
use  IEEE.NUMERIC_STD.all;

constant	program_in_file_name 	:  string := "C:\Users\Lidor Cohen\Desktop\BYOC-HW5-Lidor\HW5-4sim\SIM_HW5_program.dat";
constant	data_in_file_name 		:  string := "C:\Users\Lidor Cohen\Desktop\BYOC-HW5-Lidor\HW5-4sim\SIM_HW5_TB_data.dat";

signal 		no_hold					:  STD_LOGIC := '0'; -- MUST be '0' for correct TB messages !!!

end  BYOC_filenames;