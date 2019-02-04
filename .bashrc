# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export AWS_FPGA_REPO_DIR=~/aws-fpga
source $AWS_FPGA_REPO_DIR/hdk_setup.sh
export EMAIL=pohsnu12@mit.edu
$AWS_FPGA_REPO_DIR/shared/bin/scripts/notify_via_sns.py
source $XILINX_SDX/settings64.sh

export PATH=$PATH:~/make-afi
