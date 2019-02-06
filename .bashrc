# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# by default the repo dir is ~/src/project-data/aws-fpga, this is fine
# export AWS_FPGA_REPO_DIR=~/aws-fpga
source $AWS_FPGA_REPO_DIR/hdk_setup.sh
export EMAIL=<email here>
$AWS_FPGA_REPO_DIR/shared/bin/scripts/notify_via_sns.py
source $XILINX_SDX/settings64.sh

export PATH=$PATH:~/make-afi
