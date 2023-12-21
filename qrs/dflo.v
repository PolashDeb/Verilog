module dflo(clk,reset,low,d13
    );
input clk,reset;
input [15:0] low;
output reg [15:0] d13;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d13<=0;
	 
end
else 
begin
  d13<=low;
end	 

   
end

endmodule