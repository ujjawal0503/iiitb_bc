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
![post_synth](https://user-images.githubusercontent.com/110776724/184706578-59b14ff8-9f0a-4e58-a6b4-40c3e2238d8e.png)<br />

## Physical Design from Netlist to GDSII
Physical design is process of transforming netlist into layout which is manufacture-able [GDS]. Physical design process is often referred as PnR (Place and Route). Main steps in physical design are placement of all logical cells, clock tree synthesis & routing. During this process of physical design timing, power, design & technology constraints have to be met. Further design might require being optimized w.r.t power, performance and area.

Below are the stages and the respective tools that are called by openlane for the functionalities as described:
<br />
![physical design flow](https://user-images.githubusercontent.com/110462872/187619635-a5fdc45c-5c81-4d43-b22c-6cd182538c60.JPG)
<br />

## Openlane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

more at https://github.com/The-OpenROAD-Project/OpenLane
<br />




#### Installation instructions 
```
$   apt install -y build-essential python3 python3-venv python3-pip
```
Docker installation process: https://docs.docker.com/engine/install/ubuntu/

```
$ sudo apt-get remove docker docker-engine docker.io containerd runc (removes older version of docker if installed)
$ sudo apt-get update
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release    
$ sudo mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null  
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
$ apt-cache madison docker-ce (copy the version string you want to install)
$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin (paste the version string copies in place of <VERSION_STRING>)
$ sudo docker run hello-world (If the docker is successfully installed u will get a success message here)
```

### Installation of OpenLane on ubuntu

goto home directory->
```
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
```
To test the open lane
```
$ sudo make test
```
It takes approximate time of 5min to complete. After 43 steps, if it ended with saying **Basic test passed** then open lane installed succesfully.

## Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

More about magic at http://opencircuitdesign.com/magic/index.html

For Magic to be installed and work properly the following softwares have to be installed first:
Run following commands one by one to fulfill the system requirement.

Installing csh
```
$ sudo apt-get install csh
```
Installing x11/xorg
```
$ sudo apt-get install x11
```
```
$ sudo apt-get install xorg
```
```
$ sudo apt-get install xorg openbox
```
Installing GCC
```
$ sudo apt-get install gcc
```
Installing build-essential
```
$ sudo apt-get install build-essential
```
Installing OpenGL
```
$ sudo apt-get install freeglut3-dev
```
Installing tcl/tk
```
$ sudo apt-get install tcl-dev tk-dev
```

**To install magic**
goto home directory

```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```
type **magic** terminal to check whether it installed succesfully or not. type **exit** to exit magic.

Klayout Installation
```
$ sudo apt-get install klayout
```

# Layout

## Preparation
The layout is generated using OpenLane. To run a custom design on openlane, Navigate to the openlane folder and run the following commands:<br>
```
$ cd designs

$ mkdir iiitb_bc

$ cd iiitb_bc

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_bc.v
```

The iiitb_bc.v file should contain the verilog RTL code you have used and got the post synthesis simulation for. <br>

Copy  `sky130_fd_sc_hd__fast.lib`, `sky130_fd_sc_hd__slow.lib`, `sky130_fd_sc_hd__typical.lib` and `sky130_vsdinv.lef` files to `src` folder in your design. <br>

The final src folder should look like this: <br>


<br>

The contents of the config.json are as follows. this can be modified specifically for your design as and when required. <br>

As mentioned by kunal sir dont use defined `DIE_AREA` and `FP_SIZING : absolute`, use `FP_SIZING : relative`
```
{
    "DESIGN_NAME": "iiitb_bc",
    "VERILOG_FILES": "dir::src/iiitb_bc.v",
    "CLOCK_PORT": "clkin",
    "CLOCK_NET": "clkin",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "CLOCK_PERIOD": 10,
    "PL_TARGET_DENSITY": 0.7,
    "FP_SIZING" : "relative",
    "pdk::sky130*": {
        "FP_CORE_UTIL": 30,
        "scl::sky130_fd_sc_hd": {
            "FP_CORE_UTIL": 20
        }
    },
    
    "LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
    "LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
    "LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
    "LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",  
    "TEST_EXTERNAL_GLOB": "dir::../iiitb_bc/src/*"


}
```



Save all the changes made above and Navigate to the openlane folder in terminal and give the following command :<br>
**1. Running openlane in interactive mode:**
        The commands to the run the flow in interactive mode is given below:

```
$ make mount (if this command doesnot go through prefix it with sudo)
```

![sudo mount](https://user-images.githubusercontent.com/110776724/189496341-bfb60237-7803-4f1d-b8ba-02b8ed131fe1.png)




After entering the openlane container give the following command:<br>
```
$ ./flow.tcl -interactive
```
![tcl](https://user-images.githubusercontent.com/34582183/187881816-c1577234-597b-4231-8d20-8201357022ad.png)


This command will take you into the tcl console. In the tcl console type the following commands:<br>

```
 % package require openlane 0.9
```
<br/>

![openlane 0 9](https://user-images.githubusercontent.com/34582183/187881881-aabd0933-83e1-42d2-9887-ad7d854bcec3.png)


**2. Preparing the design and including the lef files:**
      The commands to prepare the design and the reports and results along with the command to include the lef files is given below:
      
```
% prep -design iiitb_bc
```
<br>

The following commands are to merge external the lef files to the merged.nom.lef. In our case sky130_vsdiat is getting merged to the lef file <br>
```
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

```
![set lefs terminal](https://user-images.githubusercontent.com/110776724/189498636-a3d41271-671c-4218-8a49-46c24c11e0a3.png)

<br/>

## Synthesis
**1. The command to run the synthesis** is ```run_synthesis```.This runs the synthesis where yosys translates RTL into circuit using generic components and abc maps the circuit to Standard Cells.
<br/>

```
%  run_synthesis
```
<br/>

![step1synthesis terminal](https://user-images.githubusercontent.com/110776724/189499086-eb2fc781-3fcc-4843-ad8f-01105f565f26.png)

<br/>

**2. The synthesized netlist** is present in the results folder and the stats are present in the reports folder

![stats](https://user-images.githubusercontent.com/110776724/189500715-e6b3e52b-3327-41b7-9080-0d9b976bae10.png)


**3. Calcuation of Flop Ratio:**
  
<br/>

 ``` 
 Flop ratio = Number of D Flip flops 
              ______________________
              Total Number of cells 
 ```
 
 <br/>
  
## Floorplan
<br/>

**To run the Floorplan use the command:**

```
% run_floorplan
```

<br/>

![floorplan terminal](https://user-images.githubusercontent.com/110776724/189500204-3364699f-9a10-422e-a065-2504412d132b.png)

<br>


### Floorplan Reports

Navigate to results->floorplan and type the Magic command in terminal to open the floorplan <br>
```
$ magic -T /home/ujjawal/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_bc.def &
```
<br>
Floorplan view

![floorplan](https://user-images.githubusercontent.com/110776724/189497196-e1d37e9c-91f5-40d9-b06a-bfd3702c30fe.png)


**Die Area post floorplan:**

![diearea](https://user-images.githubusercontent.com/110776724/189500793-318f2cf2-5f1b-430c-a481-197a647ed3f4.png)

**Core Area post floorplan:**

![corearea](https://user-images.githubusercontent.com/110776724/189501018-2c84ad61-50f3-456d-9afd-8e86a1b4e888.png)


## Placement

**To run the Placement use the command:** 

```
% run_placement
```

![placement terminal](https://user-images.githubusercontent.com/110776724/189497250-c23f0293-cc3d-467f-925b-bd0209cc5845.png)

### Placement Reports
Navigate to results->placement and type the Magic command in terminal to open the placement view <br>
```
$ magic -T /home/ujjawal/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.max.lef def read iiitb_bc.def &
```
<br>
Placement View <br>
<br>

![placement](https://user-images.githubusercontent.com/110776724/189497297-2f66761b-9e1d-42df-a6d8-c2fd5cf81c8a.png)

<br>
<b>sky130_vsdinv</b> in the placement view :<br>
<br>

![vsdinv](https://user-images.githubusercontent.com/110776724/189497322-fb41cc80-1b69-4aac-b76e-d02c65673676.png)

<br>
<br>

**Area report post placement_resizing:**

![designarea](https://user-images.githubusercontent.com/110776724/189500930-1089000c-a2e7-4d74-bbf1-3af4510b52c1.png)


## Clock Tree Synthesis


**To run CTS use the below command:**


```
% run_cts
```
![cts terminal](https://user-images.githubusercontent.com/110776724/189497375-e84d304e-a313-48ef-b697-3cf7181e48ee.png)

## Routing
```
% run_routing
```

![routing terminal](https://user-images.githubusercontent.com/110776724/189497387-4732bcb4-b657-4c9c-a6c7-e18fcacc6b8f.png)

### Routing Reports
Navigate to results->routing and type the Magic command in terminal to open the routing view <br>
```
$ magic -T /home/ujjawal/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_bc.def &
```

Routing View<br>
<br>
![routing](https://user-images.githubusercontent.com/110776724/189497452-cd5c0153-427d-4abc-9146-dff7d772aa71.png)

### NOTE
We can also run the whole flow at once instead of step by step process by giving the following command in openlane container<br>
```
$ ./flow.tcl -design iiitb_4bbc
```
<br>![non-interactive command](https://user-images.githubusercontent.com/34582183/187885803-ca195cac-b0aa-4416-921e-26031b77a9de.png)
<br>
All the steps will be automated and all the files will be generated.<br>

## RESULTS

###  1.GATE COUNT
![stats exam with terminal](https://user-images.githubusercontent.com/110776724/192646991-7277bc25-7450-49a1-a1e4-d738edc9b4a7.png)
<br />
Total Gate Count = 24
<br />

### 2.Area
![area with terminal exam](https://user-images.githubusercontent.com/110776724/192647427-0c9ed4a1-9558-4493-89df-fe37a0a7f2f8.png)
<br />
Area = 7008um^2
<br />
<br />

### 3.Perfomance
![slack exam](https://user-images.githubusercontent.com/110776724/192647745-73ba6183-b414-46c5-a4c7-699267b87d80.png)
<br />
Perfomance = 1/(65-51.26) =72.78MHz
<br />
<br />

### 4.Flop To Standard Cell ratio
![stats exam with terminal](https://user-images.githubusercontent.com/110776724/192648537-14f1d34b-1277-4f89-aba6-b684f3f46dbc.png)
<br />
Flop Ratio = 4/24 =.16
<br />
<br />

### 5.Power
![power weith terminal](https://user-images.githubusercontent.com/110776724/192649718-20f9f9bf-2672-48fc-b78f-09d07470fa57.png)
<br />
Internal power = .659 uW (53.2%) <br />
Switching power = .579 uW (46.8%) <br />
Leakage Power = .271 nW (0.0%) <br />
Total Power = 1.24 uW (100 %) <br />













    





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




 



