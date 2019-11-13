


//64 Bit alu


`timescale 1ns/1ns
module alu(a,b,op,carry_input,Result,flag,carry_input_out);

      input [63:0] a;
      input [63:0] b;
	input [63:0] carry_input;
      input [3:0] op;
      output [63:0]Result;
      output flag,carry_input_out;
      reg Result,flag,carry_input_out;

      always@(a or b or op)
          begin
               case (op)
                 4'b0000:  Result = a & b;   // AND
                 4'b0001:  Result = a | b;   // OR
                 4'b0010:  Result = a + b +carry_input;    // addition
                 4'b0110:  Result = a - b - carry_input;    // subtraction
                 4'b1101:  Result = !(a & b); //nand
                 4'b1100:  Result = !(a | b); //nor
               endcase

		begin
			if(op[0]==0 && op[1]==1 && op[2]==0 && op[3]==0)
			carry_input_out= a&b;
			else if(op[0]==0 && op[1]==1 && op[2]==1 && op[3]==0)
			carry_input_out= (~a)&b;
		end
		begin
			if(Result ==0 && carry_input_out==0)
			assign flag=1;
			else
			assign flag=0;
		end
           end 
		
endmodule	


module alu_tb;
	reg [63:0]a;
	reg [63:0]b;
	reg [63:0] carry_input;
	reg [3:0] op;
	wire [63:0]Result;
	wire carry_input_out;

initial begin
	$dumpfile("alu1.vcd");
	$dumpvars(0,alu_tb);	
	$monitor ("a=%b, b=%b, op=%b%b%b%b, carry_input_out=%b, Result=%b flag=%b ",a,b,op[3],op[2],op[1],op[0],carry_input_out,Result,flag);
	a=0;
	b=0;
	carry_input=0;
	op[0]=0;
	op[1]=0;
	op[2]=0;
	op[3]=0;
	
	#20 a=2;
	op[0]=1;
	#20 b=3;
	#20 op[0]=0;
	#20 op[1]=1;
	#20 op[2]=1;
	#20 a=1024;
	#20 op[2]=0;
	carry_input=1;
	#20 op[1]=1;
	#20 op[3]=1;
	#20 b=120;
	#20 a=9;
	#20 op[0]=1;

	#20 b=22;

	
	#10 $finish;
end

alu c(
	.a(a),
	.b(b),
	.op(op),
	.carry_input(carry_input),
	.Result(Result),
	.flag(flag),
	.carry_input_out(carry_input_out)
);
endmodule

