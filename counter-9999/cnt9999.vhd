library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity cnt9999 is
    Port ( clk,reset : in  STD_LOGIC;
           out1  : out  STD_LOGIC_VECTOR (6 downto 0);
           digit : out  STD_LOGIC_VECTOR (3 downto 0));
end cnt9999;

architecture Behavioral of cnt9999 is


signal clk1 : STD_LOGIC := '0';
signal clk_divider : integer := 0;
signal digit_counter : integer := 0;
signal digit_value : integer := 0;

signal cnt0 : integer := 0;
signal cnt1 : integer := 0;
signal cnt2 : integer := 0;
signal cnt3 : integer := 0;

begin

-- generate 1Hz clk
process(CLK, RESET)
begin
    if RESET = '1' then
        clk_divider <= 0;
        clk1 <= '0';
    elsif rising_edge(CLK) then
        clk_divider <= clk_divider + 1;
        if clk_divider = 50000000 then
            clk_divider <= 0;
            clk1 <= not clk1;
        end if;
    end if;
	 
end process;

-- 0 to 9999 integer counter 
process(clk1, RESET)
begin
    if RESET = '1' then
        cnt0 <= 0;
        cnt1 <= 0;
        cnt2 <= 0;
        cnt3 <= 0;
    elsif rising_edge(clk1) then
        cnt0 <= cnt0 + 1;
        if cnt0 = 10 then
            cnt0 <= 0;
            cnt1 <= cnt1 + 1;
            if cnt1 = 10 then
                cnt1 <= 0;
                cnt2 <= cnt2 + 1;
                if cnt2 = 10 then
                    cnt2 <= 0;
                    cnt3 <= cnt3 + 1;
                    if cnt3 = 10 then
                        cnt3 <= 0;
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

process(CLK, RESET)
begin
    if RESET = '1' then
        digit_counter <= 0;
		  DIGIT <= "0000" ;
		  out1 <= "0000000" ;
    elsif rising_edge(CLK) then
        digit_counter <= digit_counter + 1;
        if digit_counter = 50000 then 
            digit_counter <= 0;
            case digit_value is
					 when 0 =>
                    case cnt0 is 
								when 0 => out1 <= "1111110";
								when 1 => out1 <= "0110000";
								when 2 => out1 <= "1101101";
								when 3 => out1 <= "1111001";
								when 4 => out1 <= "0110011";
								when 5 => out1 <= "1011011";
								when 6 => out1 <= "1011111";
								when 7 => out1 <= "1110000";
								when 8 => out1 <= "1111111";
								when others => out1 <= "1111011";
								end case;
						  digit <= "0001";
                when 1 =>
                   case cnt1 is 
								when 0 => out1 <= "1111110";
								when 1 => out1 <= "0110000";
								when 2 => out1 <= "1101101";
								when 3 => out1 <= "1111001";
								when 4 => out1 <= "0110011";
								when 5 => out1 <= "1011011";
								when 6 => out1 <= "1011111";
								when 7 => out1 <= "1110000";
								when 8 => out1 <= "1111111";
								when others => out1 <= "1111011";
								end case;
						  digit <= "0010";
                when 2 =>
                    case cnt2 is 
								when 0 => out1 <= "1111110";
								when 1 => out1 <= "0110000";
								when 2 => out1 <= "1101101";
								when 3 => out1 <= "1111001";
								when 4 => out1 <= "0110011";
								when 5 => out1 <= "1011011";
								when 6 => out1 <= "1011111";
								when 7 => out1 <= "1110000";
								when 8 => out1 <= "1111111";
								when others => out1 <= "1111011";
								end case;
						  digit <="0100";
                when 3 =>
                    case cnt3 is 
								when 0 => out1 <= "1111110";
								when 1 => out1 <= "0110000";
								when 2 => out1 <= "1101101";
								when 3 => out1 <= "1111001";
								when 4 => out1 <= "0110011";
								when 5 => out1 <= "1011011";
								when 6 => out1 <= "1011111";
								when 7 => out1 <= "1110000";
								when 8 => out1 <= "1111111";
								when others => out1 <= "1111011";
								end case;
						  digit <= "1000";
                when others =>     
                    out1 <= "0000000" ;
						  digit <= "0000";
            end case;
                 digit_value <= digit_value + 1;
						if digit_value = 4 then
							 digit_value <= 0;
						end if;
        end if;
    end if;
end process;
end Behavioral;

