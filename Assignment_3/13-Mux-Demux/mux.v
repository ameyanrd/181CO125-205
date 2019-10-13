`timescale 1ns/1ns
module Mux_16_1
(
    input [3:0] s,
    input [31:0] a1,
    input [31:0] a2,
    input [31:0] a3,
    input [31:0] a4,
    input [31:0] a5,
    input [31:0] a6,
    input [31:0] a7,
    input [31:0] a8,
    input [31:0] a9,
    input [31:0] a10,
    input [31:0] a11,
    input [31:0] a12,
    input [31:0] a13,
    input [31:0] a14,
    input [31:0] a15,
    input [31:0] a16,
    output [31:0] X
);

    reg [31:0] A;
    always @(*)
    begin
/*
        case (s)
            4'b0000 : assign A = a1;
            4'b0001 : assign A = a2;
            4'b0010 : assign A = a3;
            4'b0011 : assign A = a4;
            4'b0100 : assign A = a5;
            4'b0101 : assign A = a6;
            4'b0110 : assign A = a7;
            4'b0111 : assign A = a8;
            4'b1000 : assign A = a9;
            4'b1001 : assign A = a10;
            4'b1010 : assign A = a11;
            4'b1011 : assign A = a12;
            4'b1100 : assign A = a13;
            4'b1101 : assign A = a14;
            4'b1110 : assign A = a15;
            4'b1111 : assign A = a16;
*/
        case (s)
            4'b0000 : A <= a1;
            4'b0001 : A <= a2;
            4'b0010 : A <= a3;
            4'b0011 : A <= a4;
            4'b0100 : A <= a5;
            4'b0101 : A <= a6;
            4'b0110 : A <= a7;
            4'b0111 : A <= a8;
            4'b1000 : A <= a9;
            4'b1001 : A <= a10;
            4'b1010 : A <= a11;
            4'b1011 : A <= a12;
            4'b1100 : A <= a13;
            4'b1101 : A <= a14;
            4'b1110 : A <= a15;
            4'b1111 : A <= a16;
        endcase
    end

    assign X = A;

endmodule

module mux_tb;
    reg [31:0] a1;
    reg [31:0] a2;
    reg [31:0] a3;
    reg [31:0] a4;
    reg [31:0] a5;
    reg [31:0] a6;
    reg [31:0] a7;
    reg [31:0] a8;
    reg [31:0] a9;
    reg [31:0] a10;
    reg [31:0] a11;
    reg [31:0] a12;
    reg [31:0] a13;
    reg [31:0] a14;
    reg [31:0] a15;
    reg [31:0] a16;
    reg [3:0] s;
    wire [31:0] answer;

    Mux_16_1 M
    (
        .s(s),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .a4(a4),
        .a5(a5),
        .a6(a6),
        .a7(a7),
        .a8(a8),
        .a9(a9),
        .a10(a10),
        .a11(a11),
        .a12(a12),
        .a13(a13),
        .a14(a14),
        .a15(a15),
        .a16(a16),
        .X(answer)
    );

    initial
    begin
        $dumpfile("MUX.vcd");
        $dumpvars(0, mux_tb);
    end

    initial
    begin
        s = 4'b0010;
        a1 = 32'b00001100000001111101001011100100;
        a2 = 32'b11000111101011001000011101011101;
        a3 = 32'b00000101110100001101101111100110;
        a4 = 32'b01110100100100110001000100000111;
        a5 = 32'b01101110001110110100010010110111;
        a6 = 32'b01011110100010010011001101010011;
        a7 = 32'b01000101011001100110101110111000;
        a8 = 32'b00001000011001010110100001010000;
        a9 = 32'b11011001110100100001010010111100;
        a10 = 32'b01011110110000000011111011011110;
        a11 = 32'b01111000111011000000101100110000;
        a12 = 32'b00000110000100101001100111000110;
        a13 = 32'b00101111111100100100111010011010;
        a14 = 32'b00110100110100000010001110111110;
        a15 = 32'b01000011000000100100011101101000;
        a16 = 32'b11010111101001010111110100001011;
        #100;

        s = 4'b1001;
        a1 = 32'b10110011011000101101000111110111;
        a2 = 32'b10100011110010101011101011111110;
        a3 = 32'b10101001011010100010000101110111;
        a4 = 32'b11001000010101001011011101011101;
        a5 = 32'b01001001000001110001101100110101;
        a6 = 32'b01010101010000001111011000011011;
        a7 = 32'b00101101000101001000100100011111;
        a8 = 32'b00100101001011001100011010010011;
        a9 = 32'b11111101010000010101110010111101;
        a10 = 32'b01011110110000000011111011011110;
        a11 = 32'b01011111011110010011000010100110;
        a12 = 32'b10111111100111110110101100010010;
        a13 = 32'b00000111111110101110110111000101;
        a14 = 32'b00110100110100000010001110111110;
        a15 = 32'b01000011000000100100011101101000;
        a16 = 32'b11111111011111011100001101010110;
        #100;

        s = 4'b0101;
        a1 = 32'b00010001111001110000111100100010;
        a2 = 32'b00101011100100101101000011011101;
        a3 = 32'b01101001111111110110101111001011;
        a4 = 32'b11110110000110011101101101011101;
        a5 = 32'b10110110111111111100010110101001;
        a6 = 32'b10111000011110000000111100011000;
        a7 = 32'b00001111101101011101010001011110;
        a8 = 32'b11101000111100001010100000000010;
        a9 = 32'b01110001100011010110001000010110;
        a10 = 32'b01001000011001011000111111100100;
        a11 = 32'b00001000011100011111000110111000;
        a12 = 32'b01001010110011100101101110101111;
        a13 = 32'b01101101101001001011011000100100;
        a14 = 32'b11011010001000001101010010010001;
        a15 = 32'b11000001110000011110000000110001;
        a16 = 32'b00100101100101001100110000100101;
        #100;

        s = 4'b1010;
        a1 = 32'b11011011001111000110000010011101;
        a2 = 32'b10001001110000010000010011100111;
        a3 = 32'b01100000011010000010011000110111;
        a4 = 32'b10010111101000010111001100011110;
        a5 = 32'b01011000011101011110100001010011;
        a6 = 32'b01110001001001101010001110011100;
        a7 = 32'b10101111110111010010111100111110;
        a8 = 32'b00111000000110111100111001110111;
        a9 = 32'b11001001001111010110111101111110;
        a10 = 32'b00101111011010100011001100111010;
        a11 = 32'b00000110010000001111101110100111;
        a12 = 32'b10111011100100100110001100110010;
        a13 = 32'b00010010000110111010001010000010;
        a14 = 32'b01001101010101110110010101100111;
        a15 = 32'b01101110001011110111100010010000;
        a16 = 32'b01101110100110000010011100010101;
        #100;

        s = 4'b0000;
        a1 = 32'b10000010110101000000000001000110;
        a2 = 32'b01111001101011101111110011110001;
        a3 = 32'b11001100100010100001011101000111;
        a4 = 32'b10100000010100011101000000001010;
        a5 = 32'b11100001100111110111011001001100;
        a6 = 32'b00001000001100110110100101101111;
        a7 = 32'b10010100011100011101001100001111;
        a8 = 32'b00111010110010101100010100111110;
        a9 = 32'b10111000000111011010111000100110;
        a10 = 32'b11111010100000011000000010001101;
        a11 = 32'b10101111111110110101101100101010;
        a12 = 32'b00001110010100100001111110011011;
        a13 = 32'b01000011110011011101001100010111;
        a14 = 32'b01010001001000010110101010111001;
        a15 = 32'b10011011101111111010010011110011;
        a16 = 32'b10010111010000111010111000101010;
        #100;
        
        s = 4'b1111;
        a1 = 32'b01100010001010001000001110101100;
        a2 = 32'b10000111011001011100111101111101;
        a3 = 32'b11001101100010011111110110011101;
        a4 = 32'b01101100100100000101101101111000;
        a5 = 32'b00001110001111000110010110010101;
        a6 = 32'b01111010110111101010001111001000;
        a7 = 32'b11001010100011101111100000001000;
        a8 = 32'b11001000100001010010100000101110;
        a9 = 32'b10011011011011010001001001010111;
        a10 = 32'b01111011100101010010110000011111;
        a11 = 32'b01001011100111101010100101110001;
        a12 = 32'b10100111100101100100000000000001;
        a13 = 32'b11110010100011110000100101000111;
        a14 = 32'b10010101000000101000101011011000;
        a15 = 32'b01000101011010011111001100110101;
        a16 = 32'b00101011001110001110000111011010;
        #100;

        s = 4'b1000;
        a1 = 32'b00111000000110110100011001110001;
        a2 = 32'b11011000100001000110110010110010;
        a3 = 32'b10101110010110000011011001101000;
        a4 = 32'b00111101000110100111010110001100;
        a5 = 32'b01101011110101001111001000000101;
        a6 = 32'b00111111101010101001001011100011;
        a7 = 32'b10000100001001101100111011010100;
        a8 = 32'b00011101100110111100101111000110;
        a9 = 32'b01000101100111110000101000001100;
        a10 = 32'b10111111000000100010101111111111;
        a11 = 32'b00010111000101111010000010000000;
        a12 = 32'b01110011100110110001011011000100;
        a13 = 32'b01100110010001000001011010101000;
        a14 = 32'b01010110111110111011110010001110;
        a15 = 32'b11110001000110100110011011010100;
        a16 = 32'b10000010110000001001010111000110;
        #100;

        s = 4'b1011;
        a1 = 32'b10111100110100001111100100011011;
        a2 = 32'b10111000110101110110000011111110;
        a3 = 32'b00100010110101101110001000101101;
        a4 = 32'b11000111100010111011110011100010;
        a5 = 32'b11000000111101010011111010101010;
        a6 = 32'b11010101011111110100000000010111;
        a7 = 32'b00001100111011111111100111010011;
        a8 = 32'b10011101001111001000000111101010;
        a9 = 32'b01001001100110101000011111110111;
        a10 = 32'b11001111101100110011110101111001;
        a11 = 32'b11001000110100100000100100100101;
        a12 = 32'b11001010010010101001110001011000;
        a13 = 32'b00011000010111111000010101100101;
        a14 = 32'b10110101010110111100000000011111;
        a15 = 32'b11001011101011101101001001111100;
        a16 = 32'b11001101100010111001110011011011;
        #100;
    end

    initial
    begin
        $monitor
        (
            "a1 = %b\na2 = %b\na3 = %b\na4 = %b\na5 = %b\na6 = %b\na7 = %b\na8 = %b\na9 = %b\na10 = %b\na11 = %b\na12 = %b\na13 = %b\na14 = %b\na15 = %b\na16 = %b\nselect = %b\nanswer = %b\n",
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
            a8,
            a9,
            a10,
            a11,
            a12,
            a13,
            a14,
            a15,
            a16,
            s,
            answer
        );
    end

endmodule