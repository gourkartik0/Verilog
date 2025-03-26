// Code your design here
module decoder2_4(input a1,a0,en,
                 output reg d0,d1,d2,d3);
  always @(a0, a1, en) begin
    if (!en)
      {d0, d1, d2, d3} = 4'b0000; // If enable is low, all outputs should be 0
    else begin
     
   case ({a1, a0})
        2'b00: {d3, d2, d1, d0} = 4'b0001;
        2'b01: {d3, d2, d1, d0} = 4'b0010;
        2'b10: {d3, d2, d1, d0} = 4'b0100;
        2'b11: {d3, d2, d1, d0} = 4'b1000;
        default: {d3, d2, d1, d0} = 4'b0000;
      endcase
    end
  end
endmodule

module decoder4_16(input [3:0]a,
                   output [15:0]y);
  wire w1,w2,w3,w4;
  
  decoder2_4 d1(a[3],a[2],1'b1,w1,w2,w3,w4);
  decoder2_4 d2(a[1],a[0],w1,y[0],y[1],y[2],y[3]);
  decoder2_4 d3(a[1],a[0],w2,y[4],y[5],y[6],y[7]);
  decoder2_4 d4(a[1],a[0],w3,y[8],y[9],y[10],y[11]);
  decoder2_4 d5(a[1],a[0],w4,y[12],y[13],y[14],y[15]);
endmodule
