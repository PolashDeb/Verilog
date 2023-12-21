module dfo(clk,reset,fil,d13
    );
input clk,reset;
input [7:0] fil;
output reg [7:0] d13;
always @(posedge clk,posedge reset)
begin
if(reset)
begin
    
    d13<=0;
	 
end
else 
begin
  d13<=fil;
end	 

   
end

endmodule