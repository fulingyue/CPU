module openmips_tb();
  reg CLOCK_50;
  reg rst;
  initial begin
    CLOCK_50 = 1'b0;
    forever #10 CLOCK_50 = ~CLOCK_50;
  end
  initial begin
    rst =`RstEnable;
    #195 rst = `RstDisable;
    #1000 $stop;
  end
  reg[`RegBus] inst = 32'h34011100;
  wire[`RegBus] rom_addr_o;
  wire rom_ce_o;


openmips openmips0(
  .clk(CLOCK_50),
  .rst(rst),
  .rom_data_i(inst),
  .rom_addr_o(rom_addr_o),
  .rom_ce_o(rom_ce_o)
);
endmodule