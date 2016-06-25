# apt stuff + ngnix
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update

# ruby-build dependencies
sudo apt-get install g++-4.9
sudo apt-get remove make
sudo apt-get install make
sudo apt-get install gcc
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

sudo apt-get install nginx

# rbenv / ruby
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.zshrc
rbenv install 2.2.3
gem install bundler
