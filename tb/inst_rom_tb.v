`timescale 1ns / 1ps

module inst_rom_tb();
  reg ce;
  reg[`InstAddrBus] addr;
  wire[`InstBus] inst;

  initial begin
    ce = 1'b0;
    addr = 32'b0;
    #10
    ce = 1'b1;
  end

  inst_rom inst_rom0(
    .ce(ce),
    .addr(0),
    .inst(inst)
  );


endmodule