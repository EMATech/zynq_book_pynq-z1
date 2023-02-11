###
# Zynq Book Tutorials
#
# 2022-01-09 Raphaël Doursenaud
# Adapted for Digilent PYNQ-Z1
#
# Exercise 1A
###

create_project first_zynq_design G:/raph/Documents/Xilinx/Vivado/first_zynq_design -part xc7z020clg400-1
set_property board_part www.digilentinc.com:pynq-z1:part0:1.0 [current_project]
set_property target_language VHDL [current_project]
# Add missing Vitis integration that replaced the SDK?
#set_property platform.extensible true [current_project]