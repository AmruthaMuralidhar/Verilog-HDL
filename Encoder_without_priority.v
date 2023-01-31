//Encoder without priority
module enc(
    input [0:7]a,
    input en,
    output reg[0:2]y
    );
always@(a,en)
if(en==1'b1)
begin
case(a)
  8'b00000001 : y = 3'd7;
  8'b00000010 : y = 3'd6;
  8'b00000100 : y = 3'd5;
  8'b00001000 : y = 3'd4;
  8'b00010000 : y = 3'd3;
  8'b00100000 : y = 3'd2;
  8'b01000000 : y = 3'd1;
  8'b10000000 : y = 3'd0;
 default y = 3'bzzz;
 endcase
 end
else 
    y=3'bzzz;
    endmodule

module enc_tb();
reg en;
reg [0:7]a;
wire [0:2]y;
enc fa( a,en,y);
initial begin
   a = 8'b00000001 ; en = 1'b1;
   #10 a = 8'b00001000 ; en = 1'b1;
   #10 a = 8'b00000010 ; en = 1'b0;
#10 $finish;
end 
endmodule
