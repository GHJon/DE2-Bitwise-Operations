library ieee;
use ieee.std_logic_1164.all;

entity RODR_two_bit_equal_port is
	port(a, b : in std_logic_vector (1 downto 0);
			twoEq, twonotEq: out std_logic);
			
end RODR_two_bit_equal_port;

Architecture arch of RODR_two_bit_equal_port is

	Component RODR_equal
	port( 
			I0, I1	: in std_logic;
			Eq, notEq: out std_logic);
	end Component;
	signal e0, e1, ne0, ne1 : std_logic;
	begin
	
	H1: RODR_equal port map (I0 => a(0), I1=>b(0), Eq => e0, notEq => ne0);
	H2: RODR_equal port map (I0 => a(1), I1=>b(1), Eq => e1, notEq => ne1);
	
	twoEq <= e0 AND e1;
	twonotEq <= ne0 AND ne1;
end arch;