`timescale 1ns / 1ps

package cache_env_pkg;
  import cache_transaction_pkg::*;

  class CacheEnvironment;
    CacheTransaction txn;
    
    function new();
      txn = new();
    endfunction

    task run(int num_tests);
      repeat (num_tests) begin
        txn.randomize();
        txn.display();
        #10;
      end
    endtask
  endclass
endpackage
