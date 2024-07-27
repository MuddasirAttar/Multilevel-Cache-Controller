`timescale 1ns / 1ps

module Testbench();

logic [31:0] address;
logic [7:0] data;
logic mode, clk;
logic [7:0] output_data;
logic hit1, hit2, Wait;
logic [31:0] stored_address;
logic [7:0] stored_data;

Controller inst (
    .address(address),
    .data(data),
    .mode(mode),
    .clk(clk),
    .output_data(output_data),
    .hit1(hit1),
    .hit2(hit2),
    .Wait(Wait),
    .stored_address(stored_address),
    .stored_data(stored_data)
);

initial
begin
    // The block index and block offset is 0-based index
    clk = 1'b1;

    // Transaction 1: Write to address 2
    address = 32'b00000000000000000000000000000010;    // At Block-index=0, Block-offset=2
    data = 8'b10110000;   // The data to be written at the given address
    mode = 1'b1; // Write operation
    #10;

    // Transaction 2: Read from address 128
    address = 32'b00000000000000000000000100000000;    // At Block-index=64, Block-offset=0
    data = 8'b10110111;  // This data does not matter here as it is read operation 
    mode = 1'b0; // Read operation
    #50;

    // Transaction 3: Write to address 129
    address = 32'b00000000000000000000000100000001;     // At Block-index=64, Block-offset=1
    data = 8'b10110110;   // The data to be written at the given address
    mode = 1'b1; // Write operation
    #10;

    // Transaction 4: Read from address 2
    address = 32'b00000000000000000000000000000010;     // At Block-index=0, Block-offset=2
    data = 8'b10110111;   // This data does not matter here as it is read operation  
    mode = 1'b0; // Read operation
    #30;

    // Transaction 5: Write to address 130
    address = 32'b00000000000000000000000100000010;     // At Block-index=64, Block-offset=2
    data = 8'b10111100;   // The data to be written at the given address
    mode = 1'b1; // Write operation
    #10;

    // Transaction 6: Read from address 128
    address = 32'b00000000000000000000000100000000;     // At Block-index=64, Block-offset=0
    data = 8'b11110100;   // This data does not matter here as it is read operation 
    mode = 1'b0; // Read operation
    #10;
    
    // Additional Transaction 7: Write to address 3
    address = 32'b00000000000000000000000000000011;     // At Block-index=0, Block-offset=3
    data = 8'b11000011;   // The data to be written at the given address
    mode = 1'b1; // Write operation
    #10;

    // Additional Transaction 8: Read from address 4
    address = 32'b00000000000000000000000000000100;     // At Block-index=1, Block-offset=0
    data = 8'b00000000;   // This data does not matter here as it is read operation 
    mode = 1'b0; // Read operation
    #10;
end

always #1 clk = ~clk;

endmodule
