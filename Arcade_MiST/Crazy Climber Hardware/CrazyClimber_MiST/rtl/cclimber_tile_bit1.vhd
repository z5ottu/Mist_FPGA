library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity cclimber_tile_bit1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of cclimber_tile_bit1 is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"1C",X"26",X"63",X"63",X"63",X"32",X"1C",X"00",X"0C",X"1C",X"0C",X"0C",X"0C",X"0C",X"3F",X"00",
		X"3E",X"63",X"07",X"1E",X"3C",X"70",X"7F",X"00",X"3F",X"06",X"0C",X"1E",X"03",X"63",X"3E",X"00",
		X"0E",X"1E",X"36",X"66",X"7F",X"06",X"06",X"00",X"3E",X"30",X"3E",X"03",X"03",X"33",X"1E",X"00",
		X"1E",X"30",X"60",X"7E",X"63",X"63",X"3E",X"00",X"3F",X"23",X"06",X"0C",X"18",X"18",X"18",X"00",
		X"3C",X"62",X"72",X"3C",X"4F",X"43",X"3E",X"00",X"3E",X"63",X"63",X"3F",X"03",X"06",X"3C",X"00",
		X"1C",X"36",X"63",X"63",X"7F",X"63",X"63",X"00",X"7E",X"63",X"63",X"7E",X"63",X"63",X"7E",X"00",
		X"1E",X"33",X"60",X"60",X"60",X"33",X"1E",X"00",X"7C",X"66",X"63",X"63",X"63",X"66",X"7C",X"00",
		X"3F",X"30",X"30",X"3E",X"30",X"30",X"3F",X"00",X"7F",X"60",X"60",X"7E",X"60",X"60",X"60",X"00",
		X"1F",X"30",X"60",X"67",X"63",X"33",X"1F",X"00",X"63",X"63",X"63",X"7F",X"63",X"63",X"63",X"00",
		X"3F",X"0C",X"0C",X"0C",X"0C",X"0C",X"3F",X"00",X"03",X"03",X"03",X"03",X"03",X"63",X"3E",X"00",
		X"63",X"66",X"6C",X"78",X"7C",X"6E",X"67",X"00",X"30",X"30",X"30",X"30",X"30",X"30",X"3F",X"00",
		X"63",X"77",X"7F",X"7F",X"6B",X"63",X"63",X"00",X"63",X"73",X"7B",X"7F",X"6F",X"67",X"63",X"00",
		X"3E",X"63",X"63",X"63",X"63",X"63",X"3E",X"00",X"7E",X"63",X"63",X"63",X"7E",X"60",X"60",X"00",
		X"3E",X"63",X"63",X"63",X"6F",X"66",X"3D",X"00",X"7E",X"63",X"63",X"67",X"7C",X"6E",X"67",X"00",
		X"3C",X"66",X"60",X"3E",X"03",X"63",X"3E",X"00",X"3F",X"0C",X"0C",X"0C",X"0C",X"0C",X"0C",X"00",
		X"63",X"63",X"63",X"63",X"63",X"63",X"3E",X"00",X"63",X"63",X"63",X"77",X"3E",X"1C",X"08",X"00",
		X"63",X"63",X"6B",X"7F",X"7F",X"36",X"22",X"00",X"63",X"77",X"3E",X"1C",X"3E",X"77",X"63",X"00",
		X"33",X"33",X"12",X"1E",X"0C",X"0C",X"0C",X"00",X"7F",X"07",X"0E",X"1C",X"38",X"70",X"7F",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1C",X"1C",X"1C",X"18",X"10",X"00",X"30",X"30",X"06",X"06",X"02",X"04",X"00",X"00",X"00",X"00",
		X"63",X"77",X"3E",X"1C",X"3E",X"77",X"63",X"00",X"00",X"00",X"00",X"3E",X"3E",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"30",X"30",X"00",X"00",X"30",X"30",X"00",X"00",X"30",X"30",X"00",
		X"00",X"7E",X"7E",X"00",X"7E",X"7E",X"00",X"00",X"00",X"00",X"00",X"00",X"66",X"66",X"02",X"04",
		X"C3",X"E3",X"F3",X"FB",X"DF",X"CF",X"C7",X"C3",X"60",X"67",X"0F",X"6C",X"6C",X"6C",X"6F",X"67",
		X"18",X"98",X"D8",X"5B",X"1F",X"59",X"D9",X"99",X"36",X"36",X"06",X"36",X"B7",X"B6",X"B7",X"B6",
		X"00",X"00",X"0C",X"CC",X"EC",X"2C",X"EF",X"C7",X"04",X"0C",X"DF",X"DF",X"CC",X"CC",X"CF",X"C7",
		X"00",X"3C",X"66",X"60",X"3C",X"06",X"66",X"3C",X"00",X"00",X"CC",X"CC",X"CC",X"CC",X"FC",X"7C",
		X"00",X"1F",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"FC",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"3F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"FC",X"F8",X"00",X"00",
		X"7D",X"65",X"65",X"7D",X"69",X"6D",X"6C",X"00",X"AC",X"AA",X"AA",X"AC",X"AA",X"AA",X"CC",X"00",
		X"7A",X"62",X"63",X"7A",X"62",X"62",X"7A",X"00",X"2C",X"2A",X"2A",X"AA",X"6A",X"2A",X"2C",X"00",
		X"80",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"01",X"01",X"01",X"01",X"01",X"01",X"01",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"FF",
		X"80",X"80",X"80",X"80",X"80",X"FF",X"00",X"00",X"01",X"01",X"01",X"01",X"01",X"FF",X"00",X"00",
		X"80",X"80",X"80",X"FF",X"00",X"00",X"00",X"00",X"01",X"01",X"01",X"FF",X"00",X"00",X"00",X"00",
		X"80",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"BD",X"BD",X"BD",X"BD",X"BD",X"BD",X"BD",X"BD",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"FF",X"FF",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",
		X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",
		X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"01",X"03",X"04",X"08",X"08",X"04",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"04",X"04",X"02",X"02",X"02",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"06",X"08",X"08",X"10",X"08",X"08",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"10",X"10",X"20",X"40",X"40",X"40",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"04",X"08",X"10",X"10",X"10",X"20",X"C0",
		X"04",X"08",X"08",X"08",X"10",X"20",X"40",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"06",X"09",X"10",X"E0",X"01",X"02",X"04",X"04",X"08",X"10",X"E0",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"D0",X"09",X"06",X"00",X"00",X"00",X"00",X"03",X"1C",X"E0",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"20",X"10",X"0C",X"02",X"00",X"00",X"00",X"08",X"10",X"20",X"20",X"40",X"16",
		X"00",X"00",X"00",X"00",X"02",X"04",X"00",X"08",X"08",X"40",X"28",X"14",X"02",X"00",X"00",X"00",
		X"00",X"41",X"21",X"00",X"00",X"00",X"00",X"08",X"00",X"08",X"80",X"A0",X"00",X"00",X"00",X"00",
		X"20",X"00",X"02",X"08",X"00",X"10",X"00",X"00",X"04",X"10",X"01",X"00",X"18",X"20",X"10",X"00",
		X"FC",X"F8",X"F4",X"FA",X"EC",X"F8",X"F4",X"FA",X"3C",X"78",X"B4",X"5A",X"3C",X"78",X"B4",X"5A",
		X"23",X"71",X"2A",X"71",X"23",X"71",X"2A",X"71",X"BA",X"BA",X"92",X"7C",X"38",X"28",X"28",X"6C",
		X"00",X"00",X"05",X"0E",X"1F",X"0F",X"00",X"00",X"00",X"E0",X"FA",X"7F",X"2C",X"90",X"F2",X"3F",
		X"33",X"7C",X"FD",X"33",X"00",X"03",X"00",X"00",X"67",X"D2",X"88",X"84",X"07",X"CF",X"06",X"00",
		X"02",X"03",X"03",X"11",X"08",X"0C",X"06",X"06",X"A0",X"E0",X"E0",X"C0",X"84",X"88",X"98",X"B8",
		X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"B0",X"A0",X"C0",X"80",X"00",X"00",X"00",X"00",
		X"41",X"33",X"1D",X"3C",X"5D",X"03",X"AC",X"7B",X"08",X"B4",X"D8",X"78",X"90",X"2C",X"FE",X"67",
		X"3B",X"55",X"00",X"00",X"00",X"00",X"00",X"00",X"9A",X"85",X"80",X"80",X"00",X"00",X"00",X"00",
		X"01",X"05",X"0F",X"0F",X"0F",X"1E",X"1D",X"1F",X"80",X"A0",X"A0",X"D0",X"D0",X"F0",X"F4",X"F4",
		X"0F",X"0D",X"07",X"06",X"00",X"00",X"00",X"00",X"F8",X"F8",X"E0",X"E0",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"0F",X"19",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"E0",X"30",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"03",X"0F",X"19",X"39",X"00",X"00",X"00",X"00",X"80",X"E0",X"30",X"38",
		X"3E",X"1F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"F0",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"03",X"0F",X"19",X"39",X"3F",X"17",X"18",X"00",X"80",X"E0",X"30",X"38",X"F8",X"D0",X"30",
		X"0F",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"E0",X"80",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"0F",X"19",X"39",X"3E",X"17",X"18",X"0F",X"03",X"E0",X"30",X"38",X"F8",X"D0",X"30",X"E0",X"80",
		X"03",X"00",X"08",X"9C",X"CE",X"FF",X"FF",X"FF",X"80",X"00",X"21",X"73",X"E7",X"FF",X"FF",X"FF",
		X"00",X"00",X"01",X"03",X"07",X"0F",X"0F",X"1F",X"00",X"00",X"80",X"C0",X"E0",X"F0",X"F0",X"D8",
		X"1F",X"17",X"17",X"0B",X"0D",X"07",X"03",X"00",X"F8",X"E8",X"E8",X"D0",X"90",X"20",X"C0",X"00",
		X"00",X"00",X"00",X"07",X"1F",X"37",X"3A",X"7D",X"00",X"00",X"00",X"60",X"30",X"7C",X"44",X"F6",
		X"76",X"71",X"69",X"32",X"12",X"01",X"00",X"00",X"FF",X"B2",X"7A",X"EC",X"60",X"40",X"80",X"80",
		X"00",X"06",X"07",X"3C",X"14",X"28",X"18",X"09",X"00",X"18",X"88",X"04",X"08",X"18",X"40",X"A4",
		X"02",X"04",X"66",X"7F",X"4B",X"3B",X"0C",X"00",X"3C",X"E6",X"D6",X"60",X"8C",X"1A",X"34",X"10",
		X"02",X"00",X"02",X"0C",X"00",X"02",X"28",X"8E",X"10",X"00",X"88",X"02",X"40",X"16",X"00",X"DE",
		X"16",X"58",X"00",X"FC",X"FF",X"5F",X"38",X"00",X"1E",X"2D",X"00",X"13",X"8D",X"3E",X"2E",X"08",
		X"00",X"00",X"01",X"01",X"02",X"02",X"02",X"02",X"80",X"40",X"40",X"40",X"40",X"C0",X"20",X"A0",
		X"04",X"04",X"02",X"02",X"01",X"00",X"00",X"00",X"50",X"B0",X"60",X"20",X"40",X"80",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"05",X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"60",
		X"05",X"1A",X"27",X"22",X"1C",X"00",X"00",X"00",X"50",X"B0",X"C8",X"74",X"6C",X"18",X"00",X"00",
		X"00",X"00",X"18",X"24",X"16",X"04",X"00",X"02",X"00",X"00",X"00",X"18",X"18",X"20",X"00",X"40",
		X"04",X"0C",X"18",X"78",X"B8",X"D8",X"60",X"00",X"30",X"1C",X"1E",X"2D",X"35",X"1A",X"04",X"00",
		X"00",X"00",X"00",X"0C",X"14",X"1C",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"08",X"10",X"00",
		X"00",X"00",X"00",X"30",X"E0",X"A0",X"40",X"00",X"00",X"00",X"10",X"0C",X"0A",X"06",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F0",X"FC",X"FF",X"FF",X"E1",X"E0",X"E0",X"E0",X"00",X"00",X"00",X"C0",X"FC",X"3E",X"2C",X"18",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"F0",X"FE",X"FF",X"FF",X"00",X"00",X"00",X"00",X"18",X"14",X"FC",X"FC",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"F0",X"FF",X"FF",X"FF",X"18",X"2C",X"3E",X"1C",X"38",X"F8",X"F0",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"2C",X"3E",X"1C",
		X"00",X"00",X"00",X"81",X"FF",X"FF",X"FF",X"E0",X"18",X"38",X"70",X"F0",X"E0",X"C0",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"18",X"2C",X"3E",X"7C",X"F0",X"E0",X"C0",X"80",
		X"0F",X"1E",X"3C",X"F8",X"F0",X"E0",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"FF",X"E7",X"EE",X"EC",X"FC",X"EE",X"FC",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"FC",X"FE",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1C",X"0E",X"3C",X"8E",X"E7",X"FB",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",
		X"00",X"00",X"00",X"00",X"1C",X"2E",X"3C",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"07",X"03",X"07",X"9F",X"FE",X"FC",X"F0",X"E0",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",
		X"1C",X"2E",X"3C",X"0C",X"0E",X"0E",X"06",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0F",X"0E",X"1C",X"BC",X"F8",X"F0",X"E0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"E0",X"E0",X"F0",X"F0",X"78",X"3C",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"F0",X"FC",X"00",X"00",
		X"E0",X"E0",X"E0",X"F0",X"F0",X"70",X"78",X"38",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3C",X"1C",X"1C",X"0E",X"0E",X"06",X"07",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"C0",
		X"E0",X"E0",X"F8",X"FC",X"FE",X"3E",X"1F",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0E",X"0E",X"1C",X"1C",X"18",X"39",X"3E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"E0",X"F8",X"FC",X"FE",X"3E",X"0F",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0E",X"1C",X"38",X"70",X"E0",X"70",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"FF",X"FF",X"FF",X"FF",X"07",X"0E",X"1C",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",
		X"38",X"70",X"30",X"1C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E3",X"FF",X"FF",X"FF",X"FB",X"E1",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"C0",X"C0",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"0F",X"1F",X"3F",X"7F",X"FF",X"FF",X"FF",
		X"03",X"03",X"07",X"07",X"2F",X"7F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"67",X"07",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"1F",X"1F",X"0F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"0F",X"0F",X"0F",X"0F",X"07",X"07",X"07",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"01",X"00",X"1F",X"3F",X"3E",X"07",X"10",X"0F",X"FF",X"FF",X"FF",X"FF",X"07",X"C1",X"60",X"F0",
		X"1F",X"17",X"2B",X"55",X"2B",X"43",X"33",X"19",X"F0",X"F8",X"FC",X"FE",X"FE",X"FE",X"FF",X"FF",
		X"F8",X"7E",X"FF",X"7F",X"FF",X"7F",X"03",X"00",X"7F",X"3E",X"3E",X"FC",X"FC",X"F8",X"F0",X"E0",
		X"1F",X"17",X"2B",X"55",X"2B",X"55",X"07",X"00",X"F8",X"FE",X"FF",X"FF",X"FF",X"E7",X"03",X"07",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"3F",X"7F",X"5F",X"15",X"15",X"04",
		X"1F",X"1F",X"37",X"5B",X"2D",X"57",X"07",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"E0",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"78",X"7C",X"7E",X"7E",X"00",X"00",X"00",X"00",X"1E",X"3E",X"7E",X"7E",
		X"3E",X"1C",X"00",X"00",X"06",X"06",X"00",X"00",X"7E",X"38",X"00",X"00",X"60",X"60",X"00",X"00",
		X"00",X"00",X"00",X"00",X"78",X"7C",X"7E",X"7E",X"00",X"00",X"00",X"00",X"1E",X"3E",X"7E",X"7E",
		X"3E",X"1C",X"00",X"0C",X"0E",X"0E",X"00",X"00",X"7C",X"38",X"00",X"30",X"70",X"70",X"00",X"00",
		X"C0",X"F0",X"F8",X"FC",X"FE",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"C0",X"C0",X"E0",X"E0",X"F4",X"FE",X"FE",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"E6",X"E0",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"F8",X"F0",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"F0",X"F0",X"F0",X"F0",X"E0",X"E0",X"E0",X"C0",
		X"FF",X"FF",X"FF",X"FF",X"E0",X"83",X"06",X"0F",X"80",X"00",X"F8",X"FC",X"7C",X"E0",X"08",X"F0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"C0",X"E0",X"E0",X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"80",X"00",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"80",X"FC",X"FF",X"FF",X"FF",X"0F",X"00",X"00",X"78",X"80",X"20",X"10",X"20",X"80",X"40",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"78",X"7C",X"7E",X"7E",X"00",X"00",X"00",X"00",X"1E",X"3E",X"7E",X"7E",
		X"3E",X"1C",X"00",X"00",X"06",X"06",X"00",X"00",X"7C",X"38",X"00",X"00",X"60",X"60",X"00",X"00",
		X"00",X"00",X"00",X"00",X"78",X"7C",X"7E",X"7E",X"00",X"00",X"00",X"00",X"1E",X"3E",X"7E",X"7E",
		X"3E",X"1C",X"00",X"00",X"06",X"06",X"00",X"00",X"7C",X"38",X"00",X"00",X"60",X"60",X"00",X"00",
		X"80",X"FF",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",X"01",X"FF",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",
		X"00",X"00",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"01",X"01",X"01",X"01",X"01",X"01",X"01",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"FF",
		X"80",X"80",X"80",X"80",X"80",X"FF",X"00",X"00",X"01",X"01",X"01",X"01",X"01",X"FF",X"00",X"00",
		X"80",X"80",X"80",X"FF",X"00",X"00",X"00",X"00",X"01",X"01",X"01",X"FF",X"00",X"00",X"00",X"00",
		X"80",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"DB",X"DB",X"DB",X"DB",X"3C",X"DB",X"DB",X"DB",
		X"FF",X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"FF",X"FF",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",
		X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",
		X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",
		X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"9F",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"CF",
		X"81",X"FF",X"81",X"FF",X"81",X"9F",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"CF",X"81",X"FF",
		X"81",X"FF",X"81",X"9F",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"CF",X"81",X"FF",X"81",X"FF",
		X"81",X"9F",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"CF",X"81",X"FF",X"81",X"FF",X"81",X"FF",
		X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"4E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"66",
		X"42",X"7E",X"42",X"7E",X"42",X"4E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"66",X"42",X"7E",
		X"42",X"7E",X"42",X"4E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"66",X"42",X"7E",X"42",X"7E",
		X"42",X"4E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"66",X"42",X"7E",X"42",X"7E",X"42",X"7E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"24",X"3C",X"24",X"3C",X"24",X"3C",X"24",X"24",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"24",X"3C",X"24",X"3C",X"24",X"24",X"24",X"3C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"24",X"3C",X"24",X"24",X"24",X"3C",X"24",X"3C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"24",X"24",X"24",X"3C",X"24",X"3C",X"24",X"3C",
		X"99",X"FF",X"99",X"FF",X"99",X"FF",X"99",X"9F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"99",X"FF",X"99",X"FF",X"99",X"9F",X"99",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"99",X"FF",X"99",X"9F",X"99",X"FF",X"99",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"99",X"9F",X"99",X"FF",X"99",X"FF",X"99",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"01",X"03",X"01",X"01",X"01",X"01",X"02",X"04",X"C0",X"E0",X"40",X"40",X"40",X"40",X"20",X"10",
		X"07",X"07",X"06",X"07",X"07",X"04",X"04",X"03",X"D0",X"50",X"D0",X"50",X"D0",X"10",X"10",X"E0",
		X"01",X"06",X"08",X"10",X"20",X"3F",X"3F",X"3F",X"80",X"60",X"10",X"08",X"04",X"FC",X"FC",X"FC",
		X"10",X"10",X"10",X"08",X"08",X"08",X"04",X"07",X"08",X"28",X"48",X"50",X"50",X"90",X"20",X"E0",
		X"02",X"05",X"02",X"03",X"03",X"02",X"05",X"0A",X"40",X"A0",X"40",X"C0",X"C0",X"40",X"A0",X"50",
		X"13",X"10",X"18",X"16",X"09",X"08",X"04",X"03",X"C8",X"08",X"18",X"68",X"90",X"10",X"20",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"01",X"00",X"0E",X"1E",X"1C",X"00",X"80",X"E0",X"80",
		X"04",X"07",X"07",X"07",X"07",X"07",X"01",X"00",X"20",X"E0",X"E0",X"E0",X"E0",X"E0",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"0F",X"19",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",X"E0",X"30",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"03",X"0F",X"19",X"39",X"00",X"00",X"00",X"00",X"80",X"E0",X"30",X"38",
		X"3E",X"1F",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",X"F8",X"F0",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",
		X"00",X"03",X"0F",X"19",X"39",X"3F",X"17",X"18",X"00",X"80",X"E0",X"30",X"38",X"F8",X"D0",X"30",
		X"0F",X"03",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",X"E0",X"80",X"FF",X"FF",X"AA",X"FF",X"FF",X"FF",
		X"0F",X"19",X"39",X"3E",X"17",X"18",X"0F",X"03",X"E0",X"30",X"38",X"F8",X"D0",X"30",X"E0",X"80",
		X"03",X"00",X"08",X"9C",X"8E",X"FF",X"FF",X"FF",X"80",X"00",X"21",X"73",X"E2",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"3C",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"3C",
		X"3C",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"3C",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"03",X"0F",X"3F",X"FC",X"03",X"0F",X"3F",X"FC",X"FC",X"FF",X"3F",X"3F",
		X"FC",X"FF",X"3F",X"3F",X"FC",X"F0",X"C0",X"00",X"FC",X"F0",X"C0",X"00",X"00",X"00",X"00",X"00",
		X"01",X"01",X"03",X"03",X"07",X"07",X"0E",X"0E",X"CE",X"CE",X"FC",X"FC",X"F8",X"F8",X"70",X"70",
		X"1C",X"1C",X"3F",X"3F",X"7F",X"7F",X"E7",X"E7",X"E0",X"E0",X"C0",X"C0",X"80",X"80",X"00",X"00",
		X"0E",X"0E",X"0F",X"0F",X"0F",X"0F",X"0E",X"0E",X"70",X"70",X"F0",X"F0",X"F0",X"F0",X"70",X"70",
		X"0E",X"0E",X"0F",X"0F",X"0F",X"0F",X"0E",X"0E",X"70",X"70",X"F0",X"F0",X"F0",X"F0",X"70",X"70",
		X"00",X"00",X"00",X"00",X"30",X"78",X"FC",X"FC",X"00",X"00",X"00",X"00",X"0C",X"1E",X"3F",X"3F",
		X"FC",X"FC",X"78",X"30",X"00",X"00",X"00",X"00",X"3F",X"3F",X"1E",X"0C",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"7C",X"00",X"00",X"0C",X"1E",X"3F",X"3F",X"3F",X"3F",
		X"FC",X"FC",X"FC",X"FC",X"78",X"30",X"00",X"00",X"1E",X"0C",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"01",X"01",X"00",X"00",X"00",X"70",X"F8",X"FC",X"FC",X"FC",X"FC",X"78",X"30",
		X"00",X"3C",X"7E",X"7F",X"7F",X"7F",X"3E",X"1C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"07",X"0F",X"0F",X"07",X"03",X"00",X"00",X"C0",X"E0",X"F0",X"F0",X"E0",X"C0",X"00",X"00",
		X"00",X"00",X"03",X"07",X"0F",X"0F",X"07",X"03",X"00",X"00",X"C0",X"E0",X"F0",X"F0",X"E0",X"C0",
		X"F0",X"F8",X"FC",X"FE",X"FF",X"FF",X"FF",X"F7",X"0F",X"0F",X"0F",X"0F",X"0F",X"8F",X"CF",X"EF",
		X"F3",X"F1",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"FF",X"FF",X"FF",X"7F",X"3F",X"1F",X"0F",X"0F",
		X"39",X"39",X"39",X"01",X"01",X"39",X"39",X"39",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"CC",X"DE",
		X"39",X"39",X"39",X"39",X"39",X"39",X"39",X"39",X"FF",X"CF",X"C7",X"C7",X"C7",X"C7",X"C7",X"C7",
		X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C7",
		X"1D",X"38",X"38",X"38",X"38",X"1D",X"1F",X"07",X"C7",X"E7",X"E7",X"E7",X"E7",X"C7",X"C7",X"07",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"78",X"FC",X"3C",X"1C",X"1C",X"1C",X"1C",X"1C",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"FE",X"FF",X"07",X"03",X"03",X"03",X"07",X"FF",X"00",X"00",X"80",X"C0",X"C0",X"C0",X"8E",X"0E",
		X"FF",X"07",X"03",X"03",X"03",X"07",X"FF",X"FE",X"0E",X"8E",X"CE",X"CE",X"CF",X"8F",X"07",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"38",X"39",X"00",X"00",X"00",X"00",X"00",X"00",X"FC",X"FE",
		X"39",X"39",X"38",X"38",X"38",X"F9",X"B9",X"38",X"86",X"C0",X"F8",X"7C",X"0E",X"86",X"FE",X"FC",
		X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"8F",
		X"61",X"70",X"3E",X"1F",X"03",X"61",X"7F",X"3F",X"9D",X"18",X"00",X"0F",X"98",X"98",X"9F",X"0E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"87",X"C7",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"78",
		X"C7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"E7",X"FC",X"3C",X"1C",X"1C",X"1C",X"1C",X"1C",X"1C",
		X"07",X"1F",X"3F",X"7C",X"78",X"F0",X"F0",X"F0",X"C0",X"E0",X"F0",X"78",X"38",X"00",X"00",X"00",
		X"F0",X"F0",X"F0",X"78",X"7C",X"3F",X"1F",X"07",X"00",X"01",X"01",X"39",X"79",X"F0",X"E0",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"38",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"EE",X"C7",X"C7",X"C7",X"C7",X"EE",X"FE",X"38",X"00",X"00",X"00",X"00",X"66",X"66",X"02",X"04",
		X"70",X"70",X"70",X"70",X"70",X"70",X"70",X"70",X"00",X"38",X"38",X"38",X"38",X"FE",X"FE",X"38",
		X"70",X"70",X"70",X"70",X"70",X"7F",X"7F",X"7F",X"38",X"38",X"38",X"38",X"38",X"38",X"1E",X"0E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0C",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",
		X"3E",X"7F",X"F1",X"E0",X"F1",X"7F",X"3E",X"0C",X"E0",X"E0",X"E0",X"E0",X"E3",X"E3",X"E0",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"FF",X"81",X"FF",
		X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"7E",X"42",X"7E",
		X"24",X"3C",X"24",X"3C",X"24",X"3C",X"24",X"3C",X"24",X"3C",X"24",X"3C",X"24",X"3C",X"24",X"3C",
		X"99",X"FF",X"99",X"FF",X"99",X"FF",X"99",X"FF",X"99",X"FF",X"99",X"FF",X"99",X"FF",X"99",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;