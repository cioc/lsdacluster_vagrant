#!/usr/bin/env bash

# fill in these with values provided by the instructor
export AWS_SECRET_KEY=<secret key here>
export AWS_ACCESS_KEY=<access key here>

# update packages
apt-get update

# core stuff
apt-get install -y git-core
apt-get install -y supervisor
apt-get install -y vim
apt-get install -y zip

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

# setup DAL
pip install boto
pip install czipfile
git clone https://github.com/cioc/DAL.git /home/vagrant/DAL
cd  /home/vagrant/DAL
python setup.py install
if [ ! -d "/vagrant/dalcache" ]; then
  mkdir /vagrant/dalcache
  chmod 777 /vagrant/dalcache
fi
rm /vagrant/dalcache/*
cp /vagrant/sou.zip /vagrant/dalcache/sou.zip
cd /vagrant/dalcache
unzip sou.zip
touch /root/.dalconfig
echo '{"checkpoint": {"bucket": ""}, "system": {"local" : false}, "cache": {"AWS_SECRET_KEY": "'$AWS_SECRET_KEY'", "path": "/vagrant/dalcache", "AWS_ACCESS_KEY": "'$AWS_ACCESS_KEY'", "size": "10G"}, "rcv1": {"bucket": "ml-rcv1"}, "crime": {"bucket": "ml-crime"}, "ngrams": {"bucket": "ml-ngrams"}, "wishes": {"bucket": "ml-wishes"}, "sou": {"bucket": "ml-sou"}, "tinyimages": {"meta-bucket": "ml-tinyimages-metadata", "bucket": "ml-tinyimages"}}' > /root/.dalconfig

# end of script
