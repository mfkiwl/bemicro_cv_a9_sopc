
`timescale 1 ns / 1 ps

module misc_io #(
    parameter               DATA_WIDTH = 32,
    parameter               ADDR_WIDTH = 2
)
(
    input   wire            clk_i,
    input   wire            rst_i,
    input   wire    [31:0]  adr_i,
    input   wire    [31:0]  dat_i,
    input   wire            we_i,
    input   wire            stb_i,
    input   wire            cyc_i,
    output  reg     [31:0]  dat_o,
    output  reg             ack_o,

    output  reg     [63:0]  outputs_o,
    input   wire    [63:0]  inputs_i

);

`include "functions.vh"

    localparam                  ADDR_L = clog2b(((DATA_WIDTH + 7) / 8) - 1);
    localparam                  ADDR_H = ADDR_L + ADDR_WIDTH - 1;

    wire    [ADDR_WIDTH-1:0]    address_a = adr_i[ADDR_H:ADDR_L];
    wire                        rden_a  = cyc_i & stb_i & ~we_i;
    wire                        wren_a  = cyc_i & stb_i & we_i;

    reg     [63:0]              input_regs[0:2];


    always @(posedge clk_i or posedge rst_i)
    begin
        if(rst_i) begin
            input_regs[0] <= 64'b0;
            input_regs[1] <= 64'b0;
            input_regs[2] <= 64'b0;
        end
        else begin
            input_regs[0] <= inputs_i;
            input_regs[1] <= input_regs[0];
            input_regs[2] <= input_regs[1];
        end
    end

    always @(posedge clk_i or posedge rst_i)
    begin
        if(rst_i) begin
            outputs_o <= 64'b0;
        end
        else if(wren_a) begin
            case(address_a)
                2'h2: outputs_o[31:0]  <= dat_i;
                2'h3: outputs_o[63:32] <= dat_i;
            endcase
        end
    end

    always @(posedge clk_i or posedge rst_i)
    begin
        if(rst_i) begin
            dat_o <= 32'b0;
        end
        else if(rden_a) begin
            case(address_a)
                2'h0: dat_o <= input_regs[2][31:0];
                2'h1: dat_o <= input_regs[2][63:32];
                2'h2: dat_o <= outputs_o[31:0];
                2'h3: dat_o <= outputs_o[63:32];
                default: dat_o <= dat_o;
            endcase
        end
    end

    always @(posedge clk_i or posedge rst_i)
    begin
        if(rst_i)
            ack_o <= 1'b0;
        else
            ack_o <= rden_a | wren_a;
    end

endmodule

