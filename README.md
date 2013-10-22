Lsdacluster environment via vagrant (vagrantup.com).

Sets up a virtual machine (VM) on your computer which is a duplicate of a Lsdacluster node's environment.  This allows for local development.

Installation
============

Prereqs
* Install git http://git-scm.com/book/en/Getting-Started-Installing-Git
* Install Virtual Box https://www.virtualbox.org/wiki/Downloads
* Install Vagrant http://downloads.vagrantup.com/tags/v1.3.5

And now clone lsdacluster_vagrant

```bash
git clone https://github.com/cioc/lsdacluster_vagrant.git
```

Now edit bootstrap.sh to include your secret key and access key.

i.e. in lsdacluster_vagrant/bootstrap.sh :

```bash
# change these lines to the values you were provided
export AWS_SECRET_KEY=<secret key here>
export AWS_ACCESS_KEY=<access key here>
```


Starting the VM
===============

```bash
cd lsdacluster_vagrant
vagrant up
```

It may take a few minutes for vagrant up to finish; a lot needs to be downloaded, especially the first time you run vagrant up.


Starting the Notebook Server
============================

After you have started the VM,

```bash
vagrant ssh
sudo supervisorctl start notebook
```

Now point your browser to localhost:8888 to get to the ipython notebook web interface. 

The VM and your host machine will share and synchronize the contents of the lsdacluster_vagrant directory.  So, lsdacluster_vagrant on the host is the same as /vagrant on the VM.

Working on files in the synced directory allows you to work in your text editor of choice on your local machine and then run your programs in the lsdacluster VM, freeing you from configuration problems.

Notebooks will be saved to lsdacluster_vagrant/lsdacluster on the host which syncs to /vagrant/lsdacluster on the VM.

Suspending & terminating VM
===========================

```bash
# to suspend - can be restarted later (vagrant up)
vagrant suspend
# to terminate/destroy - warning, everything not in the synced directory will be lost
vagrant destroy
```
