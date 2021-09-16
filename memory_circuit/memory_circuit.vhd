library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem_circuit is
	port(
    clock, reset, write_en: in STD_LOGIC;
    input: in STD_LOGIC_VECTOR (3 downto 0);
    output: out STD_LOGIC_VECTOR (5 downto 0) --hold up to 60 in binary
    );
end entity mem_circuit;

architecture synth of mem_circuit is
	type statetype is (STATE_ZERO, STATE_ONE, STATE_TWO, STATE_THREE);
    signal state, nextstate: statetype;
    
    type mem_array is array (3 downto 0) of STD_LOGIC_VECTOR (3 downto 0);
    signal mem: mem_array := (others => B"0000");
    
begin
        --state register
        process(clock, reset)
        	begin
            	if (reset='1') then state <= STATE_ZERO;
                elsif rising_edge(clock) then state <= nextstate;
                end if;
            end process;
		--next state logic
        process(state, input, write_en)
        	begin
            	case state is
                	when STATE_ZERO =>
                        if (write_en='1') then mem(0) <= input;
                        end if;
                        output <= ("00" & mem(0)) + ("00" & mem(1)) + ("00" & mem(2)) + ("00" & mem(3));
                    	nextstate <= STATE_ONE;
                    when STATE_ONE =>
                        if (write_en='1') then mem(1) <= input;
                        end if;
                        output <= ("00" & mem(0)) + ("00" & mem(1)) + ("00" & mem(2)) + ("00" & mem(3));
                    	nextstate <= STATE_TWO;
                    when STATE_TWO =>
                        if (write_en='1') then mem(2) <= input;
                        end if;
                        output <= ("00" & mem(0)) + ("00" & mem(1)) + ("00" & mem(2)) + ("00" & mem(3));
                    	nextstate <= STATE_THREE;
                    when STATE_THREE =>
                        if (write_en='1') then mem(3) <= input;
                        end if;
                        output <= ("00" & mem(0)) + ("00" & mem(1)) + ("00" & mem(2)) + ("00" & mem(3));
                    	nextstate <= STATE_ZERO;
            	end case;
        end process;
end architecture synth;