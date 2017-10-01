#!/bin/bash

#repos
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-add-repository -y ppa:papirus/papirus
sudo apt-add-repository -y ppa:no1wantdthisname/ppa
sudo apt-add-repository -y ppa:jonathonf/ffmpeg-3


# update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# apps
sudo apt-get -y install \
	python-gpgme i3blocks compton ranger vim \
	htop pianobar tmux firefox git-core curl \
	zlib1g-dev build-essential libssl-dev \
	libreadline-dev libyaml-dev \
	libsqlite3-dev sqlite3 libxml2-dev \
	libxslt1-dev libcurl4-openssl-dev \
	python-software-properties libffi-dev \
	nodejs dropbox git mplayer ffmpeg \
	gnome-terminal google-chrome-stable zsh \
	feh rofi papirus-icon-theme arandr \
	fontconfig-infinality conky pandoc \
	robotfindskitten tree

# sudo bash /etc/fonts/infinality/infctl.sh setstyle

# ruby on rails
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.4.2
rbenv global 2.4.2

gem install bundler
rbenv rehash
gem install jekyll
gem install sass
sudo npm install jade -g -y
rbenv rehash
# stops right before git config steps on gorails.com install guide for 16.04 ubuntu

# fonts
mkdir ~/.fonts

# git clone
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# cleanup
rm -rf ~/Documents
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music

reboot
