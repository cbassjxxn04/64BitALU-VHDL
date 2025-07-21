library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Main_Ctrl_TB is
--  Port ( );
end Main_Ctrl_TB;

architecture Behavioral of Main_Ctrl_TB is
component Main_Ctrl
Port ( Reg_A,Reg_B  : in STD_LOGIC_VECTOR (63 downto 0);
           OpCode : in STD_LOGIC_VECTOR (3 downto 0);
           Carry_In : in STD_LOGIC;
           Carry_Out : OUT STD_LOGIC;
           ALU_Out : OUT STD_LOGIC_VECTOR (63 downto 0));
end component;

signal Reg_A, Reg_B, ALU_Out: std_logic_vector(63 downto 0);
signal Opcode: std_logic_vector(3 downto 0);
signal Carry_In, Carry_Out: std_logic;

begin
uut: Main_Ctrl port map( Reg_A => Reg_A, Reg_B => Reg_B, Opcode => Opcode, Carry_In => Carry_In, Carry_Out => Carry_Out, ALU_Out => ALU_Out);


testcases: process
begin
Reg_A <= x"2250500000000000"; Reg_B <= x"0FFFFFFFFFFFFFFF";
--Arithmetic
Opcode <= "0000"; wait for 10ns; 
Opcode <= "0001"; wait for 10ns; 
Opcode <= "0010"; wait for 10ns; 
Opcode <= "0011"; Carry_In <= '1'; wait for 10ns; 
Opcode <= "0011"; Carry_In <= '0'; wait for 10ns;

--Logic 
Reg_A <= x"2250500000000000"; Reg_B <= x"00000000F0FFFFFF";
Opcode <= "0100"; wait for 10ns; 
Opcode <= "0101"; wait for 10ns; 
Opcode <= "0110"; wait for 10ns; 
Opcode <= "0111"; wait for 10ns; 


--Shift
Opcode <= "1000"; wait for 10ns; 
Opcode <= "1001"; wait for 10ns; 
Opcode <= "1010"; wait for 10ns; 
Opcode <= "1101"; wait for 10ns; 
end process;




end Behavioral;
