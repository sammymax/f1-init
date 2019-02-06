# f1-init
AWS FPGA dotfile/setup stuff

Setup steps:
1. Create an EC2 instance (not necessarily F1 instance, any instance will do although having sufficient CPU/RAM is recommended)
2. Choose the FPGA Developer AMI by Amazon from the AWS Marketplace
3. Make sure the root directory is big enough (>100GB is probably enough)
4. Make instance, clone this repo
5. Set EC2 security group rules to allow RDP (port 3389)
6. Run `setup_gui.sh` from this repo
   - as of Feb. 2019, the one included in the AMI at `~/src/scripts/setup_gui.sh` doesn't work; it silently fails on `sudo yum install -y kernel-devel`
7. Set your password; do `sudo passwd centos`
8. RDP should work now; test it
