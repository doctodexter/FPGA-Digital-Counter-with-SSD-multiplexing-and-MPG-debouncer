library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MPG is
    Port ( CLK : in STD_LOGIC;
           BTN : in STD_LOGIC;
           EN : out STD_LOGIC);
end MPG;

architecture Behavioral of MPG is
signal cnt_int : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal Q : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
process(CLK)
begin
if rising_edge(CLK) then
cnt_int <= cnt_int + 1;
end if;
end process;

process(CLK)
begin
--counter
if rising_edge(CLK) then
if cnt_int(15 downto 0) = "1111111111111111" then
Q(0) <= BTN;
end if;
end if;
end process;

process(CLK)
begin
if rising_edge(CLK) then
Q(1) <= Q(0);
Q(2) <= Q(1);
end if;
end process;

en <= Q(1) AND (NOT Q(2));
end Behavioral;
