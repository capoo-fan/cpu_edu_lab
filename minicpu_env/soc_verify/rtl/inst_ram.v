// Simple behavioral instruction RAM for simulation
// Used by soc_mini_top instead of Xilinx IP during XSim

`timescale 1ns / 1ps

module inst_ram #(
    parameter AW = 16,              // address width (from soc_mini_top: a[17:2])
    parameter DW = 32               // data width
)(
    input  wire              clk,
    input  wire              we,
    input  wire [AW-1:0]     a,
    input  wire [DW-1:0]     d,
    output reg  [DW-1:0]     spo
);

    // 2^AW deep memory
    reg [DW-1:0] mem [0:(1<<AW)-1];

    // Optional: initialize from hex file if available
    // initial begin
    //     $readmemh("inst_ram.txt", mem); // adjust path if needed
    // end

    always @(posedge clk) begin
        if (we) begin
            mem[a] <= d;
        end
        spo <= mem[a];
    end

endmodule
