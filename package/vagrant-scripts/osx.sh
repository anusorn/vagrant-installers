#!/bin/bash

export PATH="/usr/local/bin:$PATH"

sudo pip3 install dmgbuild
curl -Lo gon.zip https://github.com/mitchellh/gon/releases/download/v0.2.2/gon_0.2.2_macos.zip
unzip gon.zip
chown root:wheel gon
chmod 755 gon
mv gon /System/Volumes/Data/usr/local/bin/gon

su vagrant -l -c 'brew install bash'

# Move the SDK into the developer section
sdk="/Users/vagrant/SDKs/MacOSX10.9.sdk"
if [ -d "${sdk}" ]; then
    mv "${sdk}" /Library/Developer/CommandLineTools/SDKs/
fi

chmod 755 /vagrant/package/package.sh

set -e

/vagrant/package/package.sh /vagrant/substrate-assets/substrate_darwin_x86_64.zip main

pkg_dir=${VAGRANT_PACKAGE_OUTPUT_DIR:-"pkg"}
mkdir -p /vagrant/${pkg_dir}
cp *.dmg /vagrant/${pkg_dir}
