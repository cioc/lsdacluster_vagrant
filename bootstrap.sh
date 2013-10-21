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

# stuff for the ipython notebook
pip install jinja2
pip install tornado

# packages for programming
pip install numpy==1.7.0
pip install ipython[all]
