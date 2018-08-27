--
-- 
-- This module is the HW4_top entity for simulation 
--  
--
-----------------------------------------------------------------------------------
library  IEEE;
use  IEEE.STD_LOGIC_1164.ALL;
use  IEEE.STD_LOGIC_ARITH.ALL;
use  IEEE.STD_LOGIC_UNSIGNED.ALL;

-- *************************************************************************************************
-- *************************************************************************************************

entity HW4_top is
Port  (	
--- Infrastructure signals [To be used by PC via RS232 or from Nexys2 board switches & pushbuttons and VGA signals to the screen]
-- Host intf signals:
RS232_Rx		:   in   STD_LOGIC;
RS232_Tx		:   out  STD_LOGIC;
-- VGA signals:
VGA_h_sync		: 	out  	STD_LOGIC;
VGA_v_sync		: 	out  	STD_LOGIC;
VGA_red0		: 	out  	STD_LOGIC;
VGA_red1		: 	out  	STD_LOGIC;
VGA_red2		: 	out  	STD_LOGIC;
VGA_grn0		: 	out  	STD_LOGIC;
VGA_grn1		: 	out  	STD_LOGIC;
VGA_grn2		: 	out  	STD_LOGIC;
VGA_blu1		: 	out  	STD_LOGIC;
VGA_blu2		: 	out  	STD_LOGIC;
--Flash Mem signals
MT_ce_n			: 	out  	STD_LOGIC; -- '0' when accessing MOBILE SDRAM mem
Flash_adrs 		: 	out		STD_LOGIC_VECTOR (23 downto 1);-- Flash read/write address
Flash_ce_n		: 	out  	STD_LOGIC; -- '0' when accessing Flash mem
Flash_we_n		: 	out  	STD_LOGIC; -- '0' when writing to Flash mem
Flash_oe_n		: 	out  	STD_LOGIC; -- '0' when reding from Flash mem
Flash_rp_n		: 	out  	STD_LOGIC; -- '0' when reseting Flash mem
Flash_sts		: 	in  	STD_LOGIC; -- '1' when Flash mem FSM is done
Flash_data		:	inout	STD_LOGIC_VECTOR (15 downto 0); -- Date read from Imem or Dmem to be written to Flash mem or data read from Flash mem to be written to Imem or Dmem 
--KBD signals
PS2C			: 	in  	STD_LOGIC;-- PS2 keyboard clock
PS2D			: 	in  	STD_LOGIC;-- PS2 keyboard data
--general signals
leds_out		:	out		STD_LOGIC_VECTOR (7 downto 0);-- 7=Flash_stts, 6=MIPS_ck, 5-0=Host_intf version
CK_50MHz 		:	in		STD_LOGIC;
buttons_in		:	in		STD_LOGIC_vector(3 downto 0) ;--  btn0 is single clock (manual clock), btn3 is manual reset
switches_in 	:	in		STD_LOGIC_VECTOR (7 downto 0);-- 4-0 to select which part to be displayed on the 7Segnets LEDs
sevenseg_out	:	out		STD_LOGIC_VECTOR (6 downto 0);-- to the 7 seg LEDs
anodes_out		:	out		STD_LOGIC_VECTOR (3 downto 0)-- to the 7 seg LEDs
-- signals to be tested by the TB
-- CK_out_to_TB		:	out STD_LOGIC; 
-- RESET_out_to_TB		:	out STD_LOGIC; 
-- HOLD_out_to_TB		:	out STD_LOGIC; 
-- rdbk0_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk1_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk2_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk3_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk4_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk5_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk6_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk7_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk8_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk9_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk10_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk11_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk12_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk13_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk14_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
-- rdbk15_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0) 
	);
end HW4_top; 


architecture Behavioral of HW4_top is
		   
-- ****************************************************************************************************
-- ****************************************************************************************************

-- constants
constant MIPS_data_width : INTEGER := 32; --data width in bits     
constant MIPS_adrs_width : INTEGER := 32; -- Full address width of MIPS CPU



--  Put here all the components used:  Clock_Driver, BYOC_Host_intf, your components
-- ==================================================================================

