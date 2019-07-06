#!/bin/sh

# home-brew
if test ! $(which brew); then
    echo "Installing homebrew..."
    yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap caskroom/cask
brew tap caskroom/versions

# clone setup files
rm -rf ~/mac-setup-files
git clone https://github.com/oliver-wilson-dev/settings.git ~/mac-setup-files

# Git
brew install git
echo "Define your Git username"
read username
git config --global user.name "$username"
echo "Define your Git email"
read email
git config --global user.name "$email"

# git config --global user.name oliver-wilson-dev
# git config --global user.email contact.oliver.wilson@gmail.com


# zsh
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
# copy zsh settings over
	yes | cp ~/mac-setup-files/.zshrc ~/.zshrc


# Install yarn
brew install yarn
yarn global add jest
yarn global add eslint


# NodeJS / NPM
brew install node


# Visual Studio Code
brew cask install visual-studio-code
# install extensions
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
# copy settings over
	yes | cp ~/mac-setup-files/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json


# Install Programs
# VirtualBox
	brew cask install virtualbox

# Browsers
	brew cask install google-chrome
	brew cask install firefox
# Other	
	brew cask install charles
	brew cask install copyq
	brew cask install docker
	brew cask install github
	brew cask install insomnia
	brew cask install iterm2
	brew cask install postman
	brew cask install slack 
	brew cask install spotify
	brew cask install whatsapp
	brew cask install zeplin

# Mac settings
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
yes | cp -a ~/mac-setup-files/DankMono/otf/. ~/Library/Fonts

# Make asos directory and clone repos into it
read -p "Would you like to download some of the asos repos?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	mkdir ~/asos
	cd ~/asos
	mkdir ./sitechrome
	mkdir ./saved-lists
	echo "Enter your git username"
	read username
	echo "Enter your git password (note, if you are trying to clone a repo that requires an access token, enter that instead.)"
	read password
	git clone https://$username:$password@github.com/asosteam/asos-web-my-account.git my-account
	git clone https://$username:$password@github.com/asosteam/asos-web-bag.git bag
	git clone https://$username:$password@github.com/asosteam/asos-web-checkout.git checkout
	git clone https://$username:$password@github.com/asosteam/asos-web-product-listing-page.git plp
	git clone https://$username:$password@github.com/asosteam/asos-web-productpage.git pdp
	git clone https://$username:$password@github.com/asosteam/asos-web-saved-lists.git ./saved-lists/application
	git clone https://$username:$password@github.com/asosteam/asos-web-saved-lists-stubs.git ./saved-lists/stubs
	git clone https://$username:$password@github.com/asosteam/asos-web-site-chrome-client-node.git ./sitechrome/client
	git clone https://$username:$password@github.com/asosteam/asos-web-site-chrome-publisher.git ./sitechrome/publisher
fi
