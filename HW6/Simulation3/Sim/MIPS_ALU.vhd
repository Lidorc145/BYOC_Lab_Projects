--
-- 
-- This module is the MIPS ALU 
--  
--
--   
--
----------------------------------------------------------------------------------
library  IEEE;
use  IEEE.STD_LOGIC_1164.ALL;
use  IEEE.STD_LOGIC_ARITH.ALL;
use  IEEE.STD_LOGIC_UNSIGNED.ALL;

-- ***********************************************************************************************
-- ***********************************************************************************************

entity MIPS_ALU is
Port(	
-- control inputs (determin ALU operation)
ALUOP		:  in STD_LOGIC_VECTOR(1 downto 0);-- 00=add, 01=sub, 10=by Function
Funct		:  in STD_LOGIC_VECTOR(5 downto 0);-- 32=ADD, 34=sub, 36=AND, 37=OR, 38=XOR, 42=SLT
-- data inputs & data control 
A_in		:  in STD_LOGIC_VECTOR(31 downto 0);
B_in		:  in STD_LOGIC_VECTOR(31 downto 0);
sext_imm	:  in STD_LOGIC_VECTOR(31 downto 0);
ALUsrcB		:  in STD_LOGIC;
-- data output
ALU_out		:  out STD_LOGIC_VECTOR(31 downto 0)
	) ;
end MIPS_ALU;
 


architecture  Behavioral  of  MIPS_ALU  is
		   
-- ***********************************************************************************************
-- ***********************************************************************************************


-- inner signals
-- ==================================================
signal  ALU_cmd    :  STD_LOGIC_VECTOR  (2 downto 0) ; -- 000=AND, 001=OR, 010=ADD, 011=XOR, 110=sub, 111=slt, 100,101= not used for now
signal  ALU_A_in   :  STD_LOGIC_VECTOR  (31 downto 0);
signal  ALU_B_in   :  STD_LOGIC_VECTOR  (31 downto 0);
signal  ALU_output :  STD_LOGIC_VECTOR  (31 downto 0);





begin
ALU_A_in		<= 	A_in;

ALU_out 	<=		ALU_output;

process(ALUOP, Funct)
begin
	if ALUOP = b"01" then
		ALU_cmd<=b"110";
	elsif ALUOP = b"10" then
			case Funct is
				when b"100010" => ALU_cmd<=b"110"; -- A - B
				when b"100100" => ALU_cmd<=b"000"; -- A and B
				when b"100101" => ALU_cmd<=b"001"; -- A or B
				when b"100110" => ALU_cmd<=b"011"; -- A xor B
				when b"101010" => ALU_cmd<=b"111"; -- A SLT B
				when others => ALU_cmd<=b"010"; -- A + B
			end case;
	elsif ALUOP = b"11" then
		ALU_cmd<=b"001"; -- A or B  (for ORI)
	else
		ALU_cmd<=b"010"; -- A + B
	end if;
end process;


process(ALUsrcB, B_in, sext_imm)
begin
	if conv_integer(ALUsrcB) = 1 then
		ALU_B_in <= sext_imm;
	else
		ALU_B_in <= B_in;
	end if;
end process;

process(ALU_cmd,ALU_A_in,ALU_B_in)
begin
	case ALU_cmd is
		when b"000" => ALU_output<=ALU_A_in AND ALU_B_in;
		when b"001" => ALU_output<=ALU_A_in OR ALU_B_in;
		when b"010" => ALU_output<=ALU_A_in + ALU_B_in;
		when b"011" => ALU_output<=ALU_A_in XOR ALU_B_in;
		when b"100" => ALU_output<=ALU_A_in NAND ALU_B_in;
		when b"101" => ALU_output<=ALU_A_in NOR ALU_B_in;	
		when b"110" => ALU_output<=ALU_A_in - ALU_B_in;
		when b"111" => if conv_integer(ALU_A_in) < conv_integer(ALU_B_in) then
									ALU_output	<=	x"00000001";
								else
									ALU_output	<= x"00000000";
								end if;
		when others => ALU_output<= x"00000000";
	end case;
end process;



end Behavioral;

-- ***********************************************************************************************
-- ***********************************************************************************************