-- **************************************************************************************************
COMPONENT Clock_Driver is
port
 (
   CK_50MHz_IN		: in  std_logic;
   CK_25MHz_OUT		: out std_logic
  );
END COMPONENT;


-- ***************************************************************************************************
-- ***************************************************************************************************
COMPONENT BYOC_Host_intf is
Port	(	
--========================= The student's part =================================
-- MIPS signals     [to be used by students]
MIPS_reset		 : 	out  	STD_LOGIC; -- output to the Student's design
MIPS_hold		 : 	out  	STD_LOGIC; -- output to the Student's design
-- MIPS IMem signals
MIPS_IMem_adrs 	 : 	in  	STD_LOGIC_VECTOR (31 downto 0);-- MIPS IMem read address  
MIPS_IMem_rd_data :	out		STD_LOGIC_VECTOR (31 downto 0);-- read data (sync read - at the rising edge of MIPS_ck,  all the time)	
-- MIPS DMem signals
MIPS_DMem_we	 :	in		STD_LOGIC;-- '1' when the CPU writes to MIPD_DMem (MIPS_Dmem_wr_data is written to MIPS_DMem_adrs at the rising edge of MIPS_ck), '0' when we do not write
MIPS_DMem_adrs 	 : 	in  	STD_LOGIC_VECTOR (31 downto 0);-- MIPS DMem read/write address
MIPS_DMem_wr_data :	in		STD_LOGIC_VECTOR (31 downto 0);-- write data  (sync write - at the rising edge of MIPS_ck, if MIPS_DMem_we='1')		
MIPS_DMem_rd_data :	out		STD_LOGIC_VECTOR (31 downto 0);-- read data (sync read - at the rising edge of MIPS_ck,  all the time)	
--
--============================Other signals to be directed to i/o pins=============================
--Flash Mem signals
Flash_adrs 		 : 	out		STD_LOGIC_VECTOR (23 downto 1);-- Flash read/write address
Flash_ce_n		 : 	out  	STD_LOGIC;-- '1' when accessing Flash mem
Flash_we_n		 : 	out  	STD_LOGIC;-- '1' when writing to Flash mem
Flash_oe_n		 : 	out  	STD_LOGIC;-- '1' when reding from Flash mem
Flash_rp_n		 : 	out  	STD_LOGIC;-- '0' when reseting Flash mem
Flash_sts		 : 	in  	STD_LOGIC;-- '1' when Flash mem FSM is done
Flash_rd_data	 :	in		STD_LOGIC_VECTOR (15 downto 0);-- data read from Flash mem to be written to Imem or Dmem 
Flash_wr_data	 :	out		STD_LOGIC_VECTOR (15 downto 0);-- Date read from Imem or Dmem to be written to Flash
--
-- Infrastructure signals [To be used by PC via RS232 or from Nexys2 board switches & pushbuttons, and VGA signals to the screen],
-- Host intf signals
RS232_Rx		 : in STD_LOGIC;
RS232_Tx		 : out STD_LOGIC;
-- VGA signals
VGA_h_sync		 : 	out  	STD_LOGIC;
VGA_v_sync		 : 	out  	STD_LOGIC;
VGA_red0		 : 	out  	STD_LOGIC;
VGA_red1		 : 	out  	STD_LOGIC;
VGA_red2		 : 	out  	STD_LOGIC;
VGA_grn0		 : 	out  	STD_LOGIC;
VGA_grn1		 : 	out  	STD_LOGIC;
VGA_grn2		 : 	out  	STD_LOGIC;
VGA_blu1		 : 	out  	STD_LOGIC;
VGA_blu2		 : 	out  	STD_LOGIC;
--PS2 kbd signals
PS2_kbd_ck		 :	in  	STD_LOGIC;
PS2_kbd_data	 :	in  	STD_LOGIC;
--
--general signals
CK_25MHz 	 : in STD_LOGIC; -- main clock input to the Host interface. From this clock we create all other clock signals in the design
buttons_in	 : in STD_LOGIC_vector(3 downto 0);--  btn0 is single clock (manual clock), btn3 is manual reset
switches_in  : in STD_LOGIC_VECTOR (7 downto 0);-- 4-0 to select which part to be displayed on the 7Segnets LEDs
sevenseg_out : out STD_LOGIC_VECTOR (6 downto 0);-- to the 7 seg LEDs
anodes_out 	 : out STD_LOGIC_VECTOR (3 downto 0);-- to the 7 seg LEDs
leds_out 	 : out STD_LOGIC_VECTOR (7 downto 0);-- to 8 LEDs (leftmost = Flash status, next = MIPS_ck, 6 right ones = version number)
--
--=========================additional part for the student=================================
-- RDBK signals
rdbk0 	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk1 	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk2	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk3 	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk4 	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk5	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk6	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk7	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk8	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk9	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk10	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk11	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk12	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk13	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk14	 :	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk15	 :	in	 STD_LOGIC_VECTOR (31 downto 0)
 ) ;
