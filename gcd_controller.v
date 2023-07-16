module fsm(
  input clk,
  input reset,
  input start,

  input wire [1:0] q1,
  output reg[1:0] q2
);
  parameter reg_width=3;
  parameter [reg_width-1:0] case0=3'd0,
  case1=3'd1,
  case2=3'd2,
  case3=3'd3,
  case4=3'd4;

  reg [reg_width-1:0] current_state,next_state;						
  always @(negedge clk) begin

    if(reset) begin
      current_state=case0;
    end
    else current_state<=next_state;
  end
  always @(*) begin 
    case(current_state)
      case0:begin
        if(!start) begin
          if(q1==0) begin
            next_state=case4;
            q2<=0;
          end
          else next_state=case1;
        end
        else begin
          next_state=case0;
          q2=0;
        end
      end
      case1:begin
        if(q1==1)begin
          q2<=1;
          next_state=case0;
        end
        else if(q1==2) begin 
          q2<=2;
          next_state=case0;
        end
      end

      case4:begin
        q2<=3;
        next_state=case0;
      end
    endcase
  end
endmodule