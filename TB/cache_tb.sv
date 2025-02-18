`timescale 1ns / 1ps

module cache_tb;
  import cache_transaction_pkg::*;
  import cache_cov_pkg::*;
  
  logic clk;
  logic [31:0] address;
  logic [7:0] data;
  logic mode;  // mode = 0: Read, mode = 1: Write
  logic [7:0] output_data;
  logic hit1, hit2, Wait;
  logic [31:0] stored_address;
  logic [7:0] stored_data;

  // Instantiate the Cache Controller DUT
  Controller uut (
    .address(address),
    .clk(clk),
    .data(data),
    .mode(mode),
    .output_data(output_data),
    .hit1(hit1),
    .hit2(hit2),
    .Wait(Wait),
    .stored_address(stored_address),
    .stored_data(stored_data)
  );

  // Clock Generation
  initial clk = 0;
  always #5 clk = ~clk; // 10ns clock period

  // Instantiate Functional Coverage
  cache_coverage cov = new();

  // Instantiate and Run Constrained-Random Transactions
  initial begin
    CacheTransaction txn;
    txn = new();
    
    repeat (200) begin // Run 200 randomized test cases
      txn.randomize(); // Generate random values
      address = txn.address;
      data = txn.data;
      mode = txn.mode;
      txn.display();
      
      // Sample Functional Coverage
      cov.sample(address, mode, hit1, hit2);
      
      #10; // Wait for one clock cycle
    end

    // Display Coverage Report
    $display("Functional Coverage Report:");
    cov.display_coverage();

    $stop;
  end
endmodule
