`timescale 1ns / 1ps
`include "define.v"

module ex_mem(
    input wire clk,
    input wire rst,
    input wire[`RegAddrBus] ex_wd,
    input wire ex_wreg,
    input wire[`RegBus] ex_wdata,
    input wire [`RegBus] ex_hi,
    input wire[`RegBus] ex_lo,
    input wire ex_whilo,
    input wire[5:0] stall,
    output reg[`RegAddrBus] mem_wd,
    output reg mem_wreg,
    output reg[`RegBus] mem_wdata,
    output reg[`RegBus] mem_hi,
    output reg[`RegBus] mem_lo,
    output reg mem_whilo
);

    always @ (posedge clk) begin
        if(rst == `RstEnable) begin
          mem_wd <= `NOPRegAddr;
          mem_wreg <= `WriteDisable;
          mem_wdata <= `ZeroWord;
          mem_hi <= `ZeroWord;
          mem_lo <=`ZeroWord;
          mem_whilo <= `WriteDisable;
        end else if (stall[3] == `Stop && stall[4] == `NoStop) begin
          mem_wd <= `NOPRegAddr;
          mem_wreg <= `WriteDisable;
          mem_wdata <= `ZeroWord;
          mem_hi <= `ZeroWord;
          mem_lo <=`ZeroWord;
          mem_whilo <= `WriteDisable;
        end else if (stall[3] == `NoStop) begin
          mem_wd <= ex_wd;
          mem_wreg <= ex_wreg;
          mem_wdata <= ex_wdata;
          mem_hi <= ex_hi;
          mem_lo <= ex_lo;
          mem_whilo <= ex_whilo;
        end
    end
endmodule