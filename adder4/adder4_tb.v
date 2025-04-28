`timescale 1ns/10ps
`include "adder4.v"
`define CYCLE 10
module tb;

reg  [3:0] A_in, B_in;
wire [3:0] Sum_o;
wire overflow;

integer i, j;
reg patternA, patternB;
reg [3:0] answer;
reg overflow_ans;
integer error;

adder4 add(
    .A(A_in),
    .B(B_in),
    .sum_e3(Sum_o),
    .overflow(overflow)
);

initial begin
    error = 0;
    overflow_ans = 1'b0;
    #(`CYCLE/2);

    for (i = 0; i <= 5; i = i + 1) begin
        for (j = 0; j <= 5; j = j + 1) begin
            // feed input
            A_in = i;
            B_in = j;
            
            // check answer
            answer = A_in + B_in + 3'd3;
            if (A_in[3] == B_in[3] && A_in[3] != answer[3])
                overflow_ans = 1'b1;
            else
                overflow_ans = 1'b0;
            $display("A+B = %d + %d = %d, overflow = %b", A_in, B_in, answer, overflow_ans);
            #(`CYCLE/2);
            
            // Check the output Sum_o and overflow against the expected values
            if (answer == Sum_o && overflow_ans == overflow) begin
                $display("Correct!");
            end
            else begin
                $display("Error: Your sum: %d, Your overflow: %d", Sum_o, overflow);
                error = error + 1;
            end
            
        end
    end

       if (error == 0) begin
            $display("\n");
            $display("\n");
            $display("        **************************       .--.      ");
            $display("        *                        *      |o_o |     ");
            $display("        *  Congratulations !!    *      |:_/ |     "); 
            $display("        *                        *     //   \ \    "); 
            $display("        *    Simulation PASS!!   *    (|     | )   ");
            $display("        *                        *   /'\_   _/`\   ");
            $display("        **************************   \___)=(___/   ");
            $display("\n");     
        end

        else begin
            $display("\n");
            $display("\n");
            $display("        **************************       .--.      ");
            $display("        *                        *      |x_x |     ");
            $display("        *  OOPS!                 *      |:_/ |     "); 
            $display("        *                        *     //   \ \    "); 
            $display("        *  Simulation Failed!!   *    (|     | )   ");
            $display("        *                        *   /'\_   _/`\   ");
            $display("        **************************   \___)=(___/   ");
            $display("         Totally has %d errors                      ", error);
            $display("\n");     
        end
        $finish;
end
endmodule
