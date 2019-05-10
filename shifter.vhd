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
	CONSTANT bl :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	
	SIGNAL HEX0_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX1_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX2_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX3_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX4_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	SIGNAL HEX5_int		 :STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111111";
	
	TYPE t_words IS ARRAY (59 DOWNTO 0) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL r_words : t_words :=(t, h, e, r, e, s,
								bl,a,bl,
								s, p, i, d, e, r,
								bl,i, n,bl,
								t, h, e,bl,
								b, a, n, a, n, a,
								bl,r, u, n,bl,
								a, n, d,bl,
								b, u, r, n,bl,
								t, h, e,bl,
								h, o, u, s, e,bl,
								r, e, e, e, e, e,bl);
	TYPE t_disp IS ARRAY (5 DOWNTO 0) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL r_disp : t_disp :=(t,h,e,r,e,s);
	
BEGIN
	shift : PROCESS(enable, clk, reset_n)
	BEGIN
		IF(reset_n = '0') THEN
			r_words <= (t, h, e, r, e, s,
								bl,a,bl,
								s, p, i, d, e, r,
								bl, i, n,bl,
								t, h, e,bl,
								b, a, n, a, n, a,
								bl,r, u, n,bl,
								a, n, d,bl,
								b, u, r, n,bl,
								t, h, e,bl,
								h, o, u, s, e,bl,
								r, e, e, e, e, e,bl);
		ELSE
			IF(enable = '1') THEN
				IF(rising_edge(clk)) THEN
					r_words(59 DOWNTO 1) <= r_words(58 DOWNTO 0);
					r_words(0) <= r_words(59);
					
					HEX5_int <= r_words(59);
					HEX4_int <= r_words(58);
					HEX3_int <= r_words(57);
					HEX2_int <= r_words(56);
					HEX1_int <= r_words(55);
					HEX0_int <= r_words(54);
					
				END IF;
			END IF;
		END IF;
	END PROCESS;
	HEX0 <= HEX0_int;
	HEX1 <= HEX1_int;
	HEX2 <= HEX2_int;
	HEX3 <= HEX3_int;
	HEX4 <= HEX4_int;
	HEX5 <= HEX5_int;

END model;