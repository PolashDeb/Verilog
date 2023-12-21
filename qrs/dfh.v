module dfh(clk,reset,low_out,d15
    );
input clk,reset;
input [15:0] low_out;
output reg [15:0] d15;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d15<=0;
	 
end
else 
begin
  d15<=low_out;
end	 

   
end

endmodule