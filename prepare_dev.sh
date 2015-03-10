cd ~
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default

sudo apt-get update

sudo apt-get install -y subversion
sudo apt-get install -y p7zip-full iftop supervisor

# python related
sudo apt-get install -y python-dev python-pip libxslt1-dev libxml2-dev python-couchdb lib32z1-dev libffi-dev libssl-dev python-openssl
sudo pip install virtualenv virtualenvwrapper
echo "" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source /usr/local/bin/virtualenvwrapper.sh

# MS fonts, so that web pages are displayed properly
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install -y ttf-mscorefonts-installer

# likewise-open
wget http://de.archive.ubuntu.com/ubuntu/pool/main/l/likewise-open/likewise-open_6.1.0.406-0ubuntu10_amd64.deb
wget http://de.archive.ubuntu.com/ubuntu/pool/main/libg/libglade2/libglade2-0_2.6.4-1ubuntu3_amd64.deb
wget http://de.archive.ubuntu.com/ubuntu/pool/universe/l/likewise-open/likewise-open-gui_6.1.0.406-0ubuntu10_amd64.deb
sudo dpkg -i likewise-open_6.1.0.406-0ubuntu10_amd64.deb
sudo dpkg -i libglade2-0_2.6.4-1ubuntu3_amd64.deb
sudo dpkg -i likewise-open-gui_6.1.0.406-0ubuntu10_amd64.deb
sudo domainjoin-gui

# optional
echo "RefreshUserCredentials false" > /tmp/lw1.txt
sudo /usr/bin/lwconfig --file /tmp/lw1.txt
rm /tmp/lw1.txt
