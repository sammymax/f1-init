#!/bin/bash
set -e

CENTOS_HOME=/home/centos

pushd $CENTOS_HOME

function setup_gui {
    info_msg "Setting up GUI packages"
    ker_ver=kernel-devel-
    ker_ver+=$(uname -r)
    echo $ker_ver
    sudo yum install -y $ker_ver # Needed to re-build ENA driver
    sudo yum update grub2 -y
    sudo yum -y install epel-release

    sudo yum groupinstall -y "Server with GUI"
    sudo yum groupinstall -y "MATE Desktop"
    sudo yum groupinstall -y "GNOME Desktop"

    sudo systemctl set-default graphical.target
    
    sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    sudo yum -y install -y xorgxrdp
    sudo yum install -y xrdp tigervnc-server

    cat > /home/centos/.Xclients << EOL
#!/bin/bash
exec mate-session
EOL
    chmod +x /home/centos/.Xclients

    sudo systemctl start xrdp
    sudo systemctl enable xrdp
    sudo systemctl disable firewalld
    sudo systemctl stop firewalld
}

function info_msg {
  echo -e "INFO: $1"
}

function err_msg {
  echo -e >&2 "ERROR: $1"
}

setup_gui

popd
