library ieee;
use ieee.std_logic_1164.all;

entity RODR_eight_bit_equal_port is
	port(a, b : in std_logic_vector (7 downto 0);
			eightEq, eightnotEq: out std_logic);
			
end RODR_eight_bit_equal_port;

Architecture arch of RODR_eight_bit_equal_port is

	Component RODR_equal
	port( 
			I0, I1	: in std_logic;
			Eq, notEq: out std_logic);
	end Component;
	signal e0, e1, e2, e3, e4, e5, e6, e7,
			 ne0, ne1, ne2, ne3, ne4, ne5, ne6, ne7 : std_logic;
	begin
	
	H1: RODR_equal port map (I0 => a(0), I1=>b(0), Eq => e0, notEq => ne0);
	H2: RODR_equal port map (I0 => a(1), I1=>b(1), Eq => e1, notEq => ne1);
	H3: RODR_equal port map (I0 => a(2), I1=>b(2), Eq => e2, notEq => ne2);
	H4: RODR_equal port map (I0 => a(3), I1=>b(3), Eq => e3, notEq => ne3);
	H5: RODR_equal port map (I0 => a(4), I1=>b(4), Eq => e4, notEq => ne4);
	H6: RODR_equal port map (I0 => a(5), I1=>b(5), Eq => e5, notEq => ne5);
	H7: RODR_equal port map (I0 => a(6), I1=>b(6), Eq => e6, notEq => ne6);
	H8: RODR_equal port map (I0 => a(7), I1=>b(7), Eq => e7, notEq => ne7);
	
	eightEq <= e0 AND e1 AND e2 AND e3 AND e4 AND e5 AND e6 AND e7;
	eightnotEq <= ne0 OR ne1 OR ne2 OR ne3 OR ne4 OR ne5 OR ne6 OR ne7;
end arch;