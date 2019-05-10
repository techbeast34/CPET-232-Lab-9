library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY shifter IS
	PORT(
		enable	:IN STD_LOGIC;
		clk		:IN STD_LOGIC;
		reset_n	:IN STD_LOGIC;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5	:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END shifter;

ARCHITECTURE model OF shifter IS
											   --6543210
	CONSTANT a :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001000";
	CONSTANT b :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000011";
	CONSTANT c :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000110";
	CONSTANT d :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100001";
	CONSTANT e :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110";
	CONSTANT f :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001110";
	CONSTANT g :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000010";
	CONSTANT h :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001011";
	CONSTANT i :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001111";
	CONSTANT j :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1100001";
	CONSTANT l :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1000111";
	CONSTANT n :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0101011";
	CONSTANT o :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100011";
	CONSTANT p :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001100";
	CONSTANT q :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0011000";
	CONSTANT r :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0101111";
	CONSTANT s :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010";
	CONSTANT t :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000111";
	CONSTANT u :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1100011";
	CONSTANT y :STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010001";
	
	CONSTANT blank :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";

	SIGNAL reg :STD_LOGIC_VECTOR(11 DOWNTO 0) := "100000000000";
	
	SIGNAL HEX0_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX1_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX2_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX3_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX4_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX5_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	
	TYPE t_words IS ARRAY (11 DOWNTO 0, 5 DOWNTO 0) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL r_words : t_words;
	
	r_words(11,5) <= t;
	r_words(11,4) <= h;
	r_words(11,3) <= e;
	r_words(11,2) <= r;
	r_words(11,1) <= e;
	r_words(11,0) <= s;
	
BEGIN
	
	shift : PROCESS(enable, reg, clk, reset_n)
	BEGIN
		IF(reset_n = '0') THEN
			reg <= "100000000000";
		ELSE
			IF(enable = '1') THEN
				IF(rising_edge(clk)) THEN
					reg(10) <= reg(11);
					reg(9) <= reg(10);
					reg(8) <= reg(9);
					reg(7) <= reg(8);
					reg(6) <= reg(7);
					reg(5) <= reg(6);
					reg(4) <= reg(5);
					reg(3) <= reg(4);
					reg(2) <= reg(3);
					reg(1) <= reg(2);
					reg(0) <= reg(1);
					reg(11) <= reg(0);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(reg, clk)
		BEGIN
			CASE reg IS
				WHEN "100000000000" =>
					HEX5_int <= r_words(11,5);
					HEX4_int <= h;
					HEX3_int <= e;
					HEX2_int <= r;
					HEX1_int <= e;
					HEX0_int <= s;
				WHEN "010000000000" =>
					HEX5_int <= a;
					HEX4_int <= blank;
					HEX3_int <= blank;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "001000000000" =>
					HEX5_int <= s;
					HEX4_int <= p;
					HEX3_int <= i;
					HEX2_int <= d;
					HEX1_int <= e;
					HEX0_int <= r;
				WHEN "000100000000" =>
					HEX5_int <= i;
					HEX4_int <= n;
					HEX3_int <= blank;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "000010000000" =>
					HEX5_int <= t;
					HEX4_int <= h;
					HEX3_int <= e;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "000001000000" =>
					HEX5_int <= b;
					HEX4_int <= a;
					HEX3_int <= n;
					HEX2_int <= a;
					HEX1_int <= n;
					HEX0_int <= a;
				WHEN "000000100000" =>
					HEX5_int <= r;
					HEX4_int <= u;
					HEX3_int <= n;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "000000010000" =>
					HEX5_int <= a;
					HEX4_int <= n;
					HEX3_int <= d;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "000000001000" =>
					HEX5_int <= b;
					HEX4_int <= u;
					HEX3_int <= r;
					HEX2_int <= n;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "000000000100" =>
					HEX5_int <= t;
					HEX4_int <= h;
					HEX3_int <= e;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
				WHEN "000000000010" =>
					HEX5_int <= h;
					HEX4_int <= o;
					HEX3_int <= u;
					HEX2_int <= s;
					HEX1_int <= e;
					HEX0_int <= blank;
				WHEN "000000000001" =>
					HEX5_int <= r;
					HEX4_int <= e;
					HEX3_int <= e;
					HEX2_int <= e;
					HEX1_int <= e;
					HEX0_int <= e;
				WHEN OTHERS =>
					HEX5_int <= blank;
					HEX4_int <= blank;
					HEX3_int <= blank;
					HEX2_int <= blank;
					HEX1_int <= blank;
					HEX0_int <= blank;
			END CASE;
	END PROCESS;
	
	HEX0 <= HEX0_int;
	HEX1 <= HEX1_int;
	HEX2 <= HEX2_int;
	HEX3 <= HEX3_int;
	HEX4 <= HEX4_int;
	HEX5 <= HEX5_int;

END model;