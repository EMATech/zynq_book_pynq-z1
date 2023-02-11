###
# Automatically install/update board files from a git repository.
#
# 2022-01-09 Raphaël Doursenaud
###

###
# Usage
# 1. Clone the board files repository somewhere
# 2. Edit the path to match your clone
# 3. Place this file in:
# - Windows: %APPDATA%\Xilinx\Vivado
# - Linux: ~/Xilinx/Vivado/
###

set_param board.repoPaths [list  "G:/raph/Documents/GitHub/Digilent/pynq-z1_board_files"]