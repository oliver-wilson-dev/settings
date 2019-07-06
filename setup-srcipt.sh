#!/bin/sh

# Allow locate commands
# sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist


# home-brew
if test ! $(which brew); then
    echo "Installing homebrew..."
    yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# will ask to install the command line tools for macOS if the previous step was not executed
brew tap caskroom/cask
brew tap caskroom/versions

# Git
brew install git
echo "Define your Git username"
# read username
# git config --global user.name "$username"
git config --global user.name oliver-wilson-dev
echo "Define your Git email"
# read email
git config --global user.email contact.oliver.wilson@gmail.com


# install zsh
brew install zsh
brew install zsh-completions
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
# install powerlevel9k theme
if git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k; then :
else
	cd ~/.oh-my-zsh/custom/themes/powerlevel9k && git pull
fi

# install zsh plugins
if git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions; then :
else
	cd ~/.oh-my-zsh/plugins/zsh-autosuggestions && git pull
fi

if git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; then :
else
	cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
fi

# Browsers
brew cask install google-chrome
brew cask install firefox

# Install yarn
brew install yarn


# NodeJS / NPM
brew install node


# Visual Studio Code
brew cask install visual-studio-code
code --install-extension andrew-codes.cypress-snippets
code --install-extension bierner.markdown-preview-github-styles
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamidui.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension formukahendry.auto-close-tag
code --install-extension GitHub.vscode-pull-request-github
code --install-extension ngryman.codesandbox-theme
code --install-extension Orta.vscode-jest
code --install-extension PKief.material-icon-theme
code --install-extension shinnn.stylelint
code --install-extension shyykoserhiy.vscode-spotify
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension Tyriar.sort-lines
code --install-extension xabikos.JavaScriptSnippets


# VirtualBox
brew cask install virtualbox


# Extras
brew cask install charles
brew cask install docker
brew cask install github
brew cask install insomnia
brew cask install iterm2
brew cask install postman
brew cask install slack 
brew cask install spark
brew cask install spotify
brew cask install whatsapp
brew cask install zeplin

# Make asos directory and clone repos into it
mkdir ~/Git
# git clone ...

# clone
rm -rf ~/mac-setup-files
git clone https://github.com/oliver-wilson-dev/settings.git ~/mac-setup-files
# copy zsh settings over
cd ~/mac-setup-files
yes | cp .zshrc ~/.zshrc
yes | cp vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
yes | cp -a DankMono-491/otf/. ~/Library/Fonts

# Mac settings
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
