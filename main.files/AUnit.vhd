library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity AUnit is
  Port ( A : IN std_logic_vector(63 downto 0);
       B : IN std_logic_vector(63 downto 0);
       Opsel : IN std_logic_vector(3 downto 0);
       COut : OUT std_logic;
       C_In : IN std_logic;
       AU_Out : OUT std_logic_vector(63 downto 0)
       
       );
end AUnit;

architecture Behavioral of AUnit is
    signal Carry_Inc  : std_logic;
   
begin

--ALU UNIT
--    TNSFR <= std_logic_vector(unsigned(A));
--    Sum <= std_logic_vector((unsigned(A) + unsigned(B)));
--    Inc <= std_logic_vector(unsigned(A) + 1);
--    Dec <= std_logic_vector(unsigned(A) - 1);
    Carry_Inc <= '1' when (A = x"1111111111111111") else '0';
ArithemeticUnit: process(A,B, Opsel, Carry_inc)
    begin
        case Opsel is
        --TRANSFER
            when "0000" => AU_Out <= std_logic_vector(unsigned(A)); Cout <= '0';
        --INCREMENT
            when "0001" => AU_Out <= std_logic_vector(unsigned(A) + 1); Cout <= Carry_Inc; 
        --DECREMENT
       -- if statement and make inside the when 
            when "0010" => AU_Out <= std_logic_vector(unsigned(A) - 1); Cout <= Carry_Inc; 
        --SUM/ADD
        --Sum <= ((X xor Y) xor Cin)
        --Cout <= (X and Y) or (Cin and (X xor Y));
            when "0011" => AU_Out <= STD_LOGIC_VECTOR(unsigned(A) + (unsigned(B)) + (unsigned'(C_In & '0'))); 
        
            when others => AU_Out <= (others => '0'); Cout <= '0'; 
        end case;
        if OpSel = "0011" then
    COut <= (A(63) and B(63)) or (A(63) and C_In) or (B(63) and C_In);
    end if;
    end process;


end Behavioral;
