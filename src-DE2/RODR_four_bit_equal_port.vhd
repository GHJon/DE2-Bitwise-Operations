library ieee;
use ieee.std_logic_1164.all;

entity RODR_four_bit_equal_port is
	port(a, b : in std_logic_vector (3 downto 0);
			fourEq, fournotEq: out std_logic);
			
end RODR_four_bit_equal_port;

Architecture arch of RODR_four_bit_equal_port is

	Component RODR_equal
	port( 
			I0, I1	: in std_logic;
			Eq, notEq: out std_logic);
	end Component;
	signal e0, e1, e2, e3, ne0, ne1, ne2, ne3 : std_logic;
	begin
	
	H1: RODR_equal port map (I0 => a(0), I1=>b(0), Eq => e0, notEq => ne0);
	H2: RODR_equal port map (I0 => a(1), I1=>b(1), Eq => e1, notEq => ne1);
	H3: RODR_equal port map (I0 => a(2), I1=>b(2), Eq => e2, notEq => ne2);
	H4: RODR_equal port map (I0 => a(3), I1=>b(3), Eq => e3, notEq => ne3);
	
	fourEq <= e0 AND e1 AND e2 AND e3;
	fournotEq <= ne0 OR ne1 OR ne2 OR ne3;
end arch;