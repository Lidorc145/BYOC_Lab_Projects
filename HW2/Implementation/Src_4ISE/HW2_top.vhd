--
-- 
-- This module is the HW2_top entity for simulation
--  
--
----------------------------------------------------------------------------------
library  IEEE;
use  IEEE.STD_LOGIC_1164.ALL;
use  IEEE.STD_LOGIC_ARITH.ALL;
use  IEEE.STD_LOGIC_UNSIGNED.ALL;

-- ***************************************************************************************************
-- ***************************************************************************************************

entity HW2_top is
Port  (	
-- Infrastructure signals [To be used by PC via RS232 or from Nexys2 board switches & pushbuttons and VGA signals to the screen]
-- Host intf signals:
RS232_Rx		:   in STD_LOGIC;
RS232_Tx		:   out STD_LOGIC;
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
--Flash Mem signals:
MT_ce_n			: 	out  	STD_LOGIC; -- '0' when accessing MOBILE SDRAM mem
Flash_adrs 		: 	out		STD_LOGIC_VECTOR (23 downto 1);--Flash read or write address
Flash_ce_n		: 	out  	STD_LOGIC; -- '0' when accessing Flash mem
Flash_we_n		: 	out  	STD_LOGIC; -- '0' when writing to Flash mem
Flash_oe_n		: 	out  	STD_LOGIC; -- '0' when reding from Flash mem
Flash_rp_n		: 	out  	STD_LOGIC; -- '0' when reseting Flash mem
Flash_sts		: 	in  	STD_LOGIC; -- '1' when Flash mem FSM is done
Flash_data		:	inout	STD_LOGIC_VECTOR (15 downto 0); -- Date read from Imem or Dmem to be written to Flash mem or data read from Flash mem to be written to Imem or Dmem 
--KBD signals:
PS2C			: 	in  	STD_LOGIC;-- PS2 keyboard clock
PS2D			: 	in  	STD_LOGIC;-- PS2 keyboard data
--general signals:
leds_out		:	out		STD_LOGIC_VECTOR (7 downto 0);-- 7=Flash_stts, 6=MIPS_ck ??, 5-0=Host_intf version
CK_50MHz 		:	in		STD_LOGIC;
buttons_in		:	in		STD_LOGIC_vector(3 downto 0) ;--  btn0 is single clock (manual clock), btn3 is manual reset
switches_in 	:	in		STD_LOGIC_VECTOR (7 downto 0);-- 4-0 to select which part to be displayed on the 7Segnets LEDs
sevenseg_out	:	out		STD_LOGIC_VECTOR (6 downto 0);-- to the 7 seg LEDs
anodes_out		:	out		STD_LOGIC_VECTOR (3 downto 0)-- to the 7 seg LEDs
-- signals to be tested by the TB:
--CK_out_to_TB		:	out STD_LOGIC; 
--RESET_out_to_TB		:	out STD_LOGIC; 
--HOLD_out_to_TB		:	out STD_LOGIC; 
--rdbk0_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk1_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk2_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk3_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk4_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk5_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk6_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk7_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk8_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk9_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk10_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk11_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk12_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk13_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk14_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0); 
--rdbk15_out_to_TB 	:	out STD_LOGIC_VECTOR (31 downto 0) 
	);
end HW2_top; 


architecture Behavioral of HW2_top is
		   
-- ***************************************************************************************************
-- ***************************************************************************************************

-- constants
constant MIPS_data_width : INTEGER := 32; -- data width in bits     
constant MIPS_adrs_width : INTEGER := 32; -- Full address width of MIPS CPU



-- Put here all the components used:  Clock_Driver, BYOC_Host_intf, your components
-- ===================================================================================

-- ***************************************************************************************************
COMPONENT Clock_Driver is
port
  (
   CK_50MHz_IN			: in  std_logic ;
   CK_25MHz_OUT			: out std_logic
  );
END COMPONENT;


