library ieee;
use ieee.std_logic_1164.all;

entity RODR_N_bit_equal is
	generic(nbits : natural := 32);
	port(a, b : in std_logic_vector (nbits-1 downto 0);
		 switch : in std_logic;
			Eq, notEq, lessUnsigned, lessSigned : out std_logic);
			
end RODR_N_bit_equal;

Architecture arch of RODR_N_bit_equal is
signal input1, input2 : std_logic_vector(nbits-1 downto 0);
signal check : std_logic := '0';
signal lessUnsignedFlag : std_logic := '0';
signal lessSignedFlag : std_logic := '0';

begin
	input1 <= a;
	input2 <= b;
	
	process(input1, input2, check, lessUnsignedFlag, lessSignedFlag, switch)
	variable tempCheck : std_logic;
	begin
		LoopCheck : for i in nbits-1 downto 0 loop
			tempCheck := input1(i) XNOR input2(i);
			exit LoopCheck when tempCheck = '0';
		end loop LoopCheck;
		check <= tempCheck;
		
		if(switch = '0') then
			lessthanUnsigned : for i in nbits-1 downto 0 loop
				if(input1(i) < input2(i)) then
					lessUnsignedFlag <= '1';
				else
					lessUnsignedFlag <= '0';
				end if;
			exit lessthanUnsigned when lessUnsignedFlag = '1';
			end loop lessthanUnsigned;
			
		elsif(switch = '1') then
			if((input1(nbits-1) AND input2(nbits-1)) = '1') then
				lessthanSigned : for i in nbits-1 to 0 loop
					if(input1(i) > input2(i)) then
						lessSignedFlag <= '1';
					else
						lessSignedFlag <= '0';
					end if;
				exit lessthanSigned when lessSignedFlag = '1';
				end loop lessthanSigned;
				
			elsif(input1(nbits-1) > input2(nbits-1)) then
				lessSignedFlag <= '1';
				
			elsif((input1(nbits-1) AND input2(nbits-1)) = '0') then
				lessthanSigned2 : for i in nbits-1 downto 0 loop
					if(input1(i) < input2(i)) then
						lessSignedFlag <= '1';
					else
						lessSignedFlag <= '0';
					end if;
				exit lessthanSigned2 when lessSignedFlag = '1';
				end loop lessthanSigned2;
			end if;
		end if;
	end process;
	
	Eq <= check;
	notEq <= not check;
	lessUnsigned <= lessUnsignedFlag;
	lessSigned <= lessSignedFlag;
end arch;