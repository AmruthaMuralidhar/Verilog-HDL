//Demultiplier[1:4]

module demux(
    input i,s0,s1,
    output y0,y1,y2,y3
    );
    wire n0,n1;
    and g1(y0,i,n0,n1);
    and g2(y1,i,n0,s1);
    and g3(y2,i,s0,n1);
    and g4(y3,i,s0,s1);
    not g5(n0,s0);
    not g6(n1,s1);   
endmodule

module demux_tb();
    reg i,s0,s1;
    wire y0,y1,y2,y3;
    demux f(i,s0,s1,y0,y1,y2,y3);
    initial begin
    i=1'b0; s0=1'b0; s1=1'b0;
    #10 i=1'b1; s0=1'b0; s1=1'b0;
    #10 i=1'b1; s0=1'b0; s1=1'b1;
    #10 i=1'b1; s0=1'b1; s1=1'b0;
    #10 i=1'b1; s0=1'b1; s1=1'b1;
    #10$finish;
    end
    endmodule
