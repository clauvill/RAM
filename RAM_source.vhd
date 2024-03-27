----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:03:06 03/27/2024 
-- Design Name: 
-- Module Name:    RAM_ng - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_ng is
	generic( dwidth: integer :=32;
				awidth:	integer :=8	
						);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           wr : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (dwidth-1 downto 0);
           addr : in  STD_LOGIC_VECTOR (awidth downto 0);
           dout : out  STD_LOGIC_VECTOR (dwidth-1 downto 0));
end RAM_ng;

architecture Behavioral of RAM_ng is

type tipo_RAM is array (255 downto 0) of std_logic_vector (dwidth-1 downto 0);
signal RAM_sig: tipo_RAM ;

begin

process (clk)
begin
   if (clk'event and clk = '1') then
	if (rst = '1') then
for i in 0 to awidth-1 loop
   dout <= (others => '0');
end loop;
			
      if (en = '1') then 
         if (wr = '1') then
            RAM_sig(conv_integer(addr)) <= din;
         else
            dout <= RAM_sig(conv_integer(addr));
         end if;
      end if;
   end if;
end if;
end process;

						

end Behavioral;

