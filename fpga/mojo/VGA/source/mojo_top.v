module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full

    // VGA connections
    output reg [2:0] pixel,
    output hsync_out,
    output vsync_out
    );

wire clk_25;
wire rst = ~rst_n; // make reset active high
wire inDisplayArea;

clk_25MHz clk_video(
  .CLK_IN1(clk),
  .CLK_OUT1(clk_25),
  .RESET(rst)
);

hvsync_generator hvsync(
  .clk(clk_25),
  .vga_h_sync(hsync_out),
  .vga_v_sync(vsync_out),
  .CounterX(CounterX),
  .CounterY(CounterY),
  .inDisplayArea(inDisplayArea)
);


// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

assign led = 8'b0;


always @(posedge clk_25)
begin
  pixel[0] <= 1'b1 & inDisplayArea;
  pixel[1] <= 1'b0 & inDisplayArea;
  pixel[2] <= 1'b0 & inDisplayArea;
end

endmodule