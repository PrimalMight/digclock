----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2022 23:45:25
-- Design Name: 
-- Module Name: time_comp_alarm - Behavioral
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

entity time_comp_alarm is
    Port ( 
           clk : std_logic;
           set_minute : in STD_LOGIC_VECTOR (5 downto 0);
           set_hour : in STD_LOGIC_VECTOR (4 downto 0);
           current_minute : in STD_LOGIC_VECTOR (5 downto 0);
           current_hour : in STD_LOGIC_VECTOR (4 downto 0);
           button_set : in std_logic;
           activate_sw_i : in STD_LOGIC;
           ring : out STD_LOGIC
           
           );
           
end time_comp_alarm;

architecture Behavioral of time_comp_alarm is
    
    signal memory_secs  : std_logic_vector(5 downto 0);
    signal memory_mins : std_logic_vector(5 downto 0);
    signal memory_hrs : std_logic_vector(4 downto 0);

begin
    alarm : process(clk)
    begin
        if(activate_sw_i = '1') then
               if(button_set = '1') then 
                    memory_mins <= set_minute;
                    memory_hrs <= set_hour;
               end if;
               if((memory_mins = current_minute) and (memory_hrs = current_hour)) then
                    ring <= '1';
               else
                    ring <= '0';
               end if;
      else
          ring <= '0';
      end if;
    end process;
    
end Behavioral;
