module dfl(clk,reset,up_out,d1
    );
input clk,reset;
input [15:0] up_out;
output reg [15:0] d1;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d1<=0;
	 
end
else 
begin
  d1<=up_out;
end	 

   
end

endmodule
