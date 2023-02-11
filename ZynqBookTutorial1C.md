Zynq Book Tutorials
===================

Adapted for Digilent PYNQ-Z1  
2022-01-09 Raphaël Doursenaud

Exercise 1C
-----------


### Dark theme for Vitis 2021.2 (Optional)

1. Add Eclipse repository  
   **Help > Install new software**  
   Add https://download.eclipse.org/releases/2020-03/
2. Add DevStyle  
   Add https://www.genuitec.com/updates/devstyle/ci/  
   Install **DevStyle Features > DevStyle**
3. Restart *Vitis* and follow wizard to finish configuration.


### Changes to the tutorial

Replace all *Xilinx SDK 2015.1* occurrences by *Xilinx Vitis 2021.2*.

The application wizard is slightly different but you should be able to follow along.

When prompted to import sources, use the `Zybo` version since it closely matches the 4 LEDs configuration found on the PYNQ-Z1 board.

The build is not automatic anymore.  
Select **Project > Build All (CTRL+B)** or the hammer icon in the toolbar to manually build the project.

Replace `system.mss` by `first_zynq_system_wrapper`.

Replace **Xilinx Tools > Program FPGA** by **Program Device**.

Replace **Run As > Launch on Hardware (GDB)** by **3 Launch Hardware (Single Application Debug (GDB))**.

The code runs on my board without any modifications.
