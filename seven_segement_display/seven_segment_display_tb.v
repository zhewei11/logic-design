`include "seven_segment_display.v"
`timescale 1ns/1ns
`define CYCLE 10

module tb;
    reg [3:0] num;
    wire [6:0] dis;

    integer i;
    integer err;
    reg [6:0] expected_dis;

    seven_segment_display seven(.num(num), .dis(dis));

    initial begin
        err = 0; 
        expected_dis = 0;
        #(`CYCLE/2);

        // Test each input number
        for (i = 0; i < 16; i = i + 1) begin
            num = i; // Set input number
            // Calculate expected display output
            case (num)
                4'h0: expected_dis = 7'b1000000;
                4'h1: expected_dis = 7'b1111001;
                4'h2: expected_dis = 7'b0100100;
                4'h3: expected_dis = 7'b0110000;
                4'h4: expected_dis = 7'b0011001;
                4'h5: expected_dis = 7'b0010010;
                4'h6: expected_dis = 7'b0000011;
                4'h7: expected_dis = 7'b1111000;
                4'h8: expected_dis = 7'b0000000;
                4'h9: expected_dis = 7'b0011000;
                4'hA: expected_dis = 7'b0001000;
                4'hB: expected_dis = 7'b0000011;
                4'hC: expected_dis = 7'b1000110;
                4'hD: expected_dis = 7'b0100001;
                4'hE: expected_dis = 7'b0000110;
                4'hF: expected_dis = 7'b0001110;
                default: expected_dis = 7'bxxxxxxx; // Set to an invalid value for error checking
            endcase
            #(`CYCLE/4);

            // Check output and report errors
            if (dis !== expected_dis) begin
                $write("Error in test case %d! Your output is %b, expected %b\n", i, dis, expected_dis);
                err = err + 1;
            end
            else begin
                $write("Test case %d passed!\n", i);
            end 
        end

        #(`CYCLE/4);

       if (err == 0) begin
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
            $display("         Totally has %d errors                      ", err);
            $display("\n");     
        end
        $finish;
    end
    
endmodule
