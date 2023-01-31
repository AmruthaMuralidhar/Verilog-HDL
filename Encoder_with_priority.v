//Encoder with priority

module encp(
    input [0:7]a,
    input en,
    output reg[0:2]b
    );
    
always@(a,en)
if(en==1'b1)
begin
casex(a)
  8'bxxxxxxx1 : b = 3'd7;
  8'bxxxxxx10 : b = 3'd6;
  8'bxxxxx100 : b = 3'd5;
  8'bxxxx1000 : b = 3'd4;
  8'bxxx10000 : b = 3'd3;
  8'bxx100000 : b = 3'd2;
  8'bx1000000 : b = 3'd1;
  8'b10000000 : b = 3'd0;
 default b = 3'bzzz;
 endcase
 end
else 
    b=3'bzzz;
endmodule

module enc_tb();
reg en;
reg [0:7]a;
wire [0:2]b;
encp fa( a,en,b);
initial begin
   a = 8'b00000011 ; en = 1'b1;
   #10 a = 8'b10001000 ; en = 1'b1;
   #10 a = 8'b00001010 ; en = 1'b0;
#10 $finish;
end 
endmodule
