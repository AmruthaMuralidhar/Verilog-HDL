//Subtractor without fulladder
module subtractor(
    input [3:0]a,b,
    output [3:0]sub,
    output cout
    );
    wire [3:0]c;
    wire [3:0]y;
    assign y=~b;
    
       assign c[0]=1;
       assign sub[0]=a[0]^y[0]^c[0];
       assign c[1]=(a[0]&y[0])|(y[0]&c[0])|(c[0]&a[0]);
       assign sub[1]=a[1]^y[1]^c[1];
       assign c[2]=(a[1]&y[1])|(y[1]&c[1])|(c[1]&a[1]);
       assign sub[2]=a[2]^y[2]^c[2];
       assign c[3]=(a[2]&y[2])|(y[2]&c[2])|(c[2]&a[2]);
       assign sub[3]=a[3]^y[3]^c[3];
       assign cout=(a[3]&y[3])|(y[3]&c[3])|(c[3]&a[3]);
                           
endmodule
module subtractor_tb;
reg [3:0]a,b; 
wire [3:0]sub;
wire cout;
subtractor Al(a,b,sub,cout);
initial 
begin
a=4'd5;b=4'd7;
#10 a=4'd8;b=4'd8; 
#10 a=4'd8;b=4'd2;
#20 $finish;
end
endmodule

//Subtractor with Adder
module sub(a,b,cin,sum,cout);
    input [3:0]a,b;
    input cin;
    output [3:0]sum;
    output cout;
    wire [3:0]y;
    wire [2:0]c;
    assign y=~b;
    assign cin=1;
    fulladd fa0(a[0],y[0],cin,sum[0],c[0]);
    fulladd fa1(a[1],y[1],c[0],sum[1],c[1]);
    fulladd fa2(a[2],y[2],c[1],sum[2],c[2]);
    fulladd fa3(a[3],y[3],c[2],sum[3],cout);
endmodule

module fulladd(
    input a,b,cin,
    output sum,cout
    );
    assign sum = a^b^cin;
    assign cout= (a&b)|(b&cin)|(a&cin);    
endmodule

 module sub_tb();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout;
    sub f(a,b,cin,sum,cout);
    initial begin 
    a=4'd14; b=4'd5; cin=1'b1;
    #10 a=4'd12; b=4'd7; cin=1'b1;
    #10 $finish;
    end
    endmodule
