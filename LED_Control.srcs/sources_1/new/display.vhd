----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 22:36:06
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
    Port ( 
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            digit_i : in STD_LOGIC_VECTOR (31 downto 0);
            counter : buffer STD_LOGIC_VECTOR(16 downto 0);
            diode : buffer STD_LOGIC_VECTOR(2 downto 0);
            led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
            led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
        );
end display;

architecture Behavioral of display is

begin

process(clk_i,rst_i)
begin

    if(rst_i = '1') then
        counter <= (others => '0');
        diode <= "000";
        led7_an_o <= "0000";
        led7_seg_o <= "00000000";
    elsif rising_edge (clk_i) then
        counter <= counter + 1;
        if counter >= 99999 then
            counter <= (others => '0');
            diode <= diode + 1;
            if diode >= 3 then
                diode <= "000";
            end if;
        end if;
    
    if diode = "000" then
        led7_an_o <= "1110";
        led7_seg_o <= digit_i(7 downto 0);
      elsif diode = "001" then
        led7_an_o <= "1101";
        led7_seg_o <= digit_i(15 downto 8);
      elsif diode = "010" then
        led7_an_o <= "1011";
        led7_seg_o <= digit_i(23 downto 16);
      elsif diode = "011" then
        led7_an_o <= "0111";
        led7_seg_o <= digit_i(31 downto 24);
      else
        led7_an_o <= "1111";
        led7_seg_o <= "11111111";
        end if;
    end if;

end process;
    
end Behavioral;
