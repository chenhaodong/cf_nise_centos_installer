#!/bin/bash -ex

if [ ! -d ~/.rbenv ]; then
    yum groupinstall -y "Development Tools"
    yum install -y readline-devel openssl-devel zlib-devel git    
#    sudo apt-get -y install build-essential libreadline-dev libssl-dev zlib1g-dev git-core
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'eval "$(rbenv init -)"' >> ~/.profile
fi
export PATH=~/.rbenv/bin:$PATH
source ~/.profile
if ! (rbenv versions | grep -q 1.9.3-p484); then
    rbenv install 1.9.3-p484
fi
rbenv local 1.9.3-p484

gem install bundler --no-rdoc --no-ri
rbenv rehash
