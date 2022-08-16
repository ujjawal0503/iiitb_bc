# iiitb_bc- Bidirectional up/down counter
This project simulates the bidirectional up/down counter.We can generate
an up or down counter using an external input 
## Introduction
A bidirectional counter is a sequential up/down
That has the ability to count in both directions
Either from some preset value as well as zero. In This up/down counter an external input is used for Using either up or down mode.
Counter that can count in both directions either Up or Down depending on the state of their input control pin and these are known as Bidirectional Counters.<br />

![image](https://user-images.githubusercontent.com/110776724/183385598-d86245ce-69bf-43d6-ad32-10743ec34b26.png)

## Applications
1.This type of counter can be utilized as a self-reversing counter.<br />
2.This counter can also be used as a clock divider circuit.<br />
3.This type of counter is used in car parking slots.<br />
4.These counters are used for low noise emission and low power applications.<br />
5.These are used as frequency dividers.

## block diagram of bidirectional counter

![jk up down](https://user-images.githubusercontent.com/110776724/183378078-c9c3f873-806b-432f-8901-fcdd151d2895.png)

In this circuit we are making a two bit up down counter using jk flip flops and an external input X is used to use either up or down counter. <br />
When we use X = 0 our counter behaves as an up counter ,it advances in the sequence (0 , 1 ,2 ,3) and then back again to zero and when X= 1 counter moves in reverse
sequence(3,2,1,0) .Generally, most bidirectional counters can be made to change their count Direction up or down at any point of time.This counter can be synchronously
incremented or decremented based on the CLK transition from low to high <br /> <br />
![image](https://user-images.githubusercontent.com/110776724/183384912-971b4888-eb70-46c9-8109-003f367d37f9.png)
<br/>
## Pre Layout Simulation <br/>
![pre_layout_simulation](https://user-images.githubusercontent.com/110776724/183904469-8b3e16d0-e636-4ec5-9570-389935914ac9.png)


## About verilog
Icarus Verilog is an implementation of the Verilog hardware description language
<br />
## About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog
VCD/EVCD files and allows their viewing<br />

## Installing iverilog and GTKWave

### for ubuntu

Open your terminal and type the following to install iverilog and GTKWave<br /> <br />
```
$   sudo apt-get update
$   sudo apt-get install iverilog gtkwave
```

## Function simulation
To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal.
```
$ git clone https://github.com/ujjawal0503/iiitb_bc/
$ iverilog iiitb_bc.v iiitb_bc_tb.v
$ ./a.out
$ gtkwave iiitb_bc_out.vcd
```

## Post synthesis simulation <br />
The software used to run gate level synthesis is Yosys. Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains. Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the Yosys C++ code base <br />
```
git clone https://github.com/YosysHQ/yosys.git
make
sudo make install make test
```
<br />

The commands to run synthesis in yosys are given below. First create an yosys script yosys_run.sh and paste the below commands.
```
read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog iiitb_gc.v
synth -top iiitb_gc	
dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
write_verilog -noattr iiitb_gc_synth.v
stat
show
```
<br />
Then, open terminal in the folder iiitb_gc and type the below command.
<br />

```
yosys -s yosys_run.sh
```
<br />
On running the yosys script, we get the following output:

- Stats <br />

![netlist](https://user-images.githubusercontent.com/110776724/184705228-6ae076e1-f1b2-48a5-b347-20168ce8531b.png)
<br />
<br />
- This is how layout is looking at first glance before proper placement<br />

![rtl_synth](https://user-images.githubusercontent.com/110776724/184705699-7ca8d39d-be8e-42ee-8579-e265add0d421.png)<br />
## GATE level simulation<br />
GLS stands for gate level simulation. When we write the RTL code, we test it by giving it some stimulus through the testbench and check it for the desired specifications. Similarly, we run the netlist as the design under test (dut) with the same testbench. Gate level simulation is done to verify the logical correctness of the design after synthesis. Also, it ensures the timing of the design.
Commands to run the GLS are given below.<br />
```
iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 iiitb_bc_synth.v iiitb_bc_tb.v iiitb_bc/verilog_model/primitives.v /iiitb_bc/verilog_model/sky130_fd_sc_hd.v -iiitb_bc
./iiitb_bc
gtkwave iiitb_bc.vcd
```
![post_synth](https://user-images.githubusercontent.com/110776724/184706578-59b14ff8-9f0a-4e58-a6b4-40c3e2238d8e.png)


## Contributors 

- **Ujjawal Sharma**
- **Kunal Ghosh** 



## Acknowledgments

- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

## Contact Information

- Ujjawal sharma, Postgraduate Student, International Institute of Information Technology, Bangalore ujjawal0503@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com

## References:
1.> https://verilogcodes.blogspot.com/2015/10/verilog-code-for-updown-counter-using.html <br />
2.> https://www.electronics-tutorials.ws/counter/count_4.html#:~:text=Bidirectional%20counters%2C%20also%20known%20as,control%20input%20as%20shown




 



