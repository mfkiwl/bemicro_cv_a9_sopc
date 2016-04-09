
`timescale 1 ns / 1 ps

module rom #(
    parameter               DATA_WIDTH = 32,
    parameter               ADDR_WIDTH = 8,
    parameter               INIT_FILE = ""
)
(
    input   wire            clk_i,
    input   wire            rst_i,
    input   wire    [31:0]  adr_i,
    input   wire            stb_i,
    input   wire            cyc_i,
    output  wire    [31:0]  dat_o,
    output  reg             ack_o
);

`include "functions.vh"

    localparam                  ADDR_L = clog2b(((DATA_WIDTH + 7) / 8) - 1);
    localparam                  ADDR_H = ADDR_L + ADDR_WIDTH - 1;

    wire    [ADDR_WIDTH-1:0]    address_a = adr_i[ADDR_H:ADDR_L];
    wire                        rden_a  = cyc_i & stb_i;

    always @(posedge clk_i or posedge rst_i)
    begin
        if(rst_i)
            ack_o <= 1'b0;
        else
            ack_o <= rden_a;
    end

    altsyncram #(
        .ADDRESS_ACLR_A         ("CLEAR0"),
        .CLOCK_ENABLE_INPUT_A   ("BYPASS"),
        .CLOCK_ENABLE_OUTPUT_A  ("BYPASS"),
        .INIT_FILE              (INIT_FILE),
        .INTENDED_DEVICE_FAMILY ("Cyclone V"),
        .NUMWORDS_A             (2**ADDR_WIDTH),
        .OPERATION_MODE         ("ROM"),
        .OUTDATA_ACLR_A         ("CLEAR0"),
        .OUTDATA_REG_A          ("UNREGISTERED"),
        .WIDTHAD_A              (ADDR_WIDTH),
        .WIDTH_A                (DATA_WIDTH),
        .WIDTH_BYTEENA_A        (1)
    ) mem (
        .clock0                 (clk_i),
        .aclr0                  (rst_i),
        .clock1                 (1'b1),
        .aclr1                  (1'b0),

        .clocken0               (1'b1),
        .clocken1               (1'b1),
        .clocken2               (1'b1),
        .clocken3               (1'b1),

        .eccstatus              (),

        .address_a              (address_a),
        .addressstall_a         (1'b0),
        .byteena_a              (1'b1),
        .data_a                 (32'hFFFFFFFF),
        .q_a                    (dat_o),
        .rden_a                 (rden_a),
        .wren_a                 (1'b0),

        .address_b              (1'b1),
        .addressstall_b         (1'b0),
        .byteena_b              (1'b1),
        .data_b                 (1'b1),
        .q_b                    (),
        .rden_b                 (1'b0),
        .wren_b                 (1'b0)
    );

endmodule

