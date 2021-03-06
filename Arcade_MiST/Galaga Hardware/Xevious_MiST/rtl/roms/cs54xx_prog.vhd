library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity cs54xx_prog is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(9 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of cs54xx_prog is
	type rom is array(0 to  1023) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"C6",X"C6",X"52",X"12",X"3D",X"06",X"58",X"80",X"90",X"1B",X"0A",X"CA",X"1B",X"71",X"B8",X"C9",
		X"3E",X"04",X"59",X"84",X"0D",X"1C",X"18",X"0D",X"1C",X"1A",X"0D",X"1C",X"1A",X"0D",X"1C",X"1A",
		X"0D",X"1C",X"1D",X"1C",X"83",X"2F",X"71",X"08",X"0A",X"0D",X"80",X"38",X"F8",X"23",X"01",X"88",
		X"20",X"08",X"0D",X"21",X"0E",X"1A",X"68",X"41",X"88",X"22",X"23",X"90",X"01",X"89",X"0D",X"0E",
		X"1A",X"0D",X"7F",X"68",X"90",X"58",X"19",X"68",X"90",X"59",X"86",X"19",X"68",X"90",X"08",X"19",
		X"68",X"90",X"08",X"19",X"0D",X"B1",X"D8",X"DF",X"B2",X"FF",X"90",X"85",X"1D",X"92",X"E6",X"5B",
		X"81",X"0D",X"59",X"85",X"1D",X"91",X"23",X"0C",X"04",X"5B",X"0D",X"B0",X"F5",X"50",X"08",X"0D",
		X"B0",X"F8",X"88",X"59",X"D3",X"50",X"08",X"0D",X"59",X"87",X"1A",X"50",X"1D",X"68",X"90",X"85",
		X"0D",X"7F",X"68",X"90",X"0D",X"23",X"1C",X"23",X"0E",X"1C",X"1D",X"91",X"88",X"1D",X"68",X"66",
		X"89",X"59",X"93",X"0F",X"B1",X"D8",X"8E",X"09",X"8A",X"0D",X"8E",X"38",X"DE",X"90",X"21",X"01",
		X"38",X"E5",X"89",X"20",X"E7",X"89",X"22",X"8D",X"0D",X"7F",X"68",X"FC",X"58",X"19",X"68",X"FC",
		X"59",X"8B",X"19",X"68",X"FC",X"08",X"19",X"68",X"FC",X"08",X"19",X"0D",X"B1",X"68",X"C0",X"C9",
		X"B2",X"68",X"EC",X"90",X"8A",X"1D",X"92",X"68",X"D0",X"5B",X"89",X"0D",X"59",X"8A",X"1D",X"91",
		X"23",X"0C",X"78",X"04",X"5B",X"0D",X"B0",X"68",X"E3",X"50",X"08",X"0D",X"B0",X"68",X"E6",X"59",
		X"8D",X"68",X"BA",X"50",X"08",X"0D",X"59",X"8C",X"1A",X"50",X"1D",X"FC",X"8A",X"0D",X"7F",X"FC",
		X"0D",X"23",X"1C",X"23",X"0E",X"1C",X"1D",X"91",X"8D",X"1D",X"68",X"D0",X"5A",X"8F",X"0D",X"8B",
		X"3B",X"C3",X"90",X"81",X"03",X"88",X"0D",X"8A",X"23",X"0E",X"1D",X"89",X"0D",X"8B",X"0E",X"1D",
		X"59",X"80",X"38",X"E1",X"5A",X"86",X"0D",X"23",X"8A",X"0E",X"1D",X"87",X"0D",X"8B",X"0E",X"1D",
		X"59",X"8F",X"0D",X"7F",X"68",X"12",X"5A",X"8C",X"19",X"68",X"12",X"08",X"19",X"68",X"12",X"08",
		X"19",X"68",X"12",X"8F",X"59",X"19",X"0D",X"B0",X"69",X"47",X"5A",X"0D",X"1C",X"23",X"0E",X"1C",
		X"1D",X"7F",X"68",X"12",X"91",X"59",X"1D",X"5A",X"84",X"0D",X"8D",X"1D",X"7F",X"D7",X"85",X"0D",
		X"8E",X"1D",X"8C",X"90",X"1D",X"68",X"12",X"85",X"0D",X"8E",X"1D",X"B0",X"E3",X"8F",X"1D",X"59",
		X"1D",X"68",X"12",X"90",X"8C",X"1D",X"68",X"12",X"1B",X"53",X"54",X"80",X"13",X"5A",X"8F",X"1D",
		X"54",X"53",X"1B",X"52",X"3E",X"04",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"00",X"00",X"00",X"69",X"C0",X"00",X"00",X"69",X"DC",X"00",X"00",X"6A",X"55",X"00",X"00",
		X"6A",X"5D",X"00",X"00",X"69",X"F9",X"00",X"00",X"6A",X"40",X"00",X"00",X"69",X"68",X"00",X"00",
		X"FC",X"00",X"00",X"00",X"FC",X"00",X"00",X"00",X"FC",X"00",X"00",X"00",X"FC",X"00",X"00",X"00",
		X"FC",X"00",X"00",X"00",X"FC",X"00",X"00",X"00",X"FC",X"00",X"00",X"00",X"52",X"3E",X"04",X"3C",
		X"1B",X"53",X"54",X"5B",X"80",X"0D",X"59",X"85",X"1D",X"88",X"93",X"1D",X"5B",X"87",X"0D",X"59",
		X"1A",X"5B",X"0D",X"59",X"1D",X"54",X"53",X"1B",X"52",X"3E",X"04",X"3C",X"1B",X"53",X"54",X"5B",
		X"88",X"0D",X"59",X"8A",X"1D",X"8D",X"93",X"0A",X"5B",X"0D",X"51",X"08",X"0D",X"59",X"8C",X"1A",
		X"51",X"1D",X"53",X"1B",X"52",X"54",X"3E",X"04",X"3C",X"1B",X"53",X"54",X"5A",X"81",X"0D",X"8C",
		X"1D",X"82",X"0D",X"8D",X"1D",X"83",X"0D",X"8E",X"1D",X"80",X"0D",X"8F",X"1D",X"92",X"59",X"1D",
		X"53",X"1B",X"52",X"54",X"3E",X"04",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1B",X"53",X"54",X"5A",X"89",X"55",X"3F",X"04",X"25",X"CB",X"C8",X"25",X"CB",X"80",X"13",X"55",
		X"1A",X"12",X"1A",X"55",X"E5",X"1B",X"53",X"54",X"87",X"55",X"3F",X"04",X"E5",X"1B",X"53",X"5B",
		X"54",X"8F",X"55",X"3F",X"04",X"25",X"E8",X"E5",X"25",X"E8",X"80",X"13",X"55",X"1A",X"12",X"1A",
		X"14",X"55",X"23",X"0C",X"BE",X"E5",X"53",X"1B",X"52",X"54",X"3E",X"04",X"3C",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
