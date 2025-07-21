library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity LUnit is
 Port ( A : in STD_LOGIC_VECTOR (63 downto 0);
        B : in STD_LOGIC_VECTOR (63 downto 0);
        Op_code : in STD_LOGIC_VECTOR (3 downto 0);
        LU_Out : out STD_LOGIC_VECTOR (63 downto 0)
        );
end LUnit;

architecture Behavioral of LUnit is

begin

-- Logic Unit

LogicUnit: process (A, B, Op_code)
begin
    case Op_code is
        when "0100" => LU_Out <= not A;
        
        when "0101" => LU_Out <= A and B;
        
        when "0110" => LU_Out <= A or B;
        
        when "0111" => LU_Out <= A xor B;
        
        when others => LU_Out <= (others => '0');
    end case;
  
    
    
end process;

end Behavioral;
