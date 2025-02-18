`timescale 1ns / 1ps

module cache_test;
  import cache_env_pkg::*;

  initial begin
    CacheEnvironment env;
    env = new();
    
    $display("Starting Cache Verification...");
    env.run(200); // Run 200 test cases
    
    $display("Cache Verification Completed.");
    $stop;
  end
endmodule