END COMPONENT;


-- ***************************************************************************************************
-- put your components declarations here

-- ***************************************************************************************************
COMPONENT Fetch_Unit  is
Port  (	
-- general input signals
CK_25MHz 		:  in STD_LOGIC;
RESET_in 		:  in STD_LOGIC;
HOLD_in 		:  in STD_LOGIC;
-- MIPS signals
IR_reg_pID		:  out		STD_LOGIC_VECTOR  (31 downto 0);-- The IR_reg (instruction) to be used in ID 
sext_imm_pID	:  out		STD_LOGIC_VECTOR  (31 downto 0);-- The sext_imm to be used in ID 
PC_reg_pIF		:  out		STD_LOGIC_VECTOR  (31 downto 0);-- The PC_reg value in IF. To be read by TB in simulation and rdbk in implementation - for verification purposes 
Rs_equals_Rt_pID  :  in  	STD_LOGIC;-- '1' if value read from Rs equals the value read from Rt, '0' otherwise. Used in branch instructions.
--- IMem signals
MIPS_IMem_adrs	     :  out STD_LOGIC_VECTOR (31 downto 0); 
MIPS_IMem_rd_data    :  in STD_LOGIC_VECTOR (31 downto 0) 
		);
END  COMPONENT;


-- ***************************************************************************************************
COMPONENT  GPR  is
Port ( 	
-- RST			:	in		STD_LOGIC;
CK			: 	in     STD_LOGIC;
rd_reg1 	: 	in     STD_LOGIC_VECTOR (4 downto 0);-- Rs
rd_reg2 	: 	in     STD_LOGIC_VECTOR (4 downto 0);-- Rt
wr_reg	 	: 	in     STD_LOGIC_VECTOR (4 downto 0);-- Rd (in R-Type instruction, Rt in LW)
rd_data1 	: 	out    STD_LOGIC_VECTOR (31 downto 0);-- Rs contents
rd_data2 	: 	out    STD_LOGIC_VECTOR (31 downto 0);-- Rt contents
wr_data 	: 	in	   STD_LOGIC_VECTOR (31 downto 0);-- contents to be written into Rd (or Rt)
Reg_Write 	: 	in     STD_LOGIC;-- "0" means no register is written into
GPR_hold 	: 	in     STD_LOGIC -- "1" means no register is written into
   );
end COMPONENT;


-- ***************************************************************************************************
COMPONENT MIPS_ALU is
Port	(	
--  control inputs (determin ALU operation)
ALUOP		:   in STD_LOGIC_VECTOR(1 downto 0); -- 00=add, 01=sub, 10=by Function
Funct		:   in STD_LOGIC_VECTOR(5 downto 0); -- 32=ADD, 34=sub, 36=AND, 37=OR, 38=XOR, 42=SLT
-- data inputs & data control inputs
A_in		:   in STD_LOGIC_VECTOR(31 downto 0);
B_in		:   in STD_LOGIC_VECTOR(31 downto 0);
sext_imm	:   in STD_LOGIC_VECTOR(31 downto 0);
ALUsrcB		:   in STD_LOGIC;
-- data output
ALU_out		:   out STD_LOGIC_VECTOR(31 downto 0)
	    );
