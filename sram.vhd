library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sram is
    port(
        wenable,a1,a0,din1,din0: in std_logic;
        dout1,dout0: out std_logic
    );
end entity;

architecture arch of sram is
    signal decoder0, decoder1, decoder2, decoder3: std_logic;
    signal clock0, clock1, clock2, clock3: std_logic;
    signal dl0, dl1, dl2, dl3, dl4, dl5, dl6, dl7: std_logic;
    begin
        decode: entity work.two_to_four_decoder port map(a1,a0,decoder0,decoder1,decoder2,decoder3);
        CLOCK0: entity work.and_gate port map(decoder0, wenable, clock0);
        CLOCK1: entity work.and_gate port map(decoder1, wenable, clock1);
        CLOCK2: entity work.and_gate port map(decoder2, wenable, clock2);
        CLOCK3: entity work.and_gate port map(decoder3, wenable, clock3);
        dlatch0: entity work.d_latch port map(clock0,din1,decoder0,dout1);
        dlatch1: entity work.d_latch port map(clock1,din1,decoder1,dout1);
        dlatch2: entity work.d_latch port map(clock2,din1,decoder2,dout1);
        dlatch3: entity work.d_latch port map(clock3,din1,decoder3,dout1);

        dlatch4: entity work.d_latch port map(clock0,din0,decoder0,dout0);
        dlatch5: entity work.d_latch port map(clock1,din0,decoder1,dout0);
        dlatch6: entity work.d_latch port map(clock2,din0,decoder2,dout0);
        dlatch7: entity work.d_latch port map(clock3,din0,decoder3,dout0);
end arch;