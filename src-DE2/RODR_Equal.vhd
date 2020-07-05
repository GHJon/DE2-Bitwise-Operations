library ieee;
use ieee.std_logic_1164.all;

entity RODR_Equal is
	port( I0, I1 : in std_logic;
			Eq, notEq 	 : out std_logic);

end RODR_Equal;

Architecture arch of RODR_Equal is
	signal Check : std_logic;
	begin
		notEQ <= not Check;
		Eq <= Check;
		Check <= I0 XNOR I1;
end arch;