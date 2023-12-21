module alu(
input clk,
input [7:0] a,
input [7:0] b,
input [3:0] opcode,
output carry,
output [7:0] alu_out
    );
reg [7:0] temp;
reg [8:0] f;
reg cf;

always@(posedge clk)
begin
     
///add

    if(opcode==4'b0000)
	 begin
	 f<={1'b0,a} + {1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end
     
	  
///substraction

	 else if(opcode==4'b0001)
	 begin
	 f<={1'b0,a} - {1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
	 
/// multiply

	 else if(opcode==4'b0010)
	 begin
	 f<={1'b0,a} * {1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
///divide

	 else if(opcode==4'b0011)
	 begin
	 f<={1'b0,a} /{1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end


///shift left
 
    else if(opcode==4'b0100)
	 begin
	 f<={1'b0,a}<< 2;
	 temp<=f[7:0];
	 cf<=f[8];
	 end


///shift right

    else if(opcode==4'b0101)
	 begin
	 f<={1'b0,b}>> 2;
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
 ///and	 
 
	 else if(opcode==4'b0110)
	 begin
	 f<={1'b0,a} & {1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	  

 ///or	
 
	 else if(opcode==4'b0111)
	 begin
	 f<={1'b0,a} | {1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
	 
///nand  

	 else if(opcode==4'b1000)
	 begin
	 f<=~({1'b0,a} & {1'b0,b});
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
///nor 

	 else if(opcode==4'b1001)
	 begin
	 f<=~({1'b0,a} | {1'b0,b});
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
	 
///xor 

	 else if(opcode==4'b1010)
	 begin
	 f<={1'b0,a} ^ {1'b0,b};
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
///xnor 

	 else if(opcode==4'b1011)
	 begin
	 f<=~({1'b0,a} ^ {1'b0,b});
	 temp<=f[7:0];
	 cf<=f[8];
	 end
	 
//not 

	 else 
	 begin
	 f<=~{1'b0,a};
	 temp<=f[7:0];
	 cf<=f[8];
	 end

end

 assign alu_out=temp;
 assign carry=cf;

endmodule