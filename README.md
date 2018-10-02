# race-vm


## Create a and Publish Tarball

Create a tarball of this repository:

    tar czf /tmp/ansible.tar.gz .

Publish that tarball to the S3 bucket.


## Run Ansible

This installs a sample RACE VM. Please start with a plain EL7 based image, sync from
the S3 bucket and execute the following as root: 

    ./run-ansible.sh

This will install Ansible, and run the playbook to configure the VM and install
required software. With a clean VM, the step can take a long time.

If you want the graphical user interface, reboot the VM.

A cron job will also be deployed so that the VM will regularly check this playbook
for changes. If changes are found, the updated playbook will be applied automatically.

