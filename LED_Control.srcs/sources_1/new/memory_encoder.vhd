----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 22:56:50
-- Design Name: 
-- Module Name: memory_encoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_encoder is
    Port ( 
            clk_i : in STD_LOGIC;
            btn_i : in STD_LOGIC_VECTOR (3 downto 0);
            sw_i : in STD_LOGIC_VECTOR (7 downto 0);
            digit_o : out STD_LOGIC_VECTOR (31 downto 0) := (others => '1')
        );
end memory_encoder;

architecture Behavioral of memory_encoder is

signal temp : std_logic_vector(6 downto 0) := "0000000";
signal state : std_logic_vector(3 downto 0) := "0000";

begin

    digit_o(0) <= NOT(sw_i(4)) when rising_edge(clk_i);
    digit_o(8) <= NOT(sw_i(5)) when rising_edge(clk_i);
    digit_o(16) <= NOT(sw_i(6)) when rising_edge(clk_i);
    digit_o(24) <= NOT(sw_i(7)) when rising_edge(clk_i);
    
    state <= sw_i(3 downto 0);
    with state select
    temp <= "0000001" when "0000",  -- 0
            "1111001" when "0001",  --1
            "0010010" when "0010",
            "0000110" when "0011",
            "1001100" when "0100",
            "0100100" when "0101",
            "0100000" when "0110",
            "0001111" when "0111",
            "0000000" when "1000",
            "0000100" when "1001",
            "0001000" when "1010",  -- A
            "0000000" when "1011",  -- B
            "0110001" when "1100",  -- C
            "0000001" when "1101",  -- D
            "0110000" when "1110",  -- E
            "0111000" when "1111",  -- F
            "1111111" when others;  -- This one is empty
            
    digit_o(7 downto 1) <= temp when rising_edge(clk_i) and btn_i(0) = '1';
    digit_o(15 downto 9) <= temp when rising_edge(clk_i) and btn_i(1) = '1';
    digit_o(23 downto 17) <= temp when rising_edge(clk_i) and btn_i(2) = '1';
    digit_o(31 downto 25) <= temp when rising_edge(clk_i) and btn_i(3) = '1'; 

end Behavioral;
