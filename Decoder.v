//decoder

module decd(
    input a,b,c,
    output d0,d1,d2,d3,d4,d5,d6,d7
    );
    wire n0,n1,n2;
    not g1(n0,a);
    not g2(n1,b);
    not g3(n2,c);
    and g4(d0,n0,n1,n2);
    and g5(d1,n0,n1,c);
    and g6(d2,n0,b,n2);
    and g7(d3,n0,b,c);
    and g8(d4,a,n1,n2);
    and g9(d5,a,n1,c);
    and g10(d6,a,b,n2);
    and g11(d7,a,b,c);
endmodule

module decd_tb();
    reg a,b,c;
    wire d0,d1,d2,d3,d4,d5,d6,d7;
    decd f(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7);
    initial begin
    a=1'b0; b=1'b0; c=1'b0;
    #10 a=1'b0; b=1'b0; c=1'b1;
    #10 a=1'b0; b=1'b1; c=1'b0;
    #10 a=1'b0; b=1'b1; c=1'b1;
    #10 a=1'b1; b=1'b0; c=1'b0;
    #10 a=1'b1; b=1'b0; c=1'b1;
    #10 a=1'b1; b=1'b1; c=1'b0;
    #10 a=1'b1; b=1'b1; c=1'b1;
    #10$finish;    
end
endmodule

//decoder data flow

module decdata(
    input a,b,c,
    output d0,d1,d2,d3,d4,d5,d6,d7
    );
    assign d0=(~a&~b&~c); 
    assign d1=(~a&~b&c); 
    assign d2=(~a&b&~c); 
    assign d3=(~a&b&c); 
    assign d4=(a&~b&~c); 
    assign d5=(a&~b&c); 
    assign d6=(a&b&~c); 
    assign d7=(a&b&c);
endmodule

module decdata_tb();
    reg a,b,c;
    wire d0,d1,d2,d3,d4,d5,d6,d7;
    decdata f(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7);
    initial begin
    a=1'b0; b=1'b0; c=1'b0;
    #10 a=1'b0; b=1'b0; c=1'b1;
    #10 a=1'b0; b=1'b1; c=1'b0;
    #10 a=1'b0; b=1'b1; c=1'b1;
    #10 a=1'b1; b=1'b0; c=1'b0;
    #10 a=1'b1; b=1'b0; c=1'b1;
    #10 a=1'b1; b=1'b1; c=1'b0;
    #10 a=1'b1; b=1'b1; c=1'b1;
    #10$finish;    
end
endmodule
