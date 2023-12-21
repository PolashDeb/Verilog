
module bandpass(
 input clk,
input signed [7:0] data_in,
output  signed [7:0] up,
output  signed [7:0] fil,
output  signed [7:0] fil_out,
output  signed [7:0] data_out
    );
reg signed [7:0] up_out;
wire [7:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14;
reg signed [7:0] down_out;
reg signed [7:0] data_wait;



////up sampling L=2
integer i=1'b0;
always @ (posedge clk) 
begin 
	if(clk)
	begin
       if (i==1'b0) 
		  begin
           up_out <= data_in;
			  i=1'b1;
        end
       else 
		  begin
          up_out <= 8'd0;
          i=1'b0;
        end
	 end
	else
	begin
        if (i==1'b0) 
		  begin
          up_out <= data_in;
			 i=1'b1;
        end
       else
		  begin
         up_out <= 8'd0;
         i=1'b0;
        end        
    end 
end
assign up = up_out; 

///// filter

df A1(clk,reset,up_out,d1);
df A2(clk,reset,d1,d2);
df A3(clk,reset,d2,d3);
df A4(clk,reset,d3,d4);
df A5(clk,reset,d4,d5);
df A6(clk,reset,d5,d6);
df A7(clk,reset,d6,d7);
df A8(clk,reset,d7,d8);
df A9(clk,reset,d8,d9);
df A10(clk,reset,d9,d10);
df A11(clk,reset,d10,d11);
df A12(clk,reset,d11,d12);


assign fil=up_out-(2*d6)+d12;

dfo B1(clk,reset,fil,d13);
dfo B2(clk,reset,d13,d14);

assign fil_out=(2*d13)-d14+up_out-(2*d6)+d12;


///down sampling M=2
integer j=1'b0;

always @ (posedge clk )
begin
 if (j==1'b0) 
		  begin
           down_out <= fil_out;
			  j=1'b1;
        end
   else 
		 begin
         data_wait<= fil_out;
          j=1'b0;
       end     
  
end
assign data_out = down_out;
endmodule
