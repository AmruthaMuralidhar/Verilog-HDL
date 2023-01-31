//comparator
module comp(
    input a,b,
    output x,y,z
    );
    assign x = ~a&b;
    assign y = (a&b)|(~a&~b);
    assign z = a&~b;
endmodule

module comp_tb();
    reg a,b;
    comp f(a,b,x,y,z);
    initial begin
    a=1'b0; b=1'b0;
    #10 a=1'b0; b=1'b1;
    #10 a=1'b1; b=1'b0;
    #10 a=1'b1; b=1'b1;
    #10 $finish;
    end
endmodule

//comparator behavioral

module compbhv(
    input [1:0]a,
    input [1:0]b,
    output reg x,y,z
    );

always @(a,b)
begin
    if (a>b)
    begin 
        x = 1; y = 0; z = 0;
    end
    else if (a==b) 
    begin
        y = 1; z = 0; x = 0;
    end
    else if (b>a)
    begin
        z = 1; x = 0; y = 0;
    end
end
endmodule

module compbhv_tb();
    reg [1:0]a,b;
    wire x,y,z;
    compbhv f(a,b,x,y,z);
    initial begin
    a=2'b00; b=2'b00;
    #10 a=2'b00; b=2'b01;
    #10 a=2'b01; b=2'b01;
    #10 a=2'b01; b=2'b00;
    #10 a=2'b01; b=2'b01;
    #10 a=2'b01; b=2'b11;    
    #10 a=2'b11; b=2'b00;
    #10 a=2'b00; b=2'b11;
    #10 a=2'b11; b=2'b01;
    #10 a=2'b10; b=2'b00;
    #10 a=2'b10; b=2'b10;
    #10 a=2'b00; b=2'b10;
    #10 a=2'b11; b=2'b11;
    #10 $finish;
    end
endmodule
