transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Files/Programming/Verilog\ and\ FPGA/Lessons/Week\ 13 {C:/Files/Programming/Verilog and FPGA/Lessons/Week 13/main_decoder.v}

