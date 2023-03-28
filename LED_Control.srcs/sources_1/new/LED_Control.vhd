----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2023 23:55:03
-- Design Name: 
-- Module Name: LED_Control - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Control is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end LED_Control;

architecture Behavioral of LED_Control is

signal rst_i : std_logic := '0';
signal counter : std_logic_vector(16 downto 0) := (others => '0');      
signal diode : std_logic_vector(2 downto 0) := (others => '0');

component display is
    Port ( 
        clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        digit_i : in STD_LOGIC_VECTOR (31 downto 0);
        diode : buffer STD_LOGIC_VECTOR(2 downto 0);
        counter : buffer STD_LOGIC_VECTOR(16 downto 0);
        led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
        led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component display;

component memory_encoder is
    Port ( 
            clk_i : in STD_LOGIC;
            btn_i : in STD_LOGIC_VECTOR (3 downto 0);
            sw_i : in STD_LOGIC_VECTOR (7 downto 0);
            digit_o : out STD_LOGIC_VECTOR (31 downto 0)
        );
end component memory_encoder;

signal digit : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

dpm: entity work.display port map(
    clk_i => clk_i,
    rst_i => rst_i,
    digit_i => digit,
    led7_an_o => led7_an_o,
    led7_seg_o => led7_seg_o,
    counter => counter,
    diode => diode
);
    
demm: entity work.memory_encoder port map(
    clk_i => clk_i,
    digit_o => digit,
    btn_i => btn_i,
    sw_i => sw_i
);

end Behavioral;
