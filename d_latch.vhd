library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity d_latch is
    port(
        c,d,enable: in std_logic;
        q, qbar: inout std_logic
    );
end entity;

architecture arch of d_latch is
    begin
        process(c,d)
        begin
            if(enable='1') then
                q <= (c and not d) nor qbar;
                qbar <= (d and c) nor q;
            else
                q <= 'Z';
                qbar <= 'Z';
            end if;
        end process;
end arch;