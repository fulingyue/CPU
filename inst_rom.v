`include "define.v"
module inst_rom(
  input wire ce,
  input wire[`InstAddrBus] addr,
  output reg[`InstBus] inst
);

  reg[`InstBus] inst_mem[0:`InstMemNum - 1];
  initial begin
    inst_mem[0] <= 32'h3401FFFF;
    inst_mem[1] <= 32'h00010C00;
    inst_mem[2] <= 32'h3421FFFB;
    inst_mem[3] <= 32'h34020006;
    inst_mem[4] <= 32'h70221802;
    inst_mem[5] <= 32'h00220018;
    inst_mem[6] <= 32'h00220019;
    // inst_mem[7] <= 32'h00411821;
    // inst_mem[8] <= 32'h34030000;
    // inst_mem[9] <= 32'h00411820;
    // inst_mem[10] <= 32'h00231822;
    // inst_mem[11] <= 32'h00621823;
    // inst_mem[12] <= 32'h20630002;
    // inst_mem[13] <= 32'h34030000;
    // inst_mem[14] <= 32'h24638000;
    // inst_mem[15] <= 32'h3401ffff;
    // inst_mem[16] <= 32'h00010C00;
    // inst_mem[17] <= 32'h0020102A;
    // inst_mem[18] <= 32'h0020102B;
    // inst_mem[19] <= 32'h28228000;
    // inst_mem[20] <= 32'h2C228000;
    // inst_mem[21] <= 32'h3C010000;
    // inst_mem[22] <= 32'h70201021;
    // inst_mem[23] <= 32'h70201020;
    // inst_mem[24] <= 32'h3C01FFFF;
    // inst_mem[25] <= 32'h3421FFFF;
    // inst_mem[26] <= 32'h70201020;
    // inst_mem[27] <= 32'h70201021;
    // inst_mem[28] <= 32'h3C01A100;
    // inst_mem[29] <= 32'h70201020;
    // inst_mem[30] <= 32'h70201021;
    // inst_mem[31] <= 32'h3C011100;
    // inst_mem[32] <= 32'h70201020;
    // inst_mem[33] <= 32'h70201021;
    // inst_mem[34] <= 32'h3401FFFF;
    // inst_mem[35] <= 32'h00010C00;
    // inst_mem[0] <= 32'h3401FFFB;
    // inst_mem[1] <= 32'h34020006;
    // inst_mem[2] <= 32'h70221802;
    // inst_mem[39] <= 32'h;
    // inst_mem[40] <= 32'h;
  end
  
  // initial $readmemh("inst_rom.data", inst_mem);
  always @ (*) begin
    if(ce == `ChipDisable) begin
      inst<= `ZeroWord;
    end else begin 
      // inst <= 32'h34011100;
      inst <= inst_mem[addr[`InstMemNumLog2 + 1: 2]];
    end
  end
endmodule