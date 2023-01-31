//Carry Look ahead adder
module cla(
    input [3:0]a,b,
    input cin,
    output [3:0]sum,
    output cout
    );
    wire [3:0]c;
    wire [3:0] p,g;
    assign g = (a&b);
    assign p = (a^b);
    assign c[0]= cin;
    assign c[1]= g[0]|(p[0]&c[0]);
    assign c[2]= g[1]|(p[1]&c[1]);
    assign c[3]= g[2]|(p[2]&c[2]);
    assign cout= g[3]|(p[3]&c[3]);
    assign sum = p^c;
endmodule

module cla_tb();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout;
    cla f(a,b,cin,sum,cout);
    initial begin
    a=4'd3; b=4'd5; cin=1'b0;
    #10 a=4'd6; b=4'd2; cin=1'b1;
    #10 $finish;
    end
    endmodule
