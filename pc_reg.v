`timescale 1ns / 1ps
`include "define.v"

module pc_reg(
    input wire rst,
    input wire clk,
    input wire[5:0] stall,
    output reg[`InstAddrBus] pc,
    output reg ce
    );
    
    always @ (posedge clk) begin
        if (rst == 1'b1) begin
            ce <= `ChipDiasable;
        end else begin
            ce <= `ChipEnable;
        end
    end
    
    always @ (posedge clk) begin
        if (ce == 1'b0) begin
            pc <= 6'h00;
        end else if (stall[0] == `NoStop) begin
          pc <= pc + 4'h4;
        end
    end
    
endmodule
