# apt stuff + ngnix
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update

# ruby-build dependencies
sudo apt-get install g++
sudo apt-get remove make
sudo apt-get install make
sudo apt-get install gcc
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
sudo apt-get install libpq-dev
apt-get install libsqlite3-dev

sudo apt-get install nginx

# rbenv / ruby
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.zshrc
rbenv install 2.2.3
rbenv global 2.2.3
gem install bundler
gem install unf_ext -v '0.0.7.2'
gem install pg -v '0.17.1'
gem install sqlite3 -v '1.3.10'

# heroku
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
