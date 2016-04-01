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
