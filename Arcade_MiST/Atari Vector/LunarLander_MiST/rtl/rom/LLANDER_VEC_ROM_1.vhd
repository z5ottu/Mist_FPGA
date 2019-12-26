library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity LLANDER_VEC_ROM_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of LLANDER_VEC_ROM_1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"44",X"C8",X"4C",X"C8",X"52",X"C8",X"56",X"C8",X"00",X"D0",X"5B",X"C8",X"62",X"C8",X"00",X"D0",
		X"68",X"C8",X"6F",X"C8",X"00",X"D0",X"7C",X"C8",X"82",X"C8",X"86",X"C8",X"4C",X"C8",X"00",X"D0",
		X"8D",X"C8",X"62",X"C8",X"00",X"D0",X"92",X"C8",X"98",X"C8",X"9D",X"C8",X"00",X"D0",X"5B",X"C8",
		X"A6",X"C8",X"D1",X"C8",X"AD",X"C8",X"00",X"D0",X"44",X"C8",X"86",X"C8",X"B2",X"C8",X"00",X"D0",
		X"6F",X"C8",X"AA",X"F8",X"4C",X"C8",X"AA",X"F8",X"C4",X"C8",X"00",X"D0",X"56",X"C8",X"4C",X"C8",
		X"7C",X"C8",X"56",X"C8",X"AA",X"FE",X"00",X"D0",X"BC",X"C8",X"82",X"C8",X"68",X"C8",X"00",X"D0",
		X"B2",X"C8",X"C4",X"C8",X"86",X"C8",X"00",X"60",X"00",X"A2",X"00",X"D0",X"C9",X"C8",X"CE",X"C8",
		X"00",X"D0",X"A6",X"C8",X"AA",X"F8",X"9D",X"C8",X"AA",X"F8",X"92",X"C8",X"00",X"D0",X"8D",X"C8",
		X"D1",X"C8",X"AD",X"C8",X"AA",X"FA",X"00",X"D0",X"AA",X"F8",X"00",X"56",X"80",X"A0",X"AA",X"F8",
		X"00",X"56",X"80",X"A0",X"A9",X"F8",X"00",X"D0",X"00",X"67",X"40",X"A0",X"00",X"67",X"C0",X"A0",
		X"A8",X"FE",X"00",X"D0",X"00",X"66",X"80",X"A0",X"AB",X"FE",X"00",X"D0",X"00",X"66",X"80",X"A0",
		X"A9",X"FE",X"AA",X"FE",X"00",X"D0",X"AA",X"F8",X"AA",X"FA",X"80",X"53",X"00",X"A2",X"80",X"52",
		X"00",X"A2",X"00",X"D0",X"AA",X"FA",X"A9",X"FA",X"AA",X"FA",X"A9",X"FA",X"AA",X"F9",X"00",X"D0",
		X"AA",X"FB",X"80",X"50",X"00",X"A2",X"80",X"51",X"00",X"A2",X"AA",X"F8",X"00",X"D0",X"80",X"54",
		X"00",X"A2",X"80",X"55",X"00",X"A2",X"00",X"56",X"80",X"A0",X"00",X"56",X"80",X"A1",X"00",X"56",
		X"80",X"A0",X"00",X"56",X"80",X"A1",X"00",X"D0",X"00",X"56",X"80",X"A0",X"00",X"56",X"80",X"A1",
		X"AA",X"F8",X"00",X"D0",X"00",X"62",X"C0",X"A0",X"AB",X"F2",X"00",X"D0",X"AB",X"F6",X"00",X"56",
		X"80",X"A1",X"00",X"66",X"80",X"A0",X"AB",X"FE",X"00",X"D0",X"AA",X"FE",X"00",X"60",X"00",X"A2",
		X"AA",X"FA",X"00",X"D0",X"80",X"62",X"80",X"A0",X"00",X"62",X"80",X"A0",X"AA",X"F9",X"00",X"D0",
		X"AA",X"FA",X"AA",X"FB",X"00",X"62",X"00",X"A1",X"00",X"D0",X"00",X"62",X"80",X"A0",X"AA",X"FA",
		X"A9",X"FA",X"00",X"52",X"80",X"A0",X"00",X"52",X"80",X"A1",X"00",X"D0",X"00",X"62",X"80",X"A0",
		X"00",X"63",X"80",X"A0",X"00",X"62",X"00",X"A0",X"00",X"D0",X"00",X"52",X"80",X"A0",X"00",X"52",
		X"80",X"A1",X"00",X"D0",X"00",X"56",X"80",X"A0",X"80",X"67",X"40",X"A1",X"00",X"D0",X"00",X"70",
		X"00",X"A2",X"00",X"70",X"00",X"A2",X"00",X"D0",X"00",X"63",X"80",X"A0",X"00",X"62",X"00",X"A1",
		X"00",X"62",X"80",X"A0",X"A9",X"F8",X"00",X"D0",X"00",X"56",X"80",X"A0",X"00",X"56",X"80",X"A1",
		X"00",X"D0",X"40",X"64",X"00",X"A2",X"C0",X"64",X"00",X"A2",X"00",X"D0",X"00",X"70",X"00",X"A2",
		X"00",X"D0",X"00",X"62",X"40",X"A0",X"80",X"62",X"C0",X"A0",X"AA",X"F9",X"00",X"D0",X"AA",X"FA",
		X"00",X"62",X"80",X"A0",X"00",X"52",X"80",X"A2",X"00",X"D0",X"00",X"C8",X"05",X"C8",X"08",X"C8",
		X"0B",X"C8",X"10",X"C8",X"13",X"C8",X"17",X"C8",X"1C",X"C8",X"20",X"C8",X"26",X"C8",X"B7",X"C8",
		X"2C",X"C8",X"30",X"C8",X"36",X"C8",X"39",X"C8",X"3F",X"C8",X"00",X"C8",X"05",X"C8",X"08",X"C8",
		X"0B",X"C8",X"80",X"03",X"00",X"00",X"80",X"01",X"00",X"00",X"90",X"02",X"00",X"00",X"40",X"02",
		X"00",X"00",X"E0",X"00",X"00",X"00",X"70",X"01",X"00",X"00",X"60",X"03",X"00",X"00",X"A0",X"05",
		X"00",X"00",X"40",X"04",X"00",X"00",X"80",X"02",X"00",X"00",X"40",X"00",X"00",X"00",X"40",X"00",
		X"00",X"00",X"C0",X"01",X"00",X"00",X"60",X"00",X"00",X"00",X"40",X"00",X"00",X"00",X"80",X"02",
		X"00",X"00",X"68",X"03",X"68",X"01",X"78",X"02",X"28",X"02",X"C8",X"00",X"58",X"01",X"48",X"03",
		X"88",X"05",X"28",X"04",X"68",X"02",X"28",X"00",X"28",X"00",X"A8",X"01",X"48",X"00",X"28",X"00",
		X"68",X"02",X"92",X"00",X"00",X"62",X"00",X"02",X"88",X"F8",X"40",X"83",X"40",X"04",X"78",X"F8",
		X"00",X"70",X"00",X"03",X"88",X"F8",X"80",X"77",X"80",X"04",X"98",X"F8",X"00",X"86",X"80",X"00",
		X"00",X"D0",X"40",X"82",X"C0",X"00",X"98",X"F8",X"80",X"76",X"80",X"00",X"78",X"F8",X"00",X"76",
		X"00",X"02",X"00",X"D0",X"08",X"FA",X"98",X"F8",X"00",X"83",X"C0",X"00",X"78",X"F8",X"00",X"77",
		X"80",X"01",X"88",X"F8",X"80",X"77",X"00",X"01",X"00",X"D0",X"00",X"63",X"00",X"01",X"78",X"F8",
		X"80",X"73",X"00",X"00",X"98",X"F8",X"80",X"75",X"80",X"02",X"88",X"F8",X"80",X"77",X"00",X"01",
		X"00",X"D0",X"00",X"66",X"00",X"03",X"98",X"F8",X"00",X"72",X"00",X"01",X"88",X"F8",X"40",X"82",
		X"C0",X"04",X"98",X"F8",X"00",X"72",X"80",X"02",X"88",X"F8",X"C0",X"87",X"40",X"00",X"78",X"F8",
		X"00",X"D0",X"80",X"70",X"00",X"02",X"78",X"F8",X"80",X"82",X"80",X"00",X"98",X"F8",X"C0",X"86",
		X"80",X"00",X"00",X"D0",X"40",X"82",X"40",X"00",X"98",X"F8",X"80",X"73",X"00",X"03",X"88",X"F8",
		X"C0",X"87",X"80",X"04",X"78",X"F8",X"00",X"65",X"00",X"03",X"00",X"D0",X"00",X"72",X"00",X"01",
		X"88",X"F8",X"00",X"72",X"00",X"02",X"98",X"F8",X"00",X"86",X"80",X"00",X"00",X"D0",X"22",X"C9",
		X"3A",X"C9",X"51",X"C9",X"6A",X"C9",X"22",X"C9",X"3A",X"C9",X"51",X"C9",X"6A",X"C9",X"31",X"C9",
		X"45",X"C9",X"61",X"C9",X"76",X"C9",X"31",X"C9",X"45",X"C9",X"61",X"C9",X"76",X"C9",X"00",X"60",
		X"00",X"02",X"88",X"F8",X"40",X"87",X"00",X"01",X"68",X"F8",X"40",X"83",X"80",X"00",X"00",X"D0",
		X"00",X"92",X"00",X"00",X"8F",X"C9",X"00",X"96",X"00",X"00",X"00",X"D0",X"00",X"86",X"00",X"00",
		X"58",X"F8",X"80",X"82",X"C0",X"01",X"88",X"F8",X"00",X"73",X"80",X"00",X"00",X"D0",X"00",X"71",
		X"00",X"02",X"78",X"F8",X"E0",X"96",X"40",X"00",X"68",X"F8",X"40",X"82",X"80",X"00",X"88",X"F8",
		X"00",X"D0",X"40",X"92",X"80",X"00",X"58",X"F8",X"E0",X"97",X"60",X"00",X"88",X"F8",X"20",X"92",
		X"20",X"00",X"68",X"F8",X"00",X"D0",X"80",X"92",X"A0",X"00",X"78",X"F8",X"80",X"86",X"C0",X"00",
		X"88",X"F8",X"00",X"D0",X"40",X"83",X"40",X"01",X"58",X"F8",X"00",X"73",X"80",X"01",X"88",X"F8",
		X"00",X"D0",X"00",X"76",X"00",X"02",X"78",X"F8",X"C0",X"86",X"C0",X"00",X"88",X"F8",X"00",X"72",
		X"80",X"00",X"68",X"F8",X"00",X"D0",X"20",X"97",X"00",X"00",X"BB",X"C9",X"00",X"D0",X"00",X"73",
		X"00",X"00",X"A7",X"C9",X"00",X"D0",X"00",X"86",X"00",X"00",X"B1",X"C9",X"00",X"72",X"00",X"00",
		X"00",X"D0",X"80",X"77",X"00",X"00",X"BB",X"C9",X"00",X"D0",X"00",X"67",X"00",X"00",X"C9",X"C9",
		X"00",X"D0",X"80",X"83",X"80",X"01",X"68",X"F8",X"00",X"60",X"00",X"02",X"00",X"D0",X"E0",X"96",
		X"00",X"00",X"C2",X"C9",X"00",X"D0",X"00",X"77",X"00",X"00",X"BB",X"C9",X"00",X"D0",X"8F",X"C9",
		X"98",X"C9",X"9E",X"C9",X"A7",X"C9",X"B1",X"C9",X"BB",X"C9",X"C2",X"C9",X"C9",X"C9",X"D3",X"C9",
		X"D7",X"C9",X"DB",X"C9",X"E1",X"C9",X"E5",X"C9",X"E9",X"C9",X"EF",X"C9",X"F3",X"C9",X"8F",X"C9",
		X"98",X"C9",X"9E",X"C9",X"A7",X"C9",X"E0",X"04",X"00",X"00",X"E0",X"04",X"00",X"00",X"E0",X"04",
		X"00",X"00",X"E0",X"05",X"00",X"00",X"60",X"04",X"00",X"00",X"E0",X"04",X"00",X"00",X"20",X"06",
		X"00",X"00",X"80",X"08",X"00",X"00",X"20",X"07",X"00",X"00",X"40",X"05",X"00",X"00",X"80",X"04",
		X"00",X"00",X"80",X"04",X"00",X"00",X"E0",X"04",X"00",X"00",X"20",X"03",X"00",X"00",X"E0",X"04",
		X"00",X"00",X"60",X"04",X"00",X"00",X"2C",X"CA",X"EC",X"A2",X"64",X"00",X"00",X"70",X"00",X"00",
		X"62",X"CB",X"F4",X"CA",X"44",X"CB",X"5A",X"CB",X"02",X"CB",X"93",X"CB",X"93",X"CB",X"E0",X"64",
		X"A0",X"06",X"69",X"CB",X"21",X"CB",X"39",X"CB",X"02",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",
		X"E0",X"64",X"A0",X"06",X"0A",X"CB",X"6F",X"CB",X"02",X"CB",X"34",X"CB",X"93",X"CB",X"93",X"CB",
		X"93",X"CB",X"70",X"80",X"40",X"03",X"DF",X"CA",X"34",X"CB",X"69",X"CB",X"21",X"CB",X"69",X"CB",
		X"6F",X"CB",X"FA",X"CA",X"02",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",
		X"93",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",X"70",X"74",X"60",X"07",X"1A",X"CB",
		X"44",X"CB",X"5A",X"CB",X"21",X"CB",X"8D",X"CB",X"44",X"CB",X"3F",X"CB",X"69",X"CB",X"DF",X"CA",
		X"34",X"CB",X"93",X"CB",X"62",X"CB",X"4A",X"CB",X"02",X"CB",X"02",X"CB",X"FA",X"CA",X"93",X"CB",
		X"93",X"CB",X"70",X"74",X"60",X"07",X"75",X"CB",X"02",X"CB",X"5A",X"CB",X"69",X"CB",X"21",X"CB",
		X"F4",X"CA",X"DF",X"CA",X"34",X"CB",X"93",X"CB",X"62",X"CB",X"4A",X"CB",X"02",X"CB",X"02",X"CB",
		X"FA",X"CA",X"93",X"CB",X"93",X"CB",X"93",X"CB",X"93",X"CB",X"00",X"D0",X"40",X"A2",X"B2",X"01",
		X"60",X"A2",X"BE",X"01",X"60",X"A2",X"88",X"01",X"10",X"A2",X"76",X"01",X"80",X"A2",X"4C",X"01",
		X"20",X"A2",X"A6",X"01",X"D0",X"A1",X"BE",X"01",X"10",X"A2",X"C4",X"01",X"E0",X"A1",X"A6",X"01",
		X"20",X"A2",X"10",X"01",X"00",X"A2",X"70",X"01",X"00",X"A2",X"4C",X"01",X"EC",X"A2",X"C8",X"00",
		X"00",X"70",X"00",X"00",X"C0",X"55",X"00",X"07",X"D9",X"CA",X"C0",X"55",X"80",X"07",X"38",X"90",
		X"3C",X"02",X"E0",X"64",X"40",X"06",X"E0",X"64",X"40",X"06",X"B3",X"CA",X"BB",X"CA",X"08",X"F8",
		X"C3",X"CA",X"CC",X"CA",X"08",X"F8",X"80",X"42",X"80",X"01",X"CB",X"F0",X"C7",X"F3",X"80",X"36",
		X"00",X"C0",X"C3",X"F3",X"00",X"D0",X"40",X"51",X"40",X"02",X"CF",X"F0",X"C3",X"F3",X"80",X"36",
		X"00",X"C0",X"C7",X"F3",X"00",X"D0",X"40",X"46",X"00",X"03",X"C8",X"F3",X"C7",X"F7",X"C3",X"F8",
		X"C7",X"F3",X"C0",X"44",X"00",X"07",X"00",X"D0",X"C0",X"40",X"00",X"03",X"C8",X"F7",X"C7",X"F3",
		X"C3",X"F8",X"C7",X"F7",X"40",X"42",X"00",X"07",X"00",X"D0",X"C2",X"A2",X"78",X"03",X"00",X"70",
		X"00",X"00",X"01",X"F2",X"70",X"F0",X"00",X"F2",X"70",X"F0",X"01",X"FE",X"00",X"D0",X"C0",X"FA",
		X"C2",X"F2",X"C2",X"F6",X"C0",X"FE",X"06",X"F9",X"C2",X"F8",X"02",X"F6",X"00",X"D0",X"C0",X"FB",
		X"C3",X"F0",X"C1",X"F5",X"C0",X"F5",X"C5",X"F5",X"C7",X"F0",X"03",X"F0",X"C1",X"F5",X"C0",X"F5",
		X"C5",X"F5",X"C7",X"F0",X"03",X"F8",X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"06",X"FF",X"C2",X"F8",
		X"02",X"F0",X"00",X"D0",X"C0",X"FB",X"C2",X"F0",X"C2",X"F6",X"C0",X"F6",X"C6",X"F6",X"C6",X"F0",
		X"03",X"F8",X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"05",X"F7",X"C7",X"F0",X"00",X"F7",X"C2",X"F8",
		X"02",X"F0",X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"05",X"F7",X"C7",X"F0",X"00",X"F7",X"03",X"F8",
		X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"C0",X"F6",X"06",X"F6",X"C2",X"F0",X"C0",X"F6",X"C6",X"F8",
		X"03",X"F8",X"00",X"D0",X"C0",X"FB",X"00",X"F7",X"C2",X"F8",X"00",X"F3",X"C0",X"FF",X"02",X"F0",
		X"00",X"D0",X"C2",X"F8",X"06",X"F0",X"C0",X"FB",X"02",X"F0",X"C6",X"F8",X"03",X"FF",X"00",X"D0",
		X"00",X"F2",X"C2",X"F6",X"C2",X"F0",X"C0",X"FB",X"01",X"FF",X"00",X"D0",X"C0",X"FB",X"03",X"F0",
		X"C7",X"F7",X"C3",X"F7",X"03",X"F0",X"00",X"D0",X"00",X"FB",X"C0",X"FF",X"C2",X"F8",X"02",X"F0",
		X"00",X"D0",X"C0",X"FB",X"C2",X"F6",X"C2",X"F2",X"C0",X"FF",X"02",X"F0",X"00",X"D0",X"C0",X"FB",
		X"C2",X"FF",X"C0",X"FB",X"01",X"FF",X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"C0",X"FF",X"C6",X"F8",
		X"03",X"F8",X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"C0",X"F7",X"C6",X"F8",X"03",X"F7",X"03",X"F0",
		X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"C0",X"FE",X"C6",X"F6",X"C6",X"F0",X"02",X"F2",X"C2",X"F6",
		X"02",X"F0",X"00",X"D0",X"C0",X"FB",X"C2",X"F8",X"C0",X"F7",X"C6",X"F8",X"01",X"F0",X"C3",X"F7",
		X"02",X"F0",X"00",X"D0",X"C2",X"F8",X"C0",X"F3",X"C6",X"F8",X"C0",X"F3",X"C2",X"F8",X"01",X"FF",
		X"00",X"D0",X"02",X"F0",X"C0",X"FB",X"06",X"F0",X"C2",X"F8",X"01",X"FF",X"00",X"D0",X"00",X"FB",
		X"C0",X"FF",X"C2",X"F8",X"C0",X"FB",X"01",X"FF",X"00",X"D0",X"00",X"FB",X"C1",X"FF",X"C1",X"FB",
		X"01",X"FF",X"00",X"D0",X"00",X"FB",X"C0",X"FF",X"C2",X"F2",X"C2",X"F6",X"C0",X"FB",X"01",X"FF",
		X"00",X"D0",X"C2",X"FB",X"06",X"F8",X"C2",X"FF",X"02",X"F0",X"00",X"D0",X"02",X"F0",X"C0",X"FA",
		X"C6",X"F2",X"02",X"F8",X"C6",X"F6",X"02",X"FE",X"00",X"D0",X"00",X"FB",X"C2",X"F8",X"C6",X"FF",
		X"C2",X"F8",X"02",X"F0",X"00",X"D0",X"03",X"F8",X"00",X"D0",X"02",X"F0",X"C0",X"FB",X"02",X"FF",
		X"00",X"D0",X"00",X"FB",X"C2",X"F8",X"C0",X"F7",X"C6",X"F8",X"C0",X"F7",X"C2",X"F8",X"02",X"F0",
		X"00",X"D0",X"C2",X"F8",X"C0",X"FB",X"C6",X"F8",X"00",X"F7",X"C2",X"F8",X"02",X"F7",X"00",X"D0",
		X"00",X"FB",X"C0",X"F7",X"C2",X"F8",X"00",X"F3",X"C0",X"FF",X"02",X"F0",X"00",X"D0",X"C2",X"F8",
		X"C0",X"F3",X"C6",X"F8",X"C0",X"F3",X"C2",X"F8",X"01",X"FF",X"00",X"D0",X"00",X"F3",X"C2",X"F8",
		X"C0",X"F7",X"C6",X"F8",X"C0",X"FB",X"03",X"FF",X"00",X"D0",X"00",X"FB",X"C2",X"F8",X"C0",X"FF",
		X"02",X"F0",X"00",X"D0",X"C2",X"F8",X"C0",X"FB",X"C6",X"F8",X"C0",X"FF",X"00",X"F3",X"C2",X"F8",
		X"02",X"F7",X"00",X"D0",X"02",X"F8",X"C0",X"FB",X"C6",X"F8",X"C0",X"F7",X"C2",X"F8",X"02",X"F7",
		X"00",X"D0",X"93",X"CB",X"44",X"CB",X"95",X"CB",X"99",X"CB",X"A1",X"CB",X"A8",X"CB",X"AF",X"CB",
		X"B6",X"CB",X"BD",X"CB",X"C2",X"CB",X"CA",X"CB",X"DF",X"CA",X"E7",X"CA",X"F4",X"CA",X"FA",X"CA",
		X"02",X"CB",X"0A",X"CB",X"11",X"CB",X"1A",X"CB",X"21",X"CB",X"28",X"CB",X"2E",X"CB",X"34",X"CB",
		X"39",X"CB",X"3F",X"CB",X"44",X"CB",X"4A",X"CB",X"51",X"CB",X"5A",X"CB",X"62",X"CB",X"69",X"CB",
		X"6F",X"CB",X"75",X"CB",X"7A",X"CB",X"81",X"CB",X"86",X"CB",X"8D",X"CB",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"37");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;