end COMPONENT;






-- *************************************************************************************************
-- *************************************************************************************************

-- signals connecting the components, inputs & external logic
-- ===========================================================
-- Reset and CK signals
signal  CK :STD_LOGIC :='0';
signal  RESET : STD_LOGIC :='0'; -- The main RESET signal combined from switches in & MIPS_reset
signal  HOLD : STD_LOGIC :='0'; -- The main RESET signal combined from switches in & MIPS_reset
signal  RESET_from_Host_Intf  : STD_LOGIC; -- is coming from the BYOC_Host_intf


-- Flash data bus signals (used to connect to the Flash_data "inout" pin)
signal  data_from_Flash	:  STD_LOGIC_VECTOR  (15 downto 0);
signal  data_to_Flash	:  STD_LOGIC_VECTOR  (15 downto 0);
-- Flasn control signals
signal	Flash_ce_n_line :  STD_LOGIC;
signal	Flash_we_n_line :  STD_LOGIC;
signal	Flash_oe_n_line :  STD_LOGIC;

signal	Flash_rp_n_in_BYOC		:  STD_LOGIC; -- '0' when reseting Flash mem
signal	Flash_sts_in_BYOC		:  STD_LOGIC; -- '1' when Flash mem FSM is done

signal	leds_out_from_host_intf	:  STD_LOGIC_VECTOR  (7 downto 0); -- 7=Flash_stts, 6=MIPS_ck, 5-0=Host_intf version




--- ===========================================================================
-- Your design signals
--- ============================================================================



--- ======================== MIPS signals ========================================
--- ============================================================================

-- =========================== IF phase ==============================================
-- ==================================================================================
-- almost all signals are inside the Fetch Unit

-- except IMem signals
signal	IMem_adrs 	: STD_LOGIC_VECTOR  (31 downto 0);
signal  IMem_rd_data	: STD_LOGIC_VECTOR  (31 downto 0);

-- and we have the PC_reg (PC_reg_pIF) coming out of the Fetch_Unit for rdbk to Host_Intf  & TB
signal  PC_reg	: STD_LOGIC_VECTOR  (31 downto 0);



--=========================== ID phase ==============================================
--==================================================================================
-- ID phase  (a register with valid value along the ID phase)
signal  IR_reg	: STD_LOGIC_VECTOR(31 downto 0) ;
-- IR reg signals   (valid in ID phase)
signal  Opcode	: STD_LOGIC_VECTOR(5 downto 0); -- IR[31:26]
signal  Rs : STD_LOGIC_VECTOR(4 downto 0); -- IR[25:21]
signal  Rt : STD_LOGIC_VECTOR(4 downto 0); -- IR[20:16]
signal  Rd : STD_LOGIC_VECTOR(4 downto 0); --IR[15:11]
signal  Funct	: STD_LOGIC_VECTOR(5 downto 0);--IR[5:0]

-- other signals active in ID phase
signal  sext_imm     :  STD_LOGIC_VECTOR  (31 downto 0);
signal  GPR_rd_data1 :  STD_LOGIC_VECTOR  (31 downto 0);
signal  GPR_rd_data2 :  STD_LOGIC_VECTOR  (31 downto 0);
signal  Rs_equals_Rt :  STD_LOGIC;--  '1' if contents of Rs equals the contents of Rt, '0' if not. 


-- MIPS control signals - created at the ID phase
---------------------------------------------------------------
-- Decoded signals for EX phase
signal  ALUsrcB : STD_LOGIC;-- '0' selects B_reg, '1' selects sext sext_imm
signal  ALUOP   : STD_LOGIC_VECTOR  (1 downto 0);-- 00=add, 01=sub, 10=by Function
signal  RegDst  : STD_LOGIC;--'0' selects Rt, '1' selects Rd

-- Decoded signals for WB phase
signal  RegWrite : STD_LOGIC;-- '1' for writing to the GPR file



