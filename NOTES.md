## Notes
`verilator --lint-only file.sv` for linting  
`verilator --binary file.sv` to compile into an executable  
`verilator --binary --timing --top-module mod file1.sv file2.sv` to combine two files into `Vexe`  

`./obj_dir/Vexe` to run the C++ compiled script  

`--top-module` means the module named mod is the top-level module
`--timing` means support timing constructs (eg. #5 for simulated timing or @(posedge clk) for the proper delay)
