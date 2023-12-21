module df(clk,reset,up_out,d1
    );
input clk,reset;
input [7:0] up_out;
output reg [7:0] d1;
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