#!/usr/bin/env bash

apt-get update

# basic stuff
apt-get install -y git-core
apt-get install -y supervisor
apt-get install -y vim

# python setup
apt-get install -y python-dev
apt-get install -y python-pip

# setup 0mq
apt-get install -y g++
pip install pyzmq --install-option="--zmq=bundled"

# prereqs for the ipython notebook
pip install jinja2
pip install tornado

# packages for programming
pip install numpy==1.7.0
pip install ipython[all]

# setup supervisor to start notebook
cp /vagrant/notebook.conf /etc/supervisor/conf.d/notebook.conf
supervisorctl reread
supervisorctl update

# setup folder to store notebooks if it doesn't exist already
if [ ! -d "/vagrant/lsdacluster" ]; then
  mkdir /vagrant/lsdacluster
  chmod 777 /vagrant/lsdacluster
fi
