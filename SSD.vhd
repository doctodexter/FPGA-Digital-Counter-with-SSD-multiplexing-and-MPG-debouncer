library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity SSD is
    Port ( clk : in STD_LOGIC;
           digit0 : in std_logic_vector(3 downto 0);
           digit1 : in std_logic_vector(3 downto 0);
           digit2 : in std_logic_vector(3 downto 0);
           digit3 : in std_logic_vector(3 downto 0);
           digit4 : in std_logic_vector(3 downto 0);
           digit5 : in std_logic_vector(3 downto 0);
           digit6 : in std_logic_vector(3 downto 0);
           digit7 : in std_logic_vector(3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0));
end SSD;

architecture Behavioral of SSD is

signal cnt : std_logic_vector(16 downto 0) := (others => '0');
signal cnt_3 : std_logic_vector(2 downto 0) := (others => '0');

signal out_mux_1: std_logic;
 signal HEX: STD_LOGIC_VECTOR (3 downto 0);
   signal CATOD:  STD_LOGIC_VECTOR (6 downto 0);
   
begin

cnt_3 <= cnt(16 downto 14);

process(clk)
begin
    if rising_edge(clk) then
        cnt <= cnt + 1;
    end if;
end process;

--mux ANOZI
 process(cnt_3)
    begin
        case cnt_3 is
        when "000" => an <= "11111110";
        when "001" => an <= "11111101";
        when "010" => an <= "11111011";
        when "011" => an <= "11110111";
        when "100" => an <= "11101111";
        when "101" => an <= "11011111";
        when "110" => an <= "10111111";
        when others => an <= "01111111";
     end case;
    end process;
    
--mux HEX
    process(cnt_3)
        begin
        case cnt_3 is
            when "000" => HEX <= "0001";
            when "001" => HEX <= "0010";
            when "010" => HEX <= "0011";
            when "011" => HEX <= "0100";
            when "100" => HEX <= "0101";
            when "101" => HEX <= "0110";
            when "110" => HEX <= "0111";
            when others => HEX <= "1000";
        end case;
    end process;
--hex to 7 segment
    process(HEX)
    begin
    case HEX is
        when "0001" => CAT <= "1111001";
        when "0010" => CAT <= "0100100";
        when "0011" => CAT <= "0110000";
        when "0100" => CAT <= "0011001";
        when "0101" => CAT <= "0010010";
        when "0110" => CAT <= "0000010";
        when "0111" => CAT <= "1111000";
        when "1000" => CAT <= "0000000";
        when "1001" => CAT <= "0010000";
        when "1010" => CAT <= "0001000";
        when "1011" => CAT <= "0000011";
        when "1100" => CAT <= "1000110";
        when "1101" => CAT <= "0100001";
        when "1110" => CAT <= "0001110";
        when others => CAT <= "1000000";
     end case;
end process;
end Behavioral;
