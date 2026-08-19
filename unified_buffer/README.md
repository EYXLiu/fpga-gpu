## Notes
- **Unified Buffer (BRAM)** is basically the memory used to hold data
    - small, on-chip
- **DRAM/SDRAM** is also memory
    - off-chip, much slower but much larger
- **USB** is the communication protocol between the computer and the FPGA
    - Dataflow is `USB -> DRAM -> BRAM`
    - BRAM only stores the chunks the model is looking at, DRAM stores the matrices