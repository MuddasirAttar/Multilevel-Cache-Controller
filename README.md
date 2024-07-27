# Multilevel-Cache-Controller

# Multilevel-Cache-Controller

# Multi-Level Cache Controller System

This project implements a multi-level cache controller system with L1 and L2 caches interfacing with main memory. The design includes modules for L1 Cache Memory, L2 Cache Memory, Main Memory, and a Controller that manages read and write operations. A testbench is provided to simulate and validate the functionality of the cache controller.

## Directory Structure

```
.
├── Controller.sv          # Main cache controller module
├── L1_Memory.sv           # L1 cache memory module
├── L2_Memory.sv           # L2 cache memory module
├── MAIN_MEMORY.sv         # Main memory module
├── Testbench.sv           # Testbench for simulation
└── README.md              # This README file
```

## Modules Description

### Controller
**File:** `Controller.sv`

The Controller module orchestrates read and write operations between the L1 and L2 caches and the main memory. It handles cache hits and misses, performs data fetching, and manages cache eviction policies.

**Key Parameters:**
- `no_of_address_bits`: Number of address bits.
- `byte_size`: Number of bits in a byte.
- `no_of_l2_ways`, `no_of_l2_ways_bits`: L2 cache associativity and its bit representation.
- `no_of_l2_blocks`, `no_of_l2_index_bits`, `no_of_l2_tag_bits`: L2 cache configuration.
- `no_of_l1_blocks`, `no_of_l1_index_bits`, `no_of_l1_tag_bits`: L1 cache configuration.
- `main_memory_block_size`, `no_of_main_memory_blocks`: Main memory configuration.
- `l1_latency`, `l2_latency`, `main_memory_latency`: Latency parameters for each memory level.

### L1_Memory
**File:** `L1_Memory.sv`

The L1_Memory module represents a direct-mapped cache with multiple blocks. It includes tag and valid arrays to manage cache coherence.

**Key Parameters:**
- `no_of_l1_blocks`: Number of lines in L1 cache.
- `no_of_bytes_l1_block`, `l1_block_bit_size`: Block size in bytes and bits.
- `byte_size`: Number of bits in a byte.
- `no_of_address_bits`, `no_of_l1_index_bits`, `no_of_l1_tag_bits`: Address, index, and tag bit configurations.

### L2_Memory
**File:** `L2_Memory.sv`

The L2_Memory module represents a 4-way set associative cache. It includes tag, valid, and LRU arrays to manage cache blocks and eviction policies.

**Key Parameters:**
- `no_of_l2_ways`, `no_of_l2_ways_bits`: L2 cache associativity and its bit representation.
- `no_of_l2_blocks`, `no_of_l2_index_bits`, `no_of_l2_tag_bits`: L2 cache configuration.
- `no_of_bytes_l2_block`, `l2_block_bit_size`: Block size in bytes and bits.
- `byte_size`: Number of bits in a byte.
- `no_of_address_bits`: Number of address bits.

### MAIN_MEMORY
**File:** `MAIN_MEMORY.sv`

The MAIN_MEMORY module represents the main memory with a simple linear address space.

**Key Parameters:**
- `no_of_main_memory_blocks`: Number of lines in main memory.
- `main_memory_block_size`, `no_of_bytes_main_memory_block`: Block size in bits and bytes.
- `byte_size`: Number of bits in a byte.

### Testbench
**File:** `Testbench.sv`

The Testbench module is used to simulate and validate the functionality of the Controller and its interactions with the L1, L2 caches, and main memory.

## Getting Started

### Prerequisites
- Xilinx Vivado or any other SystemVerilog-compatible simulator.
- Basic knowledge of SystemVerilog and digital design.

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/MuddasirAttar/Multilevel-cache-controller.git
   cd Multilevel-cache-controller
   ```
2. Open Xilinx Vivado (or your preferred simulator) and create a new project.
3. Add the SystemVerilog files (`Controller.sv`, `L1_Memory.sv`, `L2_Memory.sv`, `MAIN_MEMORY.sv`, `Testbench.sv`) to the project.
4. Set `Testbench.sv` as the top module for simulation.

### Running the Simulation
1. In the simulator, run the simulation for the Testbench module.
2. Observe the waveform and console output to verify the cache controller's functionality.
3. Modify the testbench as needed to add more test cases.

## Features
- Multi-level cache hierarchy with L1 and L2 caches.
- Direct-mapped L1 cache and 4-way set associative L2 cache.
- Cache hit and miss handling with appropriate data fetching.
- Cache eviction policies managed by the Least Recently Used (LRU) algorithm.
- Configurable latencies for L1, L2 caches, and main memory.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements
Thanks to the contributors and the open-source community for their valuable inputs and suggestions.

## Contact
For any queries or issues, please open an issue in the repository.

