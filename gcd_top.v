module top(
  input clk,
  input reset,
  input reg[7:0] A,B,
  output reg[7:0] GCD,
  output reg finish,
  input reg start
);
  wire [1:0] q1,q2;
  fsm finitestate(
    .clk(clk),.reset(reset),.start(start),.q1(q1),.q2(q2)
  );
  dp datapath(
    .clk(clk),.reset(reset),.X(A),.Y(B),.q2(q2),.GCD(GCD),.q1(q1)
    ,.finish(finish));



endmodule