--=========================== EX phase ===============================================
--===================================================================================
--Registerd valid in EX phase  
signal  A_reg		   : STD_LOGIC_VECTOR  (31 downto 0);
signal  B_reg		   : STD_LOGIC_VECTOR  (31 downto 0);
signal  sext_imm_reg   : STD_LOGIC_VECTOR  (31 downto 0);
signal  Rt_pEX		   : STD_LOGIC_VECTOR  (4 downto 0) ;
signal  Rd_pEX		   : STD_LOGIC_VECTOR  (4 downto 0) ;
signal  ALU_output	   : STD_LOGIC_VECTOR  (31 downto 0);


-- MIPS control signals - created at the ID phase - delayed to EX phase
-------------------------------------------------------------------------------------------
-- Decoded signals for EX phase
signal  ALUsrcB_pEX    : STD_LOGIC;
signal  Funct_pEX	   : STD_LOGIC_VECTOR  (5 downto 0); --IR[5:0]
signal  ALUOP_pEX      : STD_LOGIC_VECTOR  (1 downto 0);
signal  RegDst_pEX     : STD_LOGIC;
signal  RegWrite_pEX   : STD_LOGIC;




--=========================== WB phase ==============================================
--==================================================================================
--Registers valid in WB phase 
signal  ALUout_reg	: STD_LOGIC_VECTOR (31 downto 0);
signal  Rd_pWB : STD_LOGIC_VECTOR (4 downto 0);

--signals valid in WB phase
-- MIPS control signals - created at the ID phase - delayed to WB phase
--------------------------------------------------------------------------------------------
-- Decoded signals for WB phase
signal RegWrite_pWB : STD_LOGIC;



--- ================== End of MIPS signals ========================================
--- ============================================================================



-- ***************************************************************************************************
---- Host Intf signals

signal  rdbk3_vec   : STD_LOGIC_VECTOR(31 downto 0);
signal  rdbk4_vec   : STD_LOGIC_VECTOR(31 downto 0);
signal  rdbk7_vec   : STD_LOGIC_VECTOR(31 downto 0);
signal  rdbk13_vec  : STD_LOGIC_VECTOR(31 downto 0);





-- ***************************************************************************************************





begin


-- ***************************************************************************************************
-- Component connections 
-- ===============================================================================
-- Connect all components used:  Clock_Driver, BYOC_Host_intf,  your components ...
-- ===============================================================================

-- Connecting the Clock_Driver
-- ========================================
clock_divider : Clock_Driver
port map
 (
   CK_50MHz_IN		=>      CK_50MHz, -- directly form the HW_MIPS i/o pin
   CK_25MHz_OUT		=>      CK        -- the CK signal to the entire HW4_MIPS design
  );

 -- Connecting the HW4_Host_intf
