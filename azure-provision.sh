#!/bin/bash

#need to scp over WALinuxAgent and lis-rpms-4.2.5-2.tar.gz (Linux Agent and Linux Integration Services)

#.zip file location on your instance
AZURE_LINUX_AGENT="./WALinuxAgent-2.2.30.zip"

#Linux Integration Services Tar
LIS_FOLDER_TAR="./lis-rpms-4.2.5-3.tar.gz"

#Centos Version
centos="CentOS67"

#------------------------------------------------------------------------

main()
{

array_of_functions=(install_azure_linux_agent install_LIS uninstall_NM replace_sysconfig_network replace_network_scripts modify_udev network_start modify_boot_kernel deprovision_)
echo "Starting Provision" > azure.log

for function_ in ${array_of_functions[@]} ; do
echo $function_ >> azure.log
if $function_ ; then
echo "Successful" >> azure.log
else
echo "Failed - fix manually" >> azure.log
fi
done
echo "Done Provisioning"
echo "See azure.log for details" 

exit
#END OF MAIN
}


#---------------Functions---------------

install_azure_linux_agent()
{
#unzip azure linux agent
unzip $AZURE_LINUX_AGENT

#go to directory and use their install script
local agent_dir=${agent%.*}
cd $agent_dir
python setup.py install
service waagent restart
waagent --version
}

install_LIS()
{
cd ..

#extract tar
tar xvzf $LIS_FOLDER_TAR

#go to LISISO directory
cd ./LISISO

#go to Centos Folder - 6.7
cd ./$centos

#use install.sh there
./install.sh
}


uninstall_NM()
{
#Make sure NetworkManager is uninstalled
rpm -e --nodeps NetworkManager
}

replace_sysconfig_network()
{
(
echo "NETWORKING=yes"
echo "HOSTNAME=localhost.localdomain"
) > /etc/sysconfig/network
}

replace_network_scripts()
{
(
echo "DEVICE=eth0"
echo "ONBOOT=yes"
echo "BOOTPROTO=dhcp"
echo "TYPE=Ethernet"
echo "USERCTL=no"
echo "PEERDNS=yes"
echo "IPV6INIT=no"
) > /etc/sysconfig/network-scripts/ifcfg-eth0
}


modify_udev()
{
#Modify udev rules to avoid generating static rules for the Ethernet interface(s).""
#"These rules can cause problems when cloning a virtual machine in Microsoft Azure or Hyper-V"
sudo ln -s /dev/null /etc/udev/rules.d/75-persistent-net-generator.rules
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules
}


network_start()
{
#Ensure network service will start at boot
sudo chkconfig network on
}

modify_boot_kernel()
{
#add console=ttyS0 earlyprintk=ttyS0 rootdelay=300 to kernel parameters
#removes rhgb quiet crashkernel=auto
#boot found at /etc/grub.conf and /boot/grub/grub.conf - change both just in case

echo "Enter Boot Stuff Here" > /etc/grub.conf


echo "Enter Boot Stuff Here" > /boot/grub/grub.conf

}

deprovision_()
{
#deprovision virutal machine (except we are leaving in root username)
export HISTSIZE=0
}

#run the script
main