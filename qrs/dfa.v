module dfa(clk,reset,sqr_out,d52
    );
input clk,reset;
input [15:0] sqr_out;
output reg [15:0] d52;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d52<=0;
	 
end
else 
begin
  d52<=sqr_out;
end	 

   
end

endmodule