-- =========================================
hostintf :  BYOC_Host_intf 
Port Map (	
-- ======================== The student's part =================================
-- MIPS signals   [to be used by students]
MIPS_reset			=>		RESET_from_host_intf, -- The Host_intf drives the RESET signal
MIPS_hold			=>		HOLD,	--  The Host_intf also drives the HOLD signal
-- MIPS IMem signals
MIPS_IMem_adrs		=>		IMem_adrs,	   -- driven by the Fetch_Unit
MIPS_IMem_rd_data	=>		IMem_rd_data,  -- driven by the Host_intf and sent to the Fetch_Unit
-- MIPS DMem signals
MIPS_DMem_we		=>		'0',	       -- '1' if we want to write into DMem at the next rising edge of the CK 
MIPS_DMem_adrs		=>		x"00000000",   -- The address to DMem 
MIPS_DMem_wr_data	=>		x"00000000",   -- The data to be written into DMem_adrs 
MIPS_DMem_rd_data	=>		open,	       -- The data read from DMem_adrs 
--
--============================Other signals to be directed to i/o pins==============================
-- Flash Mem signals
Flash_adrs 			=>		Flash_adrs,
Flash_ce_n			=>		Flash_ce_n_line,
Flash_we_n			=>		Flash_we_n_line,
Flash_oe_n			=>		Flash_oe_n_line,
Flash_rp_n			=>		Flash_rp_n_in_BYOC,
Flash_sts			=>		Flash_sts,
Flash_rd_data		=>		data_from_Flash,
Flash_wr_data		=>		data_to_Flash,
--
-- Infrastructure signals  [To be used by PC via RS232 or from Nexys2 board switches & pushbuttons, and VGA signals to the screen],
-- Host intf signals
RS232_Rx			=>		 RS232_Rx,
RS232_Tx			=>		 RS232_Tx,
-- VGA signals
VGA_h_sync			=>		 VGA_h_sync,
VGA_v_sync			=>		 VGA_v_sync,
VGA_red0			=>		 VGA_red0,
VGA_red1			=>		 VGA_red1,
VGA_red2			=>		 VGA_red2,
VGA_grn0			=>		 VGA_grn0,
VGA_grn1			=>		 VGA_grn1,
VGA_grn2			=>		 VGA_grn2,
VGA_blu1			=>		 VGA_blu1,
VGA_blu2			=>		 VGA_blu2,
--PS2 kbd signals
PS2_kbd_ck			=>		 PS2C,
PS2_kbd_data		=>		 PS2D,
--
--general signals
CK_25MHz		 	=>		CK, --This is CK_25MHz from the Clock_Driver
buttons_in		 	=>		buttons_in,
switches_in		 	=>		switches_in,
sevenseg_out	 	=>		sevenseg_out,
anodes_out		 	=>		anodes_out,
leds_out		 	=>		leds_out_from_host_intf,
--
--=========================additional part for the student=================================
-- RDBK signals
rdbk0 			=> 	 		PC_reg,
rdbk1 			=> 	 		IR_reg,
rdbk2 			=> 	 		sext_imm,
rdbk3 			=> 	 		rdbk3_vec,
rdbk4 			=> 	 		rdbk4_vec,
rdbk5			=> 	 		GPR_rd_data1,
rdbk6			=> 	 		GPR_rd_data2,
rdbk7			=> 	 		rdbk7_vec,
rdbk8			=> 	 		A_reg,
rdbk9			=> 	 		B_reg,
rdbk10			=> 	  		sext_imm_reg,
rdbk11			=> 			ALU_output,
rdbk12			=> 	 		ALUout_reg,
rdbk13			=> 	 		rdbk13_vec,
rdbk14			=> 	 		x"00000000",
rdbk15			=> 	 		x"00000000"
 );

  
-- *************************************************************************************************
-- Connecting the Fetch_Unit
-- =========================================
fetch_unit_imp : Fetch_Unit 
Port map(	
-- general input signals
CK_25MHz		  =>      CK,
RESET_in 		  =>		RESET,
HOLD_in 		  =>		HOLD,
-- MIPS signals
IR_reg_pID		  =>		IR_reg, -- connecting IR_reg_pID to the signal called IR_reg
sext_imm_pID	  =>		sext_imm, -- same for the signal called sext_imm
PC_reg_pIF	  	  =>		PC_reg,
Rs_equals_Rt_pID  =>	    Rs_equals_Rt,
--- IMem signals
MIPS_IMem_adrs	  =>	    IMem_adrs,
MIPS_IMem_rd_data =>	    IMem_rd_data
);



-- Connecting the GPR file
-- =========================================
GPR_file : GPR
Port map (	
--RST		=>     not connected
CK			=>	 CK,
rd_reg1 	=>	 Rs,
rd_reg2 	=>	 Rt,
wr_reg 		=>	 Rd_pWB,
rd_data1	=>	 GPR_rd_data1,
rd_data2	=>	 GPR_rd_data2,
wr_data 	=>   ALUout_reg, 
Reg_Write 	=>   RegWrite_pWB,
GPR_hold 	=>   HOLD -- ,
 );

	
-- Connecting the MIPS_ALU
-- =========================================
ALU : MIPS_ALU 
Port map (	
-- ALU operation control inputs
ALUOP		=>		ALUOP_pEX,
Funct		=>		Funct_pEX,
-- data inputs & data control inputs
A_in		=>		A_reg,
B_in		=>		B_reg,
sext_imm	=>		sext_imm_reg,
ALUsrcB		=>		ALUsrcB_pEX,
-- data output
ALU_out		=>		ALU_output
	);



