#/bin/sh

env

sudo echo -e "\n** Disabling SELINUX"
sudo sed -i "s/^SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config

sudo echo -e "\n** Setting correct time zone"
sudo timedatectl set-timezone America/Indiana/Indianapolis

sudo echo -e "\n** Converting groups"
sudo yum groups mark convert
sudo echo -e "\n** Installing \'X Window System\' yum group"
sudo yum groups install -y 'X Window System'
sudo echo -e "\n** Installing \'Development Tools\' yum group"
sudo yum groups install -y 'Development Tools'
sudo echo -e "\n** Installing common/useful packages"
sudo yum install -y deltarpm acpid bind-utils bash-completion screen xinetd man psmisc mlocate net-tools yum-utils lsof vim tmux man-pages gedit firefox nmap nfs-utils

sudo echo -e "\n** Disabling and removing firewalld"
sudo systemctl disable firewalld.service
sudo yum remove firewalld -y

sudo echo -e "\n** Disabling Postfix service"
sudo systemctl disable postfix.service

sudo echo -e "\n** Enabling optional and extras repos"
#sudo yum-config-manager --enable rhui-REGION-rhel-server-optional --save
#sudo yum-config-manager --enable rhui-REGION-rhel-server-extras --save
#sudo yum-config-manager --enable rhel-7-server-rhui-optional-rpms --save
#sudo yum-config-manager --enable rhel-7-server-rhui-extras-rpms --save
sudo yum-config-manager --enable rhui-REGION-rhel-server-optional rhui-REGION-rhel-server-extras rhel-7-server-rhui-optional-rpms rhel-7-server-rhui-extras-rpms --save

#sudo echo -e "\n** Installing ansible"
#sudo yum install -y ansible

sudo echo -e "\n** Installing EPEL and excluding ansible from getting installed from EPEL"
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum-config-manager --setopt=epel.exclude=ansible --save

sudo echo -e "\n** Installing python2-pip"
sudo yum install -y python2-pip

sudo echo -e "\n** Installing awscli python package"
sudo pip install -U awscli

#sudo echo "## This adds time stamps to the history file, so that time stamps appear when running the history command." > /etc/profile.d/history_timestamp.sh
#sudo echo "export HISTTIMEFORMAT='%F %T '" >> /etc/profile.d/history_timestamp.sh

sudo mv /tmp/history_timestamp.sh /etc/profile.d/.

sudo echo -e "\n** Fully updating system **"
sudo yum update -y

sudo echo -e "\n** Re-enabling optional and extras repos"
#sudo yum-config-manager --enable rhui-REGION-rhel-server-optional --save
#sudo yum-config-manager --enable rhui-REGION-rhel-server-extras --save
#sudo yum-config-manager --enable rhel-7-server-rhui-optional-rpms --save
#sudo yum-config-manager --enable rhel-7-server-rhui-extras-rpms --save
sudo yum-config-manager --enable rhui-REGION-rhel-server-optional rhui-REGION-rhel-server-extras rhel-7-server-rhui-optional-rpms rhel-7-server-rhui-extras-rpms --save

sudo yum repolist

sudo yum update -y

#sudo yum repolist

sudo echo -e "\n** Setting up users"
for user in mvanderw sbogol rafsilva vahi abrinckm
do
  sudo echo -e "\n* Setting up user $user"
  sudo adduser $user
  sudo mkdir /home/$user/.ssh
  #sudo cat /tmp/ssh_keys/$user.pub > /home/$user/.ssh/authorized_keys
  sudo /bin/mv -f /tmp/ssh_keys/$user.pub /home/$user/.ssh/authorized_keys
  sudo chmod -R go-rwx /home/$user/.ssh
  sudo chown -R $user:$user /home/$user/.ssh
  #sudo echo $user-sudo
  sudo echo "$user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user-sudo
  #sudo rm -f /tmp/$user.pub
done

sudo rm -rf /tmp/ssh_keys

sudo echo -e "\n** DONE with bootstrap **\n"
