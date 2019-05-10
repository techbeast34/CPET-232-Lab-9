--Satyendra Emani
--Lab 9: Vending Machine Message Displayer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Lab9 IS
	PORT(
	S		:IN STD_LOGIC; --0: sim mode, 1: FPGA mode
	clk		:IN STD_LOGIC; --Clock
	reset_n :IN STD_LOGIC; --Reset (Active Low)
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 :OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	--SSD Outputs
END Lab9;

ARCHITECTURE model OF Lab9 IS
	COMPONENT delay_unit
		PORT(
		max_value	:IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		clk			:IN STD_LOGIC;
		reset_n		:IN STD_LOGIC;
		flag		:OUT STD_LOGIC);
	END COMPONENT; --Underclock component
	
	COMPONENT shifter
		PORT(
		enable		:IN STD_LOGIC;
		clk 		:IN STD_LOGIC;
		reset_n		:IN STD_LOGIC;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 :OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT; --Message shifter component
	
	SIGNAL max_value_int :STD_LOGIC_VECTOR(25 DOWNTO 0);
	SIGNAL flag_int 	 :STD_LOGIC;
	
BEGIN
	
	mux : PROCESS(S)
	BEGIN
		CASE S IS
			WHEN '0' => max_value_int <= "00000000000000000000000101";--100ns
			WHEN '1' => max_value_int <= "10111110101111000010000000";--1s
			WHEN OTHERS => max_value_int <= "00000000000000000000000000";
		END CASE;
	END PROCESS; --Mux for selecting delay
	
	U1: delay_unit PORT MAP(max_value_int, clk, reset_n, flag_int);
	U2: shifter	PORT MAP(flag_int, clk, reset_n, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

END model;

