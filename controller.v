module controller (
    input clka,
    input reset,
    input [31:0] douta,
    input start_stop,
    output reg [3:0] addra,
    output reg ena,
    output reg [15:0] a,
    output reg [15:0] b
);
    reg [3:0] counter=4'd0;
    always@(posedge clka) begin
        if (reset) begin
            addra <= 4'd0;
            ena <= 1'b0;
            counter <= 4'd0;    
            a <= 16'd0;
            b <= 16'd0;
        end else begin
            if(counter == 4'd15) begin
                counter <= 4'd0;
                addra <= counter;
            end else begin
                counter <= counter + 4'd1;
                addra <= counter;
            end

            if(start_stop) begin
                ena <= 1'b1;
            end else begin
                ena <= 1'b0;
            end

            a <= douta[31:16];
            b <= douta[15:0];

        end
    end
endmodule