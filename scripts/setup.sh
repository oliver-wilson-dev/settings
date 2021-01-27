#!/bin/sh

# check if something is already installed
install_if_does_not_exist()
{
	if command -v "$1" >/dev/null 2>&1; then
  		echo $1 'is already installed'
	else
		echo "installing" $1
		brew install $1
	fi
}

# Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap homebrew/cask-cask
brew tap homebrew/cask-versions

# Install Git and set username and email
install_if_does_not_exist git
GIT_USERNAME="$(git config --global --get user.name)"
GIT_EMAIL="$(git config --global --get user.email)"

read -t 60 -p "Your git user.name is "${GIT_USERNAME}". Would you like to change it? [y/n]" -n 1 -r SET_GIT_USERNAME_REPLY
echo
if [[ $SET_GIT_USERNAME_REPLY =~ ^[Yy]$ ]]
then
	echo "Define your Git username"
	read username
	git config --global user.name "$username"
	GIT_USERNAME="$(git config --global --get user.name)"
fi

read -t 60 -p "Your git user.email is "${GIT_EMAIL}". Would you like to change it? [y/n]" -n 1 -r SET_GIT_EMAIL_REPLY
echo
if [[ $SET_GIT_EMAIL_REPLY =~ ^[Yy]$ ]]
then
	echo "Define your Git email"
	read email
	git config --global user.email "$email"
	GIT_EMAIL="$(git config --global --get user.email)"
fi

echo "Thanks. Your git user.name is '${GIT_USERNAME}' and your git user.email is '${GIT_EMAIL}'".

# Clone setup files
rm -rf ~/mac-setup-files
git clone https://github.com/asos-oliverwilson/setup-mac.git ~/mac-setup-files

# Set default git editor to be vscode
git config --global core.editor "code --wait"

# Set default upstream branch to avoid --set-upstream message on first push
git config --global push.default current


# Install yarn
install_if_does_not_exist yarn


# NodeJS / NPM
install_if_does_not_exist node
npm list -g jest && echo "jest is installed globally" || echo "installing jest globally" && npm install -g jest
npm list -g eslint && echo "eslint is installed globally" || echo "installing eslint globally" && npm install -g eslint


# nvm (node version manager)
chown -R $(whoami) /usr/local/lib/pkgconfig
chmod u+w /usr/local/lib/pkgconfig
mkdir ~/.nvm
install_if_does_not_exist nvm


# Visual Studio Code
brew install --cask visual-studio-code
# install extensions
	code --install-extension andrew-codes.cypress-snippets
	code --install-extension bierner.markdown-preview-github-styles
	code --install-extension christian-kohler.npm-intellisense
	code --install-extension christian-kohler.path-intellisense
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension eamodio.gitlens
	code --install-extension esbenp.prettier-vscode
	code --install-extension formulahendry.auto-close-tag
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

# Browsers
	BROWSERS=(
		google-chrome
		firefox
	)
	brew install --cask ${BROWSERS[@]}

# Other programs
	OTHER_PROGRAMS=(
		alfred
		charles
		copyq
		docker
		github
		google-hangouts
		insomnia
		iterm2
		notion
		postman
		slack 
		spotify
		whatsapp
		zeplin
	)

	brew install --cask ${OTHER_PROGRAMS[@]}


# Mac settings
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool false
defaults write com.apple.screencapture location ~/Desktop/screenshots
killall SystemUIServer
yes | cp -a ~/mac-setup-files/fonts/DankMono/otf/. ~/Library/Fonts

# Make asos directory and clone repos into it
read -t 60 -p "Would you like to download some of the asos repos? [y/n]" -n 1 -r CLONE_ASOS_REPOS_REPLY
echo
if [[ $CLONE_ASOS_REPOS_REPLY =~ ^[Yy]$ ]]
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

# zsh
install_if_does_not_exist zsh
install_if_does_not_exist zsh-completions
# install oh-my-zsh
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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
# copy zsh settings over
	yes | cp ~/mac-setup-files/zsh/.zshrc ~/.zshrc

chsh -s "$(command -v zsh)" "${USER}"
