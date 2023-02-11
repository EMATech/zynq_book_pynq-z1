###
# Zynq Book Tutorials
#
# 2022-01-09 Raphaël Doursenaud
# Adapted for Digilent PYNQ-Z1
#
# Exercise 1B
###

# Create Block Design
create_bd_design "first_zynq_system"
update_compile_order -fileset sources_1

# Add ZXNQ PS
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# Connect to DDR and FIXED_IO using Board Preset
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# LEDs AXI GPIO in PL
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
endgroup

# Connect S_AXI to PS
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_gpio_0/S_AXI} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_gpio_0/S_AXI]

# Connect GPIO to Board LEDs
apply_bd_automation -rule xilinx.com:bd_rule:board -config { Board_Interface {leds_4bits ( 4 LEDs ) } Manual_Source {Auto}}  [get_bd_intf_pins axi_gpio_0/GPIO]

# Save block design
save_bd_design

# Validate design
validate_bd_design
# FIXME?
## WARNING: [BD 41-702] Propagation TCL tries to overwrite USER strength parameter PCW_M_AXI_GP0_FREQMHZ(10) on '/processing_system7_0' with propagated value(100). Command ignored

# Generate VHDL sources wrapper
make_wrapper -files [get_files G:/raph/Documents/Xilinx/Vivado/first_zynq_design/first_zynq_design.srcs/sources_1/bd/first_zynq_system/first_zynq_system.bd] -top
add_files -norecurse g:/raph/Documents/Xilinx/Vivado/first_zynq_design/first_zynq_design.gen/sources_1/bd/first_zynq_system/hdl/first_zynq_system_wrapper.vhd

# Generate bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 16
# FIXME?
## WARNING: [IP_Flow 19-4994] Overwriting existing constraint file 'g:/raph/Documents/Xilinx/Vivado/first_zynq_design/first_zynq_design.gen/sources_1/bd/first_zynq_system/ip/first_zynq_system_auto_pc_0/first_zynq_system_auto_pc_0_ooc.xdc'

# Open Implemented Design
open_run impl_1

# Export Hardware including bitstream for the SDK (deprecated)
write_hw_platform -fixed -include_bit -force -file G:/raph/Documents/Xilinx/Vivado/first_zynq_design/first_zynq_system_wrapper.xsa

# Vitis support? How?


