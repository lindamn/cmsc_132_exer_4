library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity two_to_four_decoder is
    port(
        i1, i0: in std_logic;
        d0, d1, d2, d3: out std_logic
    );
end entity;

architecture behavioral of two_to_four_decoder is
    signal noti0, noti1: std_logic;
    begin
        NOTi0: entity work.not_gate(arch) port map(i0,noti0);
        NOTi1: entity work.not_gate(arch) port map(i1,noti1);

        D0: entity work.and_gate(arch) port map(noti1,noti0,d0);
        D1: entity work.and_gate(arch) port map(noti1,i0,d1);
        D2: entity work.and_gate(arch) port map(i1,noti0,d2);
        D3: entity work.and_gate(arch) port map(i1,i0,d3);
end architecture;