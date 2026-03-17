library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);
        COUNT_OUT : out STD_LOGIC_VECTOR (2 downto 0));
end test_env;

architecture Behavioral of test_env is
signal count : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
signal mpg_en : STD_LOGIC;
component MPG 
    port(
        CLK : in STD_LOGIC;
        BTN : in STD_LOGIC;
        EN : OUT STD_LOGIC);
end component;
component SSD 
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
end component;
begin
C1: MPG port map(clk,btn(0),mpg_en);
--C2: SSD port map(clk,cat,an);
process(clk)
begin
if rising_edge(clk) then
if mpg_en='1' then
if SW(0)='1' then
count <= count + 1;
else
count <= count - 1;
end if;
end if;
end if;

end process;
COUNT_OUT <= count(2 downto 0);
end Behavioral;
