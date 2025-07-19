# FFT Implementation Using Verilog and SystemVerilog

This repository presents the implementation of the **Fast Fourier Transform (FFT)** using both **Decimation-in-Time (DIT)** and **Decimation-in-Frequency (DIF)** algorithms in Verilog. It also includes their **systolic architecture variants** for improved performance. The functionality of each module is verified using **layered SystemVerilog testbenches**, and **Cadence Genus** is used for RTL synthesis and hardware optimization analysis.

---

##  Features

-  **DIT and DIF FFT Implementations** in Verilog  
-  **Systolic Architectures** for pipelined and parallel computation  
-  **Synthesis and Optimization Reports** using Cadence Genus
-  **Layered Testbench** for verification


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


| Architecture         | Area (µm²)   | Power (Watts)     | Slack (ps) | Frequency (MHz) | Notes                           |
|----------------------|--------------|--------------------|------------|------------------|----------------------------------|
| Without Systolic     | 12,331.008   | 6.6463×10⁻⁴        | 7640       | 423.72           | DIT FFT without systolic design  |
| With Systolic        | 8,266.752    | 1.56193×10⁻⁴       | 9202       | 1253             | DIT FFT with systolic pipeline   |


**DIF FFT**

| Architecture         | Area (µm²)     | Power (Watts)     | Slack (ps) | Frequency (MHz) | Notes                           |
|----------------------|----------------|--------------------|------------|------------------|----------------------------------|
| Without Systolic     | 12,016.742     | 6.38102×10⁻⁴       | 7705       | 435.72           | DIF FFT without systolic design  |
| With Systolic        | 8,266.752      | 1.56193×10⁻⁴       | 9202       | 1253             | DIF FFT with systolic pipeline   |

---

##  Inference
The synthesis reports show that systolic architectures significantly reduce area and power consumption compared to non-systolic FFT designs. Both DIT and DIF implementations saw over 30% area savings and over 75% power reduction. The maximum frequency improved nearly 3×, highlighting enhanced performance due to pipelining. Overall, systolic FFTs offer superior efficiency, making them ideal for high-speed, low-power applications.

---



##  Key Learnings

- Verified FFT correctness for both DIT and DIF methods  
- Demonstrated benefits of systolic architectures  
- Compared synthesis metrics using a professional RTL synthesis tool  
- Showcased trade-offs between latency, area, and power  

---



