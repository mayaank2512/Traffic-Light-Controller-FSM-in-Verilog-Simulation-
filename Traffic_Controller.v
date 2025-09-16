module Traffic_Controller(
    input clk, rst,
    output reg [2:0] NS, // North-South lights (R=100, Y=010, G=001)
    output reg [2:0] EW  // East-West lights
);

    reg [1:0] state;
    reg [3:0] counter;

    parameter NS_GREEN = 3'b001, NS_YELLOW = 3'b010, NS_RED = 3'b100;
    parameter EW_GREEN = 3'b001, EW_YELLOW = 3'b010, EW_RED = 3'b100;

    parameter S0=0, S1=1, S2=2, S3=3;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= S0;
            counter <= 0;
        end else begin
            case(state)
                S0: begin // NS Green, EW Red
                    NS <= NS_GREEN; EW <= EW_RED;
                    if(counter < 5) counter <= counter + 1;
                    else begin state <= S1; counter <= 0; end
                end
                S1: begin // NS Yellow, EW Red
                    NS <= NS_YELLOW; EW <= EW_RED;
                    if(counter < 2) counter <= counter + 1;
                    else begin state <= S2; counter <= 0; end
                end
                S2: begin // NS Red, EW Green
                    NS <= NS_RED; EW <= EW_GREEN;
                    if(counter < 5) counter <= counter + 1;
                    else begin state <= S3; counter <= 0; end
                end
                S3: begin // NS Red, EW Yellow
                    NS <= NS_RED; EW <= EW_YELLOW;
                    if(counter < 2) counter <= counter + 1;
                    else begin state <= S0; counter <= 0; end
                end
            endcase
        end
    end
endmodule
