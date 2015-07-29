cd ~
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

sudo apt-get install -y nautilus-open-terminal
sudo apt-get install -y nautilus-actions

sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default

echo "" >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre"' >> ~/.bashrc
echo 'export PATH="$PATH:$JAVA_HOME:$JAVA_HOME/bin"' >> ~/.bashrc

sudo apt-get install -y subversion git vim
sudo apt-get install -y p7zip-full iftop

# python related
sudo apt-get install -y python-dev python-pip libxslt1-dev libxml2-dev python-couchdb lib32z1-dev libffi-dev libssl-dev python-openssl supervisor
sudo pip install virtualenv virtualenvwrapper
echo "" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source /usr/local/bin/virtualenvwrapper.sh

# MS fonts, so that web pages are displayed properly
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install -y ttf-mscorefonts-installer

# mount to our NAS
sudo apt-get install -y cifs-utils
sudo mkdir -p /mnt/lspub

# get our own copy of likewise-open binaries
sudo mount.cifs -o user=aviel //nas1/public /mnt/lspub
cp /mnt/lspub/Apps/Ubuntu/*.deb .

# install likewise-open
sudo dpkg -i likewise-open_6.1.0.406-0ubuntu10_amd64.deb
sudo dpkg -i libglade2-0_2.6.4-1ubuntu3_amd64.deb
sudo dpkg -i likewise-open-gui_6.1.0.406-0ubuntu10_amd64.deb
sudo domainjoin-gui

# more login stuff
sudo echo "" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
sudo echo "allow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
sudo echo "greeter-show-manual-login=true" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

# optional
echo "RefreshUserCredentials false" > /tmp/lw1.txt
sudo /usr/bin/lwconfig --file /tmp/lw1.txt
rm /tmp/lw1.txt

