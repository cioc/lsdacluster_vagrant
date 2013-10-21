Lsdacluster environment via vagrant (vagrantup.com).

Installation
============

Prereqs
* Install git http://git-scm.com/book/en/Getting-Started-Installing-Git
* Install Virtual Box https://www.virtualbox.org/wiki/Downloads
* Install Vagrant http://downloads.vagrantup.com/tags/v1.3.5

And now clone lsdacluster_vagrant

```shell
git clone https://github.com/cioc/lsdacluster_vagrant.git
```

Starting the VM
===============

```shell
cd lsdacluster_vagrant
vagrant up
```

It may take a few minutes for vagrant up to finish; a lot needs to be downloaded, especially the first time you run vagrant up.


Starting the Notebook Server
============================

After you have started the VM,

```shell
vagrant ssh
ipython notebook --ip='*'
```

