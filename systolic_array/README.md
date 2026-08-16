## Notes
- **MAC** (Multiply Accumulate) cell that multiplies and accumulates data
    - Performs r = r + (a * b)
    - Takes one clock cycle
- **PE** (Processing Element) cell that includes a MAC element but also passes the input variables
    - Processes accumulator through MAC
    - Replaces previous a_out and b_out with new a_in and b_in
- **Systolic Array** tightly coupled cells containing PEs that compute and pass data through the system
    - A 2x2 systolic array takes in two inputs from left and top
    - Processes in order of (PE00), (PE01, PE01), (PE11)

- **Input Delay** We delay inputs so that the correct accumulation occurs for matrix multiplication: eg. 
    - PE00 takes 1\*5 and PE01 takes 1\*6
    - We must stagger the next A value so that it properly accumulates 1\*5 and 1\*6, since 6 is a tick after five for B

| cycle | a_0 | a_1 | b_0 | b_1 |
| --- | :--- | :--- | :--- | :--- | 
| 0 | 1 | 0 | 5 | 0 |
| 1 | 2 | 3| 7 | 6 |
| 2 | 0 | 4 | 0 | 8 | 