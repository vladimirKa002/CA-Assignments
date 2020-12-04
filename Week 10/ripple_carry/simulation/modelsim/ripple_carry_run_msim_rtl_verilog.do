transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Files/Programming/Verilog\ and\ FPGA/Lessons/Week\ 10/ripple_carry {C:/Files/Programming/Verilog and FPGA/Lessons/Week 10/ripple_carry/ripple_carry.v}
vlog -vlog01compat -work work +incdir+C:/Files/Programming/Verilog\ and\ FPGA/Lessons/Week\ 10/ripple_carry {C:/Files/Programming/Verilog and FPGA/Lessons/Week 10/ripple_carry/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Files/Programming/Verilog\ and\ FPGA/Lessons/Week\ 10/ripple_carry {C:/Files/Programming/Verilog and FPGA/Lessons/Week 10/ripple_carry/half_adder.v}

