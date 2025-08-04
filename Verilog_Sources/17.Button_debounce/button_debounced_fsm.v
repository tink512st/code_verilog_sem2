module button_debounced_fsm (
    input wire clk,
    input wire rst_n,
    input wire btn_in,
    input wire btn_de,
    output reg [6:0] count_reg_out,
    output [3:0] an
);
    parameter max_count = 100000; // 10ms @ 100MHz clock
    parameter WIDTH = 20;
    reg [3:0] count_reg;
    //debounce cho nut tang
    reg btn_pressed_pulse,btn_in_sync1,btn_in_sync2;
    parameter 
        IDLE       = 2'b00,
        WAIT_STABLE = 2'b01,
        PULSE      = 2'b10,
        WAIT_RELEASE = 2'b11;

    reg[1:0] state;
    integer count;
    always@(posedge clk) begin
        btn_in_sync1<=btn_in;
        btn_in_sync2 <= btn_in_sync1;
    end
    always @(posedge clk or posedge rst_n) begin
        if (rst_n) begin
            state <= IDLE;
            count <= 0;
            btn_pressed_pulse <= 0;
        end else begin
            case (state)
                IDLE: begin
                count <= 0;
                    btn_pressed_pulse <= 0;
                    if (btn_in_sync2) begin
                        state <= WAIT_STABLE;
                        count <= 1;
                    end
                end
                WAIT_STABLE: begin
                    if (btn_in_sync2) begin
                        count <= count + 1;
                        if (count >= max_count) begin
                            state <= PULSE;
                        end
                    end else begin
                        state <= IDLE;
                        count <= 0;
                    end
                end
                PULSE: begin
                    btn_pressed_pulse <= 1; // chỉ đúng 1 chu kỳ
                    state <= WAIT_RELEASE;
                end
                WAIT_RELEASE: begin
                    btn_pressed_pulse <= 0;
                    if (!btn_in_sync2) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
    //debounce cho nut giam 
    reg btn_pressed_pulse_de,btn_de_sync1,btn_de_sync2;
    reg[1:0] state_de;
    integer count_de;
    always@(posedge clk) begin
        btn_de_sync1<=btn_de;
        btn_de_sync2 <= btn_de_sync1;
    end
    always @(posedge clk or posedge rst_n) begin
        if (rst_n) begin
            state_de <= IDLE;
            count_de <= 0;
            btn_pressed_pulse_de <= 0;
        end else begin
            case (state_de)
                IDLE: begin
                count_de <= 0;
                    btn_pressed_pulse_de <= 0;
                    if (btn_de_sync2) begin
                        state_de <= WAIT_STABLE;
                        count_de <= 1;
                    end
                end
                WAIT_STABLE: begin
                    if (btn_de_sync2) begin
                        count_de <= count_de + 1;
                        if (count_de >= max_count) begin
                            state_de <= PULSE;
                        end
                    end else begin
                        state_de <= IDLE;
                        count_de <= 0;
                    end
                end
                PULSE: begin
                    btn_pressed_pulse_de <= 1; // chỉ đúng 1 chu kỳ
                    state_de <= WAIT_RELEASE;
                end
                WAIT_RELEASE: begin
                    btn_pressed_pulse_de <= 0;
                    if (!btn_de_sync2) begin
                        state_de <= IDLE;
                    end
                end
            endcase
        end
    end
always @(posedge clk or posedge rst_n) begin
        if (rst_n) begin
            count_reg <= 4'd0;
        end else begin
            if(btn_pressed_pulse_de & btn_pressed_pulse)
                count_reg <= count_reg;
            else if (btn_pressed_pulse) begin
                if (count_reg == 4'd9)
                    count_reg <= 4'd0;
                else
                    count_reg <= count_reg + 1;
            end
            else if (btn_pressed_pulse_de) begin
                if (count_reg == 4'd0)
                    count_reg <= 4'd9;
                else
                    count_reg <= count_reg - 1;
            end
            end
end
always@(count_reg) begin
    case(count_reg)
        4'b0000: count_reg_out = 7'h40;
        4'b0001: count_reg_out = 7'h79;
        4'b0010: count_reg_out = 7'h24;
        4'b0011: count_reg_out = 7'h30;
        4'b0100: count_reg_out = 7'h19;
        4'b0101: count_reg_out = 7'h12;
        4'b0110: count_reg_out = 7'h02;
        4'b0111: count_reg_out = 7'h78;
        4'b1000: count_reg_out = 7'h00;
        4'b1001: count_reg_out = 7'h10;
        default: count_reg_out = 7'h40;
    endcase
end
assign an = 4'b1110;
endmodule
