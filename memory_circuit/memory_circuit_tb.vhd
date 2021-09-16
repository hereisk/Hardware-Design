library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem_circuit_tb is
--empty
end entity mem_circuit_tb;

architecture tb of mem_circuit_tb is

  component mem_circuit is
	port(
    clock, reset, write_en: in STD_LOGIC;
    input: in STD_LOGIC_VECTOR (3 downto 0);
    output: out STD_LOGIC_VECTOR (5 downto 0) --hold up to 60 in binary
    );
  end component mem_circuit;

signal clock_in: STD_LOGIC := '1';
signal reset_in: STD_LOGIC := '0';
signal write_en_in: STD_LOGIC := '1';
signal input_in: STD_LOGIC_VECTOR (3 downto 0);
signal output_out: STD_LOGIC_VECTOR (5 downto 0);

begin

	DUT: mem_circuit port map
    (
    clock => clock_in,
    reset => reset_in,
    write_en => write_en_in,
    input => input_in,
    output => output_out
    );

	--generate clock
	clock_in <= not clock_in after 5 ns;

	process is
    begin
    	input_in <= B"1111";
		wait until rising_edge(clock_in);
    	input_in <= B"1111";
    	wait until rising_edge(clock_in);
        input_in <= B"1111";
    	wait until rising_edge(clock_in);
        input_in <= B"1111";
    	wait until rising_edge(clock_in);
        input_in <= B"0001";
    	wait until rising_edge(clock_in);
        input_in <= B"0010";
    	wait until rising_edge(clock_in);
        input_in <= B"0011";
    	wait until rising_edge(clock_in);
        input_in <= B"0100";

		wait;
    end process;
end architecture tb;