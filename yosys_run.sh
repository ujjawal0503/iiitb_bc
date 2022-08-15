# read design

read_verilog iiitb_bc.v

# generic synthesis
synth -top iiitb_bc

# mapping to mycells.lib
dfflibmap -liberty /home/arsh/iiitb_bc/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
opt
abc -liberty /home/arsh/iiitb_bc/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
opt
clean
flatten
# write synthesized design (forms the netlist)
write_verilog -noattr iiitb_bc_synth.v
stat
show
