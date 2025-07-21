library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Main_Ctrl is
    Port ( Reg_A,Reg_B  : in STD_LOGIC_VECTOR (63 downto 0);
           OpCode : in STD_LOGIC_VECTOR (3 downto 0);
           Carry_In : in STD_LOGIC;
           Carry_Out : OUT STD_LOGIC;
           ALU_Out : OUT STD_LOGIC_VECTOR (63 downto 0));
end Main_Ctrl;

architecture Structural of Main_Ctrl is

--Components
--Arithmetic Component
component AUnit 
Port ( 
       A : IN std_logic_vector(63 downto 0);
       B : IN std_logic_vector(63 downto 0);
       Opsel : IN std_logic_vector(3 downto 0);
       C_In : IN std_logic;
       COut : OUT std_logic;
       AU_Out : OUT std_logic_vector(63 downto 0));
end component;
--Logic Component
component LUnit
Port (   
        A : in STD_LOGIC_VECTOR (63 downto 0);
        B : in STD_LOGIC_VECTOR (63 downto 0);
        Op_code : in STD_LOGIC_VECTOR (3 downto 0);
        LU_Out : out STD_LOGIC_VECTOR (63 downto 0));
end component;
--Shift Component
component Sunit
port(
       A : IN std_logic_vector(63 downto 0);
        B : IN std_logic_vector(63 downto 0);
        Op_type : IN std_logic_vector( 3 downto 0);
        SU_Out : OUT std_logic_vector(63 downto 0)
    );
end component;

--Controller Signals
signal AU_Cout  : std_logic;

signal ARU_Out, SHU_Out, AS_Out, LOU_Out : std_logic_vector(63 downto 0);
begin

Arithmetic : AUnit port map (A => Reg_A, B => Reg_B, Opsel => Opcode , C_in => Carry_In, Cout => Carry_Out, AU_Out => ARU_Out);
Logic : LUnit port map( A => Reg_A, B => Reg_B, Op_code => Opcode, LU_Out => LOU_out);
Shift : SUnit port map( A => Reg_A, B => Reg_B, Op_Type => Opcode, SU_Out => SHU_Out);


controller:process(ARU_OUT)
begin
case Opcode is 
when "0000" =>
ALU_Out <= ARU_OUT;
when "0001" =>
ALU_Out <= ARU_OUT;
when "0010" =>
ALU_Out <= ARU_OUT;
when "0011" =>
ALU_Out <= ARU_OUT;
when "0100" =>
ALU_Out <= LOU_OUT;
when "0101" =>
ALU_Out <= LOU_OUT;
when "0110" =>
ALU_Out <= LOU_OUT;
when "0111" =>
ALU_Out <= LOU_OUT;
when "1000" =>
ALU_Out <= SHU_OUT;
when "1001" =>
ALU_Out <= SHU_OUT;
when "1010" =>
ALU_Out <= SHU_OUT;
when "1101" =>
ALU_Out <= SHU_OUT;

when others => ALU_Out <= (others => '0');
end case;

end process;



end Structural;
