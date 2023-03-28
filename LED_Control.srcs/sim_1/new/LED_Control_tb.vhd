----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2023 23:57:49
-- Design Name: 
-- Module Name: LED_Control_tb - Behavioral
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

entity sim_2 is
--  Port ( );
end sim_2;

architecture Behavioral of sim_2 is

signal clk_i : STD_LOGIC;
signal btn_i : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal sw_i : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

component LED_Control is
    Port ( clk_i : in STD_LOGIC;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component LED_Control;
begin

topm: LED_Control port map(
        clk_i => clk_i,
        btn_i => btn_i,
        sw_i => sw_i,
        led7_an_o => led7_an_o,
        led7_seg_o => led7_seg_o
    );
    
clocksim: process
  begin
    wait for 5 ns;
    clk_i <= '1';
    wait for 5 ns;
    clk_i <= '0';
end process;

--resetsim: process
--  begin
--    wait for 1 ms;
--    rst_i <= '1';
--    wait for 1 ms;
--    rst_i <= '0';
--    wait;
--end process;

swi_sim_1: process
  begin
    wait for 1500us;
    sw_i(3 downto 0) <= "0000";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0001";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0010";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0011";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0100";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0101";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0110";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "0111";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1000";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1001";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1010";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1011";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1100";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1101";
    
    wait for 1500us;
    sw_i(3 downto 0) <= "1111";
    
end process;

swi_sim_2: process
  begin
  wait for 1ms;
  sw_i(7 downto 4) <= "1100";
  
  wait for 10ms;
  sw_i(7 downto 4) <= "0011";
  
  wait for 10ms;
  sw_i(7 downto 4) <= "0100";
  
end process;
btn_sim: process
  begin
    
    btn_i(0) <= '1';
    wait for 1 ms;
    btn_i(0) <= '0';
    wait for 2 ms;
    
    btn_i(1) <= '1';
    wait for 1 ms;
    btn_i(1) <= '0';
    wait for 2 ms;
    
    btn_i(2) <= '1';
    wait for 1 ms;
    btn_i(2) <= '0';
    wait for 2 ms;
    
    btn_i(3) <= '1';
    wait for 1 ms;
    btn_i(3) <= '0';
    wait for 2 ms;
end process;

end Behavioral;