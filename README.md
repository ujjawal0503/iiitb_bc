# iiitb_BC- Bidirectional up/down counter
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

## About verilog
Icarus Verilog is an implementation of the Verilog hardware description language
<br />
## About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog
VCD/EVCD files and allows their viewing<br />

## Installing iverilog and GTKWave

### for ubuntu

Open your terminal and type the following to install iverilog and GTKWave<br /> <br />



 



