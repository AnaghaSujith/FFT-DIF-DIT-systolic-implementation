# FFT Implementation Using Verilog and SystemVerilog

This repository presents the implementation of the **Fast Fourier Transform (FFT)** using both **Decimation-in-Time (DIT)** and **Decimation-in-Frequency (DIF)** algorithms in Verilog. It also includes their **systolic architecture variants** for improved performance. The functionality of each module is verified using **layered SystemVerilog testbenches**, and **Cadence Genus** is used for RTL synthesis and hardware optimization analysis.

---

##  Features

-  **DIT and DIF FFT Implementations** in Verilog  
-  **Systolic Architectures** for pipelined and parallel computation  
-  **Synthesis and Optimization Reports** using Cadence Genus  


---

##  Repository Structure

| Folder         | Description                                        |
|----------------|----------------------------------------------------|
| `dif systolic/`         | RTL files for systolic DIF filter        |
| `dif/`   | RTL files for DIF filter                         |
| `dit systolic/`         | RTL files for systolic DIT filter                 |
| `dit/` | RTL files for DIT filter      |
| `results/` | all the simulation and synthesis reports      |



---

##  Tools Used

- **Language:** Verilog HDL
- **Simulation:** Xcelium / ModelSim / VCS (any standard HDL simulator)  
- **Synthesis:** Cadence Genus (for RTL-level optimization and area/timing reports)  

---

##  Synthesis Comparison
**DIT FFT**

| Architecture         | Area (µm²)   | Power (Watts) | Slack (ps) | Frequency (MHz) |Notes   |
|----------------------|--------------|---------------|------------|---------------------------------|
| Without systolic     | *12331.008*  | *6.6463x10^-4* |    *7640*  |    *423.72*     |*report for DIT without systolic*|
| With systolic        | *8266.752*  | *1.56193x10^-4* |    *9202*  |    *1253*     |*report for DIT with systolic*|


**DIF FFT**

| Architecture         | Area (µm²)   | Power (Watts) | Slack (ps) | Frequency (MHz) |Notes   |
|----------------------|--------------|---------------|------------|---------------------------------|
| Without systolic     | *12016.742.008*  | *6.38102x10^-4* | *7705*  |    *435.72*   |*report for DIF without systolic*|
| With systolic        | *8266.752*  | *1.56193x10^-4* |    *9202*  |    *1253*     |*report for DIF with systolic*|
>  Detailed reports are available in the `/results/` folder.

---



##  Key Learnings

- Verified FFT correctness for both DIT and DIF methods  
- Demonstrated benefits of systolic architectures (e.g., throughput, pipelining)  
- Compared synthesis metrics using a professional RTL synthesis tool  
- Showcased trade-offs between latency, area, and performance  

---