-- all signal equations


--  Signals to external components 
-- ==============================
-- disconnecting the Mobile SRAM
MT_ce_n <= '1' ; -- making sure that the SRAM is not active

-- connecting Flash_data bidir signal
data_from_Flash	  <= Flash_data;
Flash_data        <= data_to_Flash	when (Flash_oe_n_line ='1' and Flash_ce_n_line='0') else (others => 'Z');

-- connecting other Flash signals
Flash_ce_n  <= Flash_ce_n_line;
Flash_oe_n  <= Flash_oe_n_line;
Flash_we_n  <= Flash_we_n_line;

Flash_rp_n	<=	Flash_rp_n_in_BYOC and ( not switches_in(4) );
Flash_sts_in_BYOC  <=  Flash_sts;

--leds_out(7)  <=  Flash_sts_in_BYOC ;
leds_out  <=  Flash_sts_in_BYOC & leds_out_from_host_intf(6 downto 0); -- 7=Flash_stts, 6=MIPS_ck??, 5-0=Host_intf version


-- General signals
--==========================
RESET		<=		switches_in(6) or RESET_from_Host_Intf;


-- Here is your part, i.e., your equations


-- ============================ IF phase processes ========================================
-- ============================ =========================================================
-- no such processes. They are all inside the Fetch Unit	

-- ============================ ID phase processes ========================================
-- ============================ =========================================================
-- IR fields signals
Opcode	<=	IR_reg(31 downto 26);
Rs			<=		IR_reg(25 downto 21);
Rt			<=		IR_reg(20 downto 16);
Rd			<=		IR_reg(15 downto 11);
Funct		<=		IR_reg(5 downto 0);


-- beq/bne comparator
process(CK, RESET, GPR_rd_data1, GPR_rd_data2)
begin
	if RESET = '1' then
		Rs_equals_Rt	<=		'0';
	else
		if GPR_rd_data1 = GPR_rd_data2 then
			Rs_equals_Rt	<=		'1';
		else
			Rs_equals_Rt	<=		'0';
		end if;
	end if;
end process;


-- Control decoder  - calculates the signals in ID phase
process(CK,RESET)
begin
	if RESET = '1' then
		ALUsrcB	<=	'0';
		ALUOP		<=	b"00";
		RegDst	<=	'0';
		RegWrite	<=	'0';
	else
		if Opcode = b"000000" then --	R-type 
			ALUsrcB	<=	'0';
			ALUOP		<=	b"10";
			RegDst	<=	'1';
			RegWrite	<=	'1';
		elsif Opcode = b"000100" OR Opcode = b"000101" then --	beq or bne 
			ALUsrcB	<=	'0';
			ALUOP		<=	b"01";
			RegDst	<=	'0';
			RegWrite	<=	'0';
		elsif Opcode = b"001000" then --	addi
			ALUsrcB	<=	'1';
			ALUOP		<=	b"00";
			RegDst	<=	'0';
			RegWrite	<=	'1';
		else -- jump and else.
			ALUsrcB	<=	'0';
			ALUOP		<=	b"00";
			RegDst	<=	'0';
			RegWrite	<=	'0';
		end if;
	end if;
end process;

-- ============================ EX phase processes ========================================
-- =====================================================================================
-- A & B registers

process(CK, RESET)
begin
	if RESET = '1' then
		A_reg					<= 	x"00000000";
		B_reg					<= 	x"00000000";
	elsif CK'event and CK = '1' and HOLD = '0' then
			A_reg		<= 	GPR_rd_data1;
			B_reg		<= 	GPR_rd_data2;
	end if;
end process;

-- sext_imm register
process(CK, RESET)
begin
	if RESET = '1' then
		sext_imm_reg		<= 	x"00000000";
	elsif CK'event and CK = '1' and HOLD = '0' then
		sext_imm_reg		<= 	sext_imm;
	end if;
end process;	
-- Rt register 
process(CK, RESET)
begin
	if RESET = '1' then
		Rt_pEX		<= 	b"00000";
	elsif CK'event and CK = '1' and HOLD = '0' then
		Rt_pEX		<= 	Rt;
	end if;
