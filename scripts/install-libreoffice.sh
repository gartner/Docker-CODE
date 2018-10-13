#!/bin/sh

# Update installed packages
apt-get update && apt-get -y upgrade

# Install HTTPS transport
apt-get -y install apt-transport-https

# Install locales
apt-get -y install locales-all

# Add Collabora repos
echo "deb https://collaboraoffice.com/repos/CollaboraOnline/CODE /" > /etc/apt/sources.list.d/collabora.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CCEA47B2281732DF5D504D00C54D189F4BA284D
apt-get update

# Install the Collabora packages
apt-get -y install loolwsd code-brand collaboraoffice5.3-dict* collaboraofficebasis5.3*

#install fonts
apt-get -y install ttf-dejavu-core ttf-dejavu-extra \
    ttf-sjfonts ttf-staypuft ttf-summersby ttf-root-installer

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt-get install ttf-mscorefonts-installer

cp /usr/share/root/fonts/* /opt/collaboraoffice5.3/share/fonts/truetype/

# Cleanup
rm -rf /var/lib/apt/lists/*
