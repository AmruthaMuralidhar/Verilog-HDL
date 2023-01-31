//Ripple Carry adder
module rca(a,b,cin,sum,cout);
    input [3:0]a;
    input [3:0]b;
    input cin;
    output [3:0]sum;
    output cout;
    wire [2:0]c;
    fulladd g1(a[0],b[0],cin,sum[0],c[0]);
    fulladd g2(a[1],b[1],c[0],sum[1],c[1]);
    fulladd g3(a[2],b[2],c[1],sum[2],c[2]);
    fulladd g4(a[3],b[3],c[2],sum[3],cout);
endmodule

    module fulladd(
    input a,b,cin,
    output sum,cout);
    assign sum = a^b^cin;
    assign cout = (a&b)|(b&cin)|(cin&a);
    endmodule
    
    module rca_tb();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout;
    rca f(a,b,cin,sum,cout);
    initial begin 
    a=4'b1010; b=4'b1101; cin=1'b0;
    #10 a=4'b1011; b=4'b1111; cin=1'b0;
    #10 $finish;
    end
    endmodule
