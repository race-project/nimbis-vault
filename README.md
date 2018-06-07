# race-vm

This installs a sample RACE VM. Please start with a plain EL7 based image, and 
execute the following as root:

    curl https://raw.githubusercontent.com/pegasus-isi/race-vm/master/bootstrap.sh | bash -

This will install Ansible, and run the playbook to configure the VM and install
required software. With a clean VM, the step can take a long time.

If you want the graphical user interface, reboot the VM.

A cron job will also be deployed so that the VM will regularly check this git 
repository for changes. If changes are found, the repository will be fetched
and the updated playbook will be applied automatically.

