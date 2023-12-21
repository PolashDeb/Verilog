module qrs(
input clk,
input signed [15:0] data_in,
output  signed [15:0] up,
output  signed [15:0] low,
output  signed [15:0] low_out,
output  signed [15:0] high,
output  signed [15:0] high_out,
output  signed [15:0] deri_out,
output  signed [15:0] sqr_out,
output  signed [15:0] avg_out,
output  signed [15:0] data_out
    );
reg signed [15:0] up_out;
wire [15:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32,d33 ,d34,d35,d36,d37,d38,d39,d40,d41,d42,d43,d44,d45,d46,d47,d48,d49,d50,d51,d52,d53;
reg signed [15:0] down_out;
reg signed [15:0] data_wait;



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
          up_out <= 24'd0;
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
         up_out <= 24'd0;
         i=1'b0;
        end        
    end 
end
assign up = up_out; 

///// filter

///lowpass

dfl A1(clk,reset,up_out,d1);
dfl A2(clk,reset,d1,d2);
dfl A3(clk,reset,d2,d3);
dfl A4(clk,reset,d3,d4);
dfl A5(clk,reset,d4,d5);
dfl A6(clk,reset,d5,d6);
dfl A7(clk,reset,d6,d7);
dfl A8(clk,reset,d7,d8);
dfl A9(clk,reset,d8,d9);
dfl A10(clk,reset,d9,d10);
dfl A11(clk,reset,d10,d11);
dfl A12(clk,reset,d11,d12);

 assign low=( up_out-(2*d6)+ d12 )/32;
 
dflo B1(clk,reset,low,d13);
dflo B2(clk,reset,d13,d14);

assign low_out=( ( up_out-(2*d6)+d12 )/32 )+(2*d13)-d14;

///highpass

dfh A15(clk,reset,low_out,d15);
dfh A16(clk,reset,d15,d16);
dfh A17(clk,reset,d16,d17);
dfh A18(clk,reset,d17,d18);
dfh A19(clk,reset,d18,d19);
dfh A20(clk,reset,d19,d20);
dfh A21(clk,reset,d20,d21);
dfh A22(clk,reset,d21,d22);
dfh A23(clk,reset,d22,d23);
dfh A24(clk,reset,d23,d24);

dfh A25(clk,reset,d24,d25);
dfh A26(clk,reset,d25,d26);
dfh A27(clk,reset,d26,d27);
dfh A28(clk,reset,d27,d28);
dfh A29(clk,reset,d28,d29);
dfh A30(clk,reset,d29,d30);
dfh A31(clk,reset,d30,d31);
dfh A32(clk,reset,d31,d32);
dfh A33(clk,reset,d32,d33);
dfh A34(clk,reset,d33,d34);

dfh A35(clk,reset,d34,d35);
dfh A36(clk,reset,d35,d36);
dfh A37(clk,reset,d36,d37);
dfh A38(clk,reset,d37,d38);
dfh A39(clk,reset,d38,d39);
dfh A40(clk,reset,d39,d40);
dfh A41(clk,reset,d40,d41);
dfh A42(clk,reset,d41,d42);
dfh A43(clk,reset,d42,d43);
dfh A44(clk,reset,d43,d44);

dfh A45(clk,reset,d44,d45);
dfh A46(clk,reset,d45,d46);


 assign high=(low_out)-(d46);
 
dfho B3(clk,reset,high,d47);


assign high_out=(low_out)-(d46)+(d47);

///derivate

dfd A47(clk,reset,high_out,d48);
dfd A48(clk,reset,d48,d49);
dfd A49(clk,reset,d49,d50);
dfd A50(clk,reset,d50,d51);
 
assign deri_out=( (2*high_out)+d48-d50-(2*d51) )/8;

///square

assign sqr_out=( (deri_out)*(deri_out) );

//average filter

dfa A51(clk,reset,sqr_out,d52);
dfa A52(clk,reset,d52,d53);

assign avg_out=( (sqr_out)+d52+d53 )/3;


///down sampling M=2
integer j=1'b0;

always @ (posedge clk )
begin
 if (j==1'b0) 
		  begin
           down_out <= avg_out;
			  j=1'b1;
        end
   else 
		 begin
         data_wait<= avg_out;
          j=1'b0;
       end     
  
end
assign data_out = down_out;

endmodule