end process;	

-- Rd register
process(CK, RESET)
begin
	if RESET = '1' then
		Rd_pEX		<= 	b"00000";
	elsif CK'event and CK = '1' and HOLD = '0' then
		Rd_pEX		<= 	Rd;
	end if;
end process;	


-- control signals regs

process(CK, RESET)
begin
	if CK'event and CK = '1' and HOLD = '0' then
		ALUsrcB_pEX		<=		ALUsrcB;
		Funct_pEX		<=		Funct;
		ALUOP_pEX		<=		ALUOP;
		RegDst_pEX		<=		RegDst;
		RegWrite_pEX   <=		RegWrite;
	end if;
end process;
	

-- ============================ WB phase processes ========================================
-- =======================================================================================
-- ALUOUT register
process(CK, RESET)
begin
	if RESET = '1' then
		ALUout_reg		<= 	x"00000000";
	elsif CK'event and CK = '1' and HOLD = '0' then
		ALUout_reg		<= 	ALU_output;
	end if;
end process;	

-- RegDst mux and Rd_pWB register
process(CK, RESET)
begin
	if RESET = '1' then
		Rd_pWB		<= 	b"00000";
	elsif CK'event and CK = '1' and HOLD = '0' then		
		if RegDst_pEX = '0' then
			Rd_pWB	<=	Rt_pEX;
		else
			Rd_pWB	<=	Rd_pEX;
		end if;
	end if;
end process;

-- RegWrite_pWB FF
process(CK, RESET)
begin
	if RESET = '1' then
		RegWrite_pWB		<= 	'0';
	elsif CK'event and CK = '1' and HOLD = '0' then
		RegWrite_pWB		<= 	RegWrite_pEX;
	end if;
end process;






-- ***************************************************************************************************
-- build special rdbk signals
rdbk3_vec    <=	b"000" & Rs  &  b"000" & Rt  &  b"000" & Rd  &  b"00" & Funct;
rdbk4_vec    <=	b"000" & RegWrite & b"0000"  &  b"00000000"  &  b"00000000"  &  b"0000" & b"000" & Rs_equals_Rt;
rdbk7_vec    <=  b"000" & ALUsrcB_pEX & b"0000"  & b"00000000" & b"0000"   &  b"00" & ALUOP_pEX & "00" & Funct_pEX;
rdbk13_vec   <=	b"00000000" & b"000" &  Rd_pWB &  b"00000000"  &  b"0000" & "000" & RegWrite_pWB;



-- ***************************************************************************************************
-- Connect the signals to be tested by the TB
-- CK_out_to_TB		  <=		CK;
-- RESET_out_to_TB		  <=		RESET;
-- HOLD_out_to_TB		  <=		HOLD;
-- rdbk0_out_to_TB 	  <= 	    PC_reg;
-- rdbk1_out_to_TB 	  <= 	    IR_reg; 
-- rdbk2_out_to_TB 	  <= 	    sext_imm;
-- rdbk3_out_to_TB 	  <=		rdbk3_vec;
-- rdbk4_out_to_TB 	  <=		rdbk4_vec;
-- rdbk5_out_to_TB 	  <=		GPR_rd_data1;
-- rdbk6_out_to_TB 	  <=		GPR_rd_data2;
-- rdbk7_out_to_TB 	  <= 		rdbk7_vec;
-- rdbk8_out_to_TB 	  <=		A_reg;
-- rdbk9_out_to_TB 	  <= 		B_reg;
-- rdbk10_out_to_TB 	  <=		sext_imm_reg;
-- rdbk11_out_to_TB 	  <= 		ALU_output;
-- rdbk12_out_to_TB 	  <= 		ALUout_reg;
-- rdbk13_out_to_TB 	  <=		rdbk13_vec;
-- rdbk14_out_to_TB 	  <=  	x"00000000";
-- rdbk15_out_to_TB 	  <= 		x"00000000";


-- *************************************************************************************************



end  Behavioral;

-- *************************************************************************************************
-- *************************************************************************************************

