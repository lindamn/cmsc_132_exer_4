library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- and gate; for s0 (000)

entity not_gate is
    port (r: in std_logic; t : out std_logic) ;
end entity ;

architecture arch of not_gate is
    begin
        process is begin
            wait on r;
            t <= not r;
	end process;
end architecture ;