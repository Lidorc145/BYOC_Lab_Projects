library  ieee;
use  ieee.std_logic_1164.all;
use  ieee.std_logic_unsigned.all;
use  ieee.std_logic_arith.all;
use  ieee.numeric_std.all;

--library unisim;
--use unisim.vcomponents.all;

entity Clock_Driver is
port
 (
  CK_50MHz_IN			: in  std_logic ;
  CK_25MHz_OUT			: out std_logic
  );
end Clock_Driver;

architecture clock_divider of Clock_Driver is

SIGNAL  ck_in_signal   : STD_LOGIC;
SIGNAL  half_ck_signal : STD_LOGIC :='0' ;
SIGNAL  ck_out_signal  : STD_LOGIC;
 
begin

ck_in_signal	<=	CK_50MHz_IN;   -- 50 MHz in
CK_25MHz_OUT	<=	ck_out_signal; -- 25MHz out

process(ck_in_signal)
begin
	if ck_in_signal'event and ck_in_signal='1' then
	  half_ck_signal	<= 	 not half_ck_signal;
	end if;
end process;


--CK_OUT_BUFG_INST  :  BUFG
--port map (I => half_ck_signal,
--          O => ck_out_signal) ;
ck_out_signal	<=	half_ck_signal; -- a bypass instead of BUFG for Modelsim simulation 
  
end clock_divider;