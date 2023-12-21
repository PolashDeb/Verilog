module dfho(clk,reset,high,d47
    );
input clk,reset;
input [15:0] high;
output reg [15:0] d47;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d47<=0;
	 
end
else 
begin
  d47<=high;
end	 

   
end

endmodule