-- ***************************************************************************************************
-- ***************************************************************************************************
COMPONENT BYOC_Host_intf is
Port (	
--========================= The student's part =================================
-- MIPS signals    [to be used by students]
MIPS_reset		: 	out  	STD_LOGIC; -- output to the Student's design
MIPS_hold		: 	out  	STD_LOGIC; -- output to the Student's design
-- MIPS IMem signals
MIPS_IMem_adrs 	: 	in  	STD_LOGIC_VECTOR (31 downto 0);-- MIPS IMem read address  
MIPS_IMem_rd_data :	out		STD_LOGIC_VECTOR (31 downto 0);-- read data (sync read -  at the rising edge of MIPS_ck,  all the time)	
-- MIPS DMem signals
MIPS_DMem_we	:	in		STD_LOGIC;-- '1' when the CPU writes to MIPD_DMem (MIPS_Dmem_wr_data is written to MIPS_DMem_adrs at the rising edge of MIPS_ck), '0' when we do not write
MIPS_DMem_adrs 	: 	in  	STD_LOGIC_VECTOR (31 downto 0);-- MIPS DMem read/write address
MIPS_DMem_wr_data :	in		STD_LOGIC_VECTOR (31 downto 0);-- write data  (sync write - at the rising edge of MIPS_ck, if MIPS_DMem_we='1')		
MIPS_DMem_rd_data :	out		STD_LOGIC_VECTOR (31 downto 0);-- read data (sync read -  at the rising edge of MIPS_ck,  all the time)	
--
--=========================== Other signals to be directed to i/o pins =============================
--Flash Mem signals
Flash_adrs 		: 	out		STD_LOGIC_VECTOR (23 downto 1);--Flash read/write address
Flash_ce_n		: 	out  	STD_LOGIC;-- '1' when accessing Flash mem
Flash_we_n		: 	out  	STD_LOGIC;-- '1' when writing to Flash mem
Flash_oe_n		: 	out  	STD_LOGIC;-- '1' when reding from Flash mem
Flash_rp_n		: 	out  	STD_LOGIC;-- '0' when reseting Flash mem
Flash_sts		: 	in  	STD_LOGIC;-- '1' when Flash mem FSM is done
Flash_rd_data	:	in		STD_LOGIC_VECTOR (15 downto 0); -- data read from Flash mem to be written to Imem or Dmem 
Flash_wr_data	:	out		STD_LOGIC_VECTOR (15 downto 0); -- Date read from Imem or Dmem to be written to Flash
--
-- Infrastructure signals [To be used by PC via RS232 or from Nexys2 board switches & pushbuttons and VGA signals to the screen]
-- Host intf signals
RS232_Rx		:   in      STD_LOGIC;
RS232_Tx		:   out     STD_LOGIC;
-- VGA signals
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
--PS2 kbd signals
PS2_kbd_ck		:	in  	STD_LOGIC;
PS2_kbd_data	:	in  	STD_LOGIC;
---
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
rdbk0 	:	in 	 STD_LOGIC_VECTOR (31 downto 0);
rdbk1 	:	in 	 STD_LOGIC_VECTOR (31 downto 0);
rdbk2	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk3 	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk4 	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk5	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk6	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk7	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk8	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk9	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk10	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk11	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk12	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk13	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk14	:	in	 STD_LOGIC_VECTOR (31 downto 0);
rdbk15	:	in	 STD_LOGIC_VECTOR (31 downto 0)
 );
END COMPONENT;


-- ***************************************************************************************************
COMPONENT Fetch_Unit is
Port	(
--
CK_25MHz 		: in  STD_LOGIC;
RESET_in 		: in  STD_LOGIC;
HOLD_in 		: in  STD_LOGIC;
-- IMem signals
MIPS_IMem_adrs	: out STD_LOGIC_VECTOR (31 downto 0); 
MIPS_IMem_rd_data : in STD_LOGIC_VECTOR (31 downto 0); 
--rdbk signals
rdbk0			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk1			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk2			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk3			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk4			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk5			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk6			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk7			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk8			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk9			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk10			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk11			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk12			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk13			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk14			:out  STD_LOGIC_VECTOR (31 downto 0); 
rdbk15			:out  STD_LOGIC_VECTOR (31 downto 0) 
 );
END COMPONENT;




-- *************************************************************************************************
-- **************************************************************************************************

-- signals connecting the components & inputs & external logic
-- ============================================================
-- Reset and CK signals
signal  CK    :STD_LOGIC :='0';
signal  RESET :STD_LOGIC :='0';-- The main RESET signal combined from switches in & MIPS_reset
signal  HOLD  :STD_LOGIC :='0';-- The main RESET signal combined from switches in & MIPS_reset
signal  RESET_from_Host_Intf  :STD_LOGIC;-- is coming from the BYOC_Host_intf




-- Flash data bus signals (used to connect to the Flash_data "inout" pin)
signal  data_from_Flash	: STD_LOGIC_VECTOR  (15 downto 0);
signal  data_to_Flash	: STD_LOGIC_VECTOR  (15 downto 0);
-- Flasn control signals
signal	Flash_ce_n_line : STD_LOGIC;
signal	Flash_we_n_line : STD_LOGIC;
signal	Flash_oe_n_line : STD_LOGIC;

signal	Flash_rp_n_in_BYOC	: 	STD_LOGIC;-- '0' when reseting Flash mem
signal	Flash_sts_in_BYOC	: 	STD_LOGIC;-- '1' when Flash mem FSM is done

signal	leds_out_from_host_intf	: STD_LOGIC_VECTOR  (7 downto 0);-- 7=Flash_stts, 6=MIPS_ck ??, 5-0=Host_intf version




