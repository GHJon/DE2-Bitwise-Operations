library ieee;
use ieee.std_logic_1164.all;

entity RODR_two_bit_equal is
	port(a, b : in std_logic_vector (1 downto 0);
			aeqb: out std_logic);
			
end RODR_two_bit_equal;

Architecture arch of RODR_two_bit_equal is
signal p0, p1, p2, p3 : std_logic;
begin
	aeqb <= p0 or p1 or p2 or p3;