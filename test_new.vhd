library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_new is    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end test_new;

architecture Behavioral of test_new is
component test_env  Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           COUNT_OUT : OUT STD_LOGIC_VECTOR(2 downto 0 ));
end component;
signal dcd : STD_LOGIC_VECTOR (7 downto 0);
signal count : STD_LOGIC_VECTOR(2 downto 0);
begin
COUNTER: test_env port map(clk,btn,SW,LED,count);
process(count)
begin
    case count is
        when "000" => dcd <= "00000001";
        when "001" => dcd <= "00000010";
        when "010" => dcd <= "00000100";
        when "011" => dcd <= "00001000";
        when "100" => dcd <= "00010000";
        when "101" => dcd <= "00100000";
        when "110" => dcd <= "01000000";
        when others => dcd <= "10000000";
    end case;
end process;
--led(7 downto 0) <= dcd;
end Behavioral;
