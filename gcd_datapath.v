// Code your design here
module dp(
  input clk,
  input reset,
  input wire [7:0]X,
  input wire [7:0]Y,
  input wire [1:0]q2,

  output reg [7:0] GCD,
  output reg [1:0] q1,
  output reg finish
);


  reg [7:0] A,B;

  always @(*) begin
    if(reset) begin
      A=X;
      B=Y;
      finish=0;
      q1=3;
    end
    else begin
      if(A==B) begin
        q1 = 0 ;  

        //  $display("error q1= 0");

      end
      else if(A>B) begin
        q1=1;
        // $display("error q1=1 ");

      end
      else if(A<B) q1=2;    
      // if(q1!=0 |q2==3) begin
    end
  end
  always @(posedge clk) begin

    if(q2==1)      begin
      //$display("error 1= %d",A);
      A=A-B;
      // $display("error 2= %d",A);
    end
    else if(q2==2)   
      begin 
        B=B-A;
        //  $display("error q2=3 ");
      end
    else if(q2==3)  begin
      // $display("error q2=4 ");
      GCD=A;
      finish=1;
      //end
    end
  end
endmodule



