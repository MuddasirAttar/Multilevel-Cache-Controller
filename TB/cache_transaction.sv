`timescale 1ns / 1ps

package cache_transaction_pkg;

  class CacheTransaction;
    rand logic [31:0] address; // Random address
    rand logic [7:0] data;     // Random data
    rand logic mode;           // mode = 0 (read), mode = 1 (write)

    // Constraint for generating valid addresses within memory range
    constraint addr_c {
      address inside {[32'h00000000 : 32'h0000FFFF]}; // Address range
    }

    // Constraint to ensure at least 30% write operations
    constraint mode_c {
      mode dist {0 := 70, 1 := 30};  // 70% Read, 30% Write
    }

    // Constraint for data values
    constraint data_c {
      data inside {[8'h00 : 8'hFF]}; // Data range 0-255
    }

    function void display();
      $display("Transaction: Address = %h, Data = %h, Mode = %s", 
               address, data, (mode ? "Write" : "Read"));
    endfunction
  endclass

endpackage