--- ============================================================================
-- Your design signals
--- ============================================================================
-- IMem signals
signal IMem_adrs 	: STD_LOGIC_VECTOR (31 downto 0);
signal IMem_rd_data	: STD_LOGIC_VECTOR (31 downto 0);
--
-- rdbk signals
signal rdbk0_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk1_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk2_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk3_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk4_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk5_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk6_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk7_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk8_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk9_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk10_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk11_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk12_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk13_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk14_line	: STD_LOGIC_VECTOR (31 downto 0);
signal rdbk15_line	: STD_LOGIC_VECTOR (31 downto 0);
--


begin


-- ***************************************************************************************************
-- Component connections 
-- ============================================================================
-- Connect all components used:  Clock_Driver, BYOC_Host_intf,  your components ... (in HW2 it is the Fetch_Unit only)
-- ===========================================================================

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
Port Map(	
--=========================The student's part=================================
-- MIPS signals    [to be used by students]
MIPS_reset			=>		RESET_from_host_intf, -- The Host_intf drives the RESET signal
MIPS_hold			=>		HOLD,	-- The Host_intf also drives the HOLD signal
-- MIPS IMem signals
MIPS_IMem_adrs		=>		IMem_adrs,		-- driven by the Fetch_Unit
MIPS_IMem_rd_data	=>		IMem_rd_data,	-- driven by the Host_intf and sent to the Fetch_Unit
-- MIPS DMem signals
MIPS_DMem_we		=>		'0',         -- do not write to DMem -- DMem_we,	-- '1' if we want to write into DMem at the next rising edge of the MIPS_ck (for sw instruction)
MIPS_DMem_adrs		=>		x"10000005", -- DMem address stays 10000005h --DMem_adrs,	-- driven by the ALUout_reg = The address to DMem 
MIPS_DMem_wr_data	=>		x"00000000", -- DMem_wr_data=00000000h --DMem_wr_data,	-- The data to be written into DMem_adrs in sw instruction 	
MIPS_DMem_rd_data	=>		open,        -- do not connect DMem_rd_data --DMem_rd_data,	-- The data read from DMem_adrs in lw instruction. It is registered, i.e.= the MDR data 
--
--============================Other signals to be directed to i/o pins==============================
--Flash Mem signals
Flash_adrs 			=>		Flash_adrs,
Flash_ce_n			=>		Flash_ce_n_line,
Flash_we_n			=>		Flash_we_n_line,
Flash_oe_n			=>		Flash_oe_n_line,
Flash_rp_n			=>		Flash_rp_n_in_BYOC,
Flash_sts			=>		Flash_sts,
Flash_rd_data		=>		data_from_Flash,
Flash_wr_data		=>		data_to_Flash,
---
-- Infrastructure signals [To be used by PC via RS232 or from Nexys2 board switches & pushbuttons and VGA signals to the screen],
-- Host intf signals
RS232_Rx			=>		RS232_Rx,
RS232_Tx			=>		RS232_Tx,
-- VGA signals
VGA_h_sync			=>		VGA_h_sync,
VGA_v_sync			=>		VGA_v_sync,
VGA_red0			=>		VGA_red0,
VGA_red1			=>		VGA_red1,
VGA_red2			=>		VGA_red2,
VGA_grn0			=>		VGA_grn0,
VGA_grn1			=>		VGA_grn1,
VGA_grn2			=>		VGA_grn2,
VGA_blu1			=>		VGA_blu1,
VGA_blu2			=>		VGA_blu2,
-- PS2 kbd signals
PS2_kbd_ck			=>		PS2C,
PS2_kbd_data		=>		PS2D,
---
-- general signals
CK_25MHz			=>		CK, -- CK_25MHz from the Clock_Driver
buttons_in			=>		buttons_in,
switches_in			=>		switches_in,
sevenseg_out		=>		sevenseg_out,
anodes_out			=>		anodes_out,
leds_out			=>		leds_out_from_host_intf,
---
--======================== additional part for the student ================================
-- RDBK signals
rdbk0 			 => 			rdbk0_line,
rdbk1 			 => 			rdbk1_line,
rdbk2 			 => 			rdbk2_line,
rdbk3 			 => 			rdbk3_line,
rdbk4 			 => 			rdbk4_line,
rdbk5			 => 			rdbk5_line,
rdbk6			 => 			rdbk6_line,
rdbk7			 => 			rdbk7_line,
rdbk8			 => 			rdbk8_line,
rdbk9			 => 			rdbk9_line,
rdbk10		 	 => 			rdbk10_line,
rdbk11			 => 			rdbk11_line,
rdbk12			 => 			rdbk12_line,
rdbk13			 => 			rdbk13_line,
rdbk14			 => 			rdbk14_line,
rdbk15			 => 			rdbk15_line
);

  
-- Connecting the Fetch_Unit
-- =============================================================
Fetch_unit_imp: Fetch_Unit
Port map  (	
--
CK_25MHz 	=>		CK,
RESET_in 	=>		RESET,
HOLD_in 	=>		HOLD,
-- IMem signals
MIPS_IMem_adrs	=>   IMem_adrs,
MIPS_IMem_rd_data => IMem_rd_data,
-- signals to be tested by the TB in simulation and also read by BYOCIntf SW via the BYOC_host_intf in implementation 
rdbk0		=>		rdbk0_line, 
rdbk1		=>		rdbk1_line, 
rdbk2		=>		rdbk2_line, 
rdbk3		=>		rdbk3_line, 
rdbk4		=>		rdbk4_line, 
rdbk5		=>		rdbk5_line, 
rdbk6		=>		rdbk6_line, 
rdbk7		=>		rdbk7_line, 
rdbk8		=>		rdbk8_line, 
rdbk9		=>		rdbk9_line, 
rdbk10		=>		rdbk10_line, 
rdbk11		=>		rdbk11_line, 
rdbk12		=>		rdbk12_line, 
rdbk13		=>		rdbk13_line, 
rdbk14		=>		rdbk14_line, 
rdbk15		=>		rdbk15_line 
  );

