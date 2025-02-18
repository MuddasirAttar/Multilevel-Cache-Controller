`timescale 1ns / 1ps

package cache_cov_pkg;

  class cache_coverage;
    covergroup cache_hits_misses @(posedge clk);
      coverpoint hit1 { bins l1_hit = {1}; bins l1_miss = {0}; }
      coverpoint hit2 { bins l2_hit = {1}; bins l2_miss = {0}; }
      cross hit1, hit2; // Cross coverage for L1/L2 hits & misses
    endgroup

    covergroup access_type @(posedge clk);
      coverpoint mode { bins read = {0}; bins write = {1}; }
    endgroup

    covergroup lru_behavior @(posedge clk);
      coverpoint lru_value { bins lru_vals[] = {[0:3]}; } // LRU for 4-way set associative
    endgroup

    covergroup cache_eviction @(posedge clk);
      coverpoint l1_to_l2_search { bins evict_to_l2 = {1}; }
      coverpoint l2_evict_tag { bins evict_to_main_mem = {0}; }
    endgroup

    function new();
      cache_hits_misses = new();
      access_type = new();
      lru_behavior = new();
      cache_eviction = new();
    endfunction

    task sample(input logic [31:0] addr, input logic mode, input logic hit1, input logic hit2);
      cache_hits_misses.sample();
      access_type.sample();
      lru_behavior.sample();
      cache_eviction.sample();
    endtask

    function void display_coverage();
      $display("Coverage - Hits/Misses: %0.2f%%", cache_hits_misses.get_coverage());
      $display("Coverage - Access Types: %0.2f%%", access_type.get_coverage());
      $display("Coverage - LRU Behavior: %0.2f%%", lru_behavior.get_coverage());
      $display("Coverage - Evictions: %0.2f%%", cache_eviction.get_coverage());
    endfunction

  endclass

endpackage
