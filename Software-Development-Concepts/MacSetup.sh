echo SCRIPT: Installing pip
sudo easy_install pip

# Download: https://gist.github.com/qrush/1595572/raw/6c453ddc959b93895ffbf4fd904e2ba60256c904/Menlo-Powerline.otf


# Run powerline for font installation: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
pip install powerline-status

echo SCRIPT: Getting fonts
mkdir Code
cd Code
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

echo SCRIPT: Installing Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo SCRIPT: Starting HomeBrew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo SCRIPT: Downloading Node and npm
export PATH="/usr/local/bin:$PATH"  # temporarily adds path var
brew install node
npm install -g grunt-cli   # grunt install, and test