-- *************************************************************************************************
--
-- *************************************************************************************************
-- all signal equations
-- ============================================================================
-- List all the signals you use inside the HW2_top here.  
-- In out case these are made of:
--   1) signal connecting the BYOC_Host_Intf to the external world
--   2) General signals  (note that CK is derived directly by the Clock_driver and RESET and HOLD are drived directly by the BYOC_Host_Intf)
--   3) Inner connections inside the HW2_top (in our case these are the 16 vectors rdbk9_line - rdbk15_line which connect the Fetch_Unit rdbk
--                                            signals to the TB and the BYOC_Host_Intf, and CK,RESET & HOLD to the TB.
--                                            The IMem adrs & data signals are connected directly between the Fetch_Unit and the BYOC_Host_Intf)
-- ============================================================================



-- 1) Signals to external components 
-- ==================================
-- disconnecting the Mobile SRAM
MT_ce_n <= '1';-- making sure that the SRAM is not active

-- connecting Flash_data bi-dir signal
data_from_Flash	<= Flash_data;
Flash_data <= data_to_Flash	when (Flash_oe_n_line ='1' and Flash_ce_n_line='0') else (others => 'Z');

-- connecting additional Flash signals
Flash_ce_n <= Flash_ce_n_line;
Flash_oe_n <= Flash_oe_n_line;
Flash_we_n <= Flash_we_n_line;

Flash_rp_n	<=	Flash_rp_n_in_BYOC and (not switches_in(4) );
Flash_sts_in_BYOC <= Flash_sts;

--leds_out(7) <=  Flash_sts_in_BYOC;
leds_out <=  Flash_sts_in_BYOC & leds_out_from_host_intf(6 downto 0);--- 7=Flash_stts, 6=MIPS_ck??, 5-0=Host_intf version


-- 2) General signals
--=========================
RESET  <=  switches_in(6)  or  RESET_from_Host_Intf;




-- 3) HW2 inner connections signals
-- ========================================
-- Connect signals to be tested by the TB
--CK_out_to_TB		 <=		CK;
--RESET_out_to_TB		 <=		RESET;
--HOLD_out_to_TB		 <=		HOLD;
--
--rdbk0_out_to_TB 	 <=		rdbk0_line;
--rdbk1_out_to_TB 	 <=		rdbk1_line; 
--rdbk2_out_to_TB 	 <=		rdbk2_line;
--rdbk3_out_to_TB 	 <=		rdbk3_line;
--rdbk4_out_to_TB 	 <=		rdbk4_line;
--rdbk5_out_to_TB 	 <=		rdbk5_line;
--rdbk6_out_to_TB 	 <=		rdbk6_line;
--rdbk7_out_to_TB 	 <=		rdbk7_line;
--rdbk8_out_to_TB 	 <=		rdbk8_line;
--rdbk9_out_to_TB 	 <=		rdbk9_line;
--rdbk10_out_to_TB 	 <=		rdbk10_line;
--rdbk11_out_to_TB 	 <=		rdbk11_line;
--rdbk12_out_to_TB 	 <=		rdbk12_line;
--rdbk13_out_to_TB 	 <=		rdbk13_line;
--rdbk14_out_to_TB 	 <=  	rdbk14_line;
--rdbk15_out_to_TB 	 <=		rdbk15_line;



end Behavioral;

-- ***************************************************************************************************
-- **************************************************************************************************

