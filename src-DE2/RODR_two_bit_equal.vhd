library ieee;
use ieee.std_logic_1164.all;

entity RODR_two_bit_equal is
	port(a, b : in std_logic_vector (1 downto 0);
			Eq, notEq: out std_logic);
			
end RODR_two_bit_equal;

Architecture arch of RODR_two_bit_equal is

signal p0, p1 : std_logic;
begin

	notEq <= not (p0 AND p1);
	Eq <= p0 AND p1;
	p0 <= a(0) xnor b(0);
	p1 <= a(1) xnor b(1);
end arch;