library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity SUnit is
 port(
      A : IN std_logic_vector(63 downto 0);
        B : IN std_logic_vector(63 downto 0);
        Op_type : IN std_logic_vector(3 downto 0);
        SU_Out : OUT std_logic_vector(63 downto 0)
    );
end SUnit;

architecture Behavioral of SUnit is

begin

--Shifter Unit
process(A, B, Op_Type)
begin

    case Op_Type is
    
        when "1000" => SU_Out <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(5 downto 0)))));
         
        when "1001" => SU_Out <= std_logic_vector(shift_left(signed(A), to_integer(unsigned(B(5 downto 0)))));
            
        when "1010" => SU_Out <= std_logic_vector(rotate_right(signed(A), to_integer(unsigned(B(5 downto 0)))));
            
        when "1101" => SU_Out <= std_logic_vector(rotate_left(signed(A), to_integer(unsigned(B(5 downto 0)))));
        
        when others => SU_Out <= (others => '0'); 
    end case;
end process;



end Behavioral;
