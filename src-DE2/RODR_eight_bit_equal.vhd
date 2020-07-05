library ieee;
use ieee.std_logic_1164.all;

entity RODR_eight_bit_equal is
	port(a, b : in std_logic_vector (7 downto 0);
			aeqb: out std_logic);
			
end RODR_eight_bit_equal;

Architecture arch of RODR_eight_bit_equal is

signal p0, p1, p2, p3, p4, p5, p6, p7 : std_logic;
begin

	aeqb <= p0 AND p1 AND p2 AND p3 AND p4 AND p5 AND p6 AND p7;
	p0 <= a(0) xnor b(0);
	p1 <= a(1) xnor b(1);
	p2 <= a(2) xnor b(2);
	p3 <= a(3) xnor b(3);
	p4 <= a(4) xnor b(4);
	p5 <= a(5) xnor b(5);
	p6 <= a(6) xnor b(6);
	p7 <= a(7) xnor b(7);
end arch;