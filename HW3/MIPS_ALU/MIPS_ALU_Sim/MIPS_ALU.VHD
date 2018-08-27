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

--Operations of ALU according to ALU_cmd
process(Funct, ALUOP)
begin
	if ALUOP = b"10" then
		case Funct is
			-- Operations non and nan are not used
			when b"100100" => ALU_cmd <= b"000"; -- AND
			when b"100101" => ALU_cmd <= b"001"; -- OR
			when b"100000" => ALU_cmd <= b"010"; -- Addition
			when b"100110" => ALU_cmd <= b"011"; -- XOR
			when b"100010" => ALU_cmd <= b"110"; -- Subtract
			when b"101010" => ALU_cmd <= b"111";
			when others => ALU_cmd <= b"000"; 					
		end case;
	elsif ALUOP = b"00" then 
		ALU_cmd <= b"010";
	elsif ALUOP = b"01" then
		ALU_cmd <= b"110";
	end if;
end process;


ALU_A_in <= A_in;

--Choosing the source of B according to ALUsrcB value
process(ALUsrcB, B_in, sext_imm)
begin
	if ALUsrcB = '0' then
		ALU_B_in <= B_in;
	else
		ALU_B_in <= sext_imm;
	end if;
end process;

process(ALU_A_in, ALU_B_in, ALU_cmd)
begin
	-- ALU_Out
	if ALU_cmd = b"000" then
		ALU_out <= (ALU_A_in and ALU_B_in);
	elsif ALU_cmd = b"001"  then
		ALU_out <= (ALU_A_in or ALU_B_in);
	elsif ALU_cmd = b"010" then
		ALU_out <= (ALU_A_in + ALU_B_in);
	elsif ALU_cmd = b"011" then
		ALU_out <= (ALU_A_in xor ALU_B_in);		
	elsif ALU_cmd = b"110" then
		ALU_out <= (ALU_A_in - ALU_B_in);
	elsif ALU_cmd = b"111" then
		if conv_integer(ALU_A_in) < conv_integer(ALU_B_in) then
			ALU_out <= x"00000001";
		else
			ALU_out <= x"00000000";
			end if;
	else ALU_out <= x"00000000"; 
	end if;
end process;

end Behavioral;

-- ***********************************************************************************************
-- ***********************************************************************************************

