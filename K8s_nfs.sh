#!/bin/bash 
#############################################################
if sudo -n true 2>/dev/null; then 
  echo  "you have sudo privilege, the installation will begin "

  function nfs_function {
  	sudo dnf install nfs-utils -y > /dev/null 2>&1
	sudo mkdir /nfstest
	sudo sh -c 'echo "/nfstest	*(rw,no_root_squash)" >> /etc/exports'
	sudo systemctl enable --now nfs-server.service 
}
nfs_function
else
  echo  " you don't have sudo privilege, run the script again with another sudo user "
exit 1
fi
#############################################################
if [ $? -eq 0 ]; then 
	echo -e " nfs server installed successfully \nrun this command on the worker nodes too: "sudo dnf install nfs-utils -y" "
else 
	echo " something wrong, check again "
fi

