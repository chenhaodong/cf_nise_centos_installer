#!/bin/bash -ex

if [ ! -f /etc/centos-release ] || \
   [ `uname -m` != "x86_64" ]; then
    echo "This installer supports only CentOS 64bit server"
    exit 1;
fi

# Git bootstrap
if ! (which git); then
    yum clean all && yum makecache
    yum install -y git
fi

INSTALLER_URL=${INSTALLER_URL:-https://github.com/yudai/cf_nise_installer.git}
INSTALLER_BRANCH=${INSTALLER_BRANCH:-centos}

if [ ! -d cf_nise_installer ]; then
#TODO: push this centos verison to github.
#   git clone ${INSTALLER_URL} cf_nise_installer
   echo "Default assuming installer has been cloned"
fi

NISE_PATH=${NISE_PATH:-/home/work/}
(
    cd ..
    git checkout ${INSTALLER_BRANCH}
    ./scripts/install.sh
)
