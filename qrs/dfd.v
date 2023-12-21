module dfd(clk,reset,high_out,d48
    );
input clk,reset;
input [15:0] high_out;
output reg [15:0] d48;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d48<=0;
	 
end
else 
begin
  d48<=high_out;
end	 

   
end

endmodule