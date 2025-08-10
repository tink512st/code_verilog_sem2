//`define WriteInstruction(data, ctr_rs, ctr_en, source) \
//        data   <= source; \
//        ctr_rs <= 0;      \
//        ctr_en <= 1;      
//`define WriteData(data, ctr_rs, ctr_en, source) \
//        data   <= source; \
//        ctr_rs <= 1;      \
//        ctr_en <= 1;      
module lcd_1602(clk,rst,LCD_EN,LCD_RS,LCD_RW,LCD_DATA,LCD_ON);
input clk,rst;
output reg LCD_EN, LCD_RS,LCD_ON;
output LCD_RW;
output reg [7:0] LCD_DATA;

integer count = 0;
integer count_clk = 0;
reg clock_1khz = 0;
parameter he_so_chia = 50000;

wire [7:0] INIT_CODE [0:7];
        assign INIT_CODE[0] = 8'h38; //init code 0 den 3 la lenh dung 8bit data, 2 hang, 5x8
        assign INIT_CODE[1] = 8'h38;
        assign INIT_CODE[2] = 8'h38;
        assign INIT_CODE[3] = 8'h38;
        assign INIT_CODE[4] = 8'h08;//display off
        assign INIT_CODE[5] = 8'h01;//display on
        assign INIT_CODE[6] = 8'h06;//tu dong tang con tro
        assign INIT_CODE[7] = 8'h0c;// function: 8 bit, 2 line, 5x8
wire [7:0] LINE1 [0:15];
        assign LINE1[0] = "H";
        assign LINE1[1] = "e";
        assign LINE1[2] = "l";
        assign LINE1[3] = "l";
        assign LINE1[4] = "o";
        assign LINE1[5] = " ";
        assign LINE1[6] = "e";
        assign LINE1[7] = "v";
        assign LINE1[8] = "e";
        assign LINE1[9] = "r";
        assign LINE1[10] = "y";
        assign LINE1[11] = "o";
        assign LINE1[12] = "n";
        assign LINE1[13] = "e";
        assign LINE1[14] = " ";
        assign LINE1[15] = " ";
wire [7:0] LINE2 [0:15];
        assign LINE2[0] = "H";
        assign LINE2[1] = "e";
        assign LINE2[2] = "l";
        assign LINE2[3] = "l";
        assign LINE2[4] = "o";
        assign LINE2[5] = " ";
        assign LINE2[6] = "e";
        assign LINE2[7] = "v";
        assign LINE2[8] = "e";
        assign LINE2[9] = "r";
        assign LINE2[10] = "y";
        assign LINE2[11] = "o";
        assign LINE2[12] = "n";
        assign LINE2[13] = "e";
        assign LINE2[14] = " ";
        assign LINE2[15] = " ";
parameter               INIT = 4'd0,  
                        INIT_MAINTAIN = 4'd1,
                        HOME = 4'd2,
                        HOME_MAINTAIN = 4'd3,
                        WRITE_L1 = 4'd4, 
                        WRITE_L1_MAINTAIN = 4'd5, 
                        GO_LINE2 = 4'd6,
                        GO_LINE2_MAINTAIN = 4'd7,
                        WRITE_L2 = 4'd8,
                        WRITE_L2_MAINTAIN =4'd9,
                        DONE = 4'd10,
                        DELAY_20MS = 4'd11,
                        AFTER_DELAY = 4'd12;
reg[3:0] state = DELAY_20MS;
always@(posedge clock_1khz, posedge rst) begin
    if(rst) begin
        count <= 0;
        state <= DELAY_20MS;
        LCD_ON <= 0;
    end
    else begin
        LCD_ON <= 1;
        case(state) 
            DELAY_20MS: begin
                count <= count + 1;
                state <= (count <20)? DELAY_20MS: AFTER_DELAY;
            end
            AFTER_DELAY: begin
                count <= 0;
                state <= INIT;
            end
            INIT: begin
                LCD_DATA <= INIT_CODE[count];
                LCD_RS <= 0;
                LCD_EN <= 1;
                state <= INIT_MAINTAIN;
            end
            INIT_MAINTAIN: begin
                LCD_EN <= 0;
                count <= count + 1;
                state <= (count < 7) ? INIT: HOME;
            end
            HOME: begin
                LCD_DATA <= 8'h80;
                LCD_RS <= 0;
                LCD_EN <= 1;
                state <= HOME_MAINTAIN;
            end
            HOME_MAINTAIN: begin
                LCD_EN <= 0;
                count <= 0;
                state <= WRITE_L1;
            end
            WRITE_L1: begin
                LCD_DATA <= LINE1[count];
                LCD_RS <= 1;
                LCD_EN <= 1;
                state <= WRITE_L1_MAINTAIN;
            end
            WRITE_L1_MAINTAIN: begin
                LCD_EN <= 0;
                count <= count + 1;
                state <= (count < 15) ? WRITE_L1 : GO_LINE2;
            end
            GO_LINE2: begin
                LCD_DATA <= 8'hc0;
                LCD_RS <= 0;
                LCD_EN <= 1;
                state <= GO_LINE2_MAINTAIN;
            end
            GO_LINE2_MAINTAIN: begin
                LCD_EN <= 0;
                count <= 0;
                state <= WRITE_L2;
            end
            WRITE_L2: begin
                LCD_DATA <= LINE2[count];
                LCD_RS <= 1;
                LCD_EN <= 1;
                state <= WRITE_L2_MAINTAIN;
            end
            WRITE_L2_MAINTAIN: begin
                LCD_EN <= 0;
                count <= count + 1;
                state <= (count < 15)? WRITE_L2 : DONE;
            end
            DONE: begin
                state <= DONE;
            end
            default : state <= DONE;
        endcase
    end
end
always@(posedge clk, posedge rst) begin
    if(rst) begin
        count_clk <= 0;
        clock_1khz <= 0;
    end
    else begin
        if(count_clk >= he_so_chia-1) begin
            count_clk <= 0;
            clock_1khz <= ~clock_1khz;
        end
        else    count_clk <= count_clk + 1;    
    end
end
assign LCD_RW = 1'b0;
endmodule