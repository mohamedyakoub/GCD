
module test;
  parameter clk_period = 1ns;
  reg clk = 0;
  always #(clk_period/2) clk = ~ clk;
  reg start;
  reg reset;
  reg[7:0] A;
  reg[7:0] B;
  reg[7:0] GCD;
  reg finish;
  top dut(
    .clk(clk),
    .reset(reset),
    .A(A),
    .B(B),
    .GCD(GCD),
    .finish(finish),
    .start(start)
  );


  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    start=0;
    reset = 1;
    #(clk_period);
    A=80;
    B=10;
    #(clk_period);
    reset = 0;
    #(clk_period);
    while(!finish) 
      #(clk_period);
    #(clk_period);

    $display("GCD= %d",GCD);
    #(clk_period);

    reset = 1;
    #(clk_period);
    A=80;
    B=40;
    #(clk_period);
    reset = 0;
    #(clk_period);
    while(1) begin
      #(clk_period);
      if(finish==1) begin
        $display("GCD= %d",GCD);
        start=1;
        $finish;
      end    
    end
  end
endmodule