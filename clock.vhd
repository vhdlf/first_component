library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity clock is
port(
  clk: in std_logic;
  clk1s: out std_logic;
  clk500ms: out std_logic;
  clk200ms: out std_logic;
  clk100ms: out std_logic
);
end clock;


architecture bh of clock is
begin
  p1: process(clk)
  variable cnt1, cnt2, cnt3, cnt4: integer range 0 to 48000000;
  variable clk1, clk2, clk3, clk4: std_logic;
  begin
    if clk'event and clk='1' then
	   -- 1sec
	   if cnt1 < (48000000-1) then
		  cnt1 := cnt1 + 1;
		else
		  cnt1 := 0;
		  clk1 := not clk1;
		end if;
		
		-- 500ms
		if cnt2 < (24000000-1) then
		  cnt2 := cnt2 + 1;
		else
		  cnt2 := 0;
		  clk2 := not clk2;
		end if;
		
		-- 200ms
		if cnt3 < (9600000-1) then
		  cnt3 := cnt3 + 1;
		else
		  cnt3 := 0;
		  clk3 := not clk3;
		end if;
		
		-- 100ms
		if cnt4 < (4800000-1) then
		  cnt4 := cnt4 + 1;
		else
		  cnt4 := 0;
		  clk4 := not clk4;
		end if;
	 end if;
	 
	 clk1s <= clk1;
	 clk500ms <= clk2;
	 clk200ms <= clk3;
	 clk100ms <= clk4;
  end process;
end bh;
