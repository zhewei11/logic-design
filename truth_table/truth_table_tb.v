`timescale 1ns / 10ps
`define CYCLE 10
`include "truth_table.v"

module tb;
    integer error;
    reg Ain, Bin, Cin;
    wire Xout, Yout;
    reg X_ans,Y_ans;
    integer i;
    
    // Expected answers
    reg [7:0] X_expected;
    reg [7:0] Y_expected;  
    
    truth_table T(Ain, Bin, Cin, Xout, Yout);

    initial begin
        error = 0;
        X_expected = 8'b01001101;
        Y_expected = 8'b10010110;
        
        // Initialize expected outputs
        X_ans = 0;
        Y_ans = 0;

        #(`CYCLE);

        // Iterate through all possible input combinations
        for (i = 0; i < 8; i = i + 1) begin
            {Ain, Bin, Cin} = i;
            X_ans = X_expected[i];
            Y_ans = Y_expected[i];

            #(`CYCLE);

            // Check the output Xout and Yout against the expected values
            if (Xout !== X_ans || Yout !== Y_ans) begin
                $write("Error! Your X is %d, Y is %d. Expected: X is %d, Y is %d.", Xout, Yout, X_expected[i], Y_expected[i]);
                error = error + 1;
            end
            else begin
                $write("Correct!");
            end

            #(`CYCLE);
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
