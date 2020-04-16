library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity top is
port(
  clk: in std_logic;
  led: out std_logic_vector(3 downto 0)
);
end top;


architecture bh of top is
component clock is
port(
  clk: in std_logic;
  clk1s: out std_logic;
  clk500ms: out std_logic;
  clk200ms: out std_logic;
  clk100ms: out std_logic
);
end component clock;
signal top_clk1s, top_clk500ms, top_clk200ms, top_clk100ms: std_logic;
begin
  clock1: clock port map(
    clk => clk,
	 clk1s => top_clk1s,
	 clk500ms => top_clk500ms,
	 clk200ms => top_clk200ms,
	 clk100ms => top_clk100ms
  );
  
  p1: process(top_clk1s)
  variable ledstatus: std_logic;
  begin
    if top_clk1s'event and top_clk1s='1' then
	   ledstatus := not ledstatus;
    end if;
	 led(3) <= ledstatus;
  end process;
  
  p2: process(top_clk500ms)
  variable ledstatus: std_logic;
  begin
    if top_clk500ms'event and top_clk500ms='1' then
	   ledstatus := not ledstatus;
	 end if;
	 led(2) <= ledstatus;
  end process;
  
  p3: process(top_clk200ms)
  variable ledstatus: std_logic;
  begin
    if top_clk200ms'event and top_clk200ms='1' then
	   ledstatus := not ledstatus;
	 end if;
	 led(1) <= ledstatus;
  end process;
  
  p4: process(top_clk100ms)
  variable ledstatus: std_logic;
  begin
    if top_clk100ms'event and top_clk100ms='1' then
	   ledstatus := not ledstatus;
	 end if;
	 led(0) <= ledstatus;
  end process;
end bh;
