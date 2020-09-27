# Mac Developer Setup
Follow these steps to mitigate the chore of manually installing all of the programs that you need on your development machine.

This process does the following tasks:

* Installs `git`, `node`, `yarn`, `npm`, `homebrew`, `google chrome`, `firefox`, `charles`, `copyq`, `docker`, `github for desktop`, `insomnia`, `iterm2`, `postman`, `slack`, `spotify`, `whatsapp`, `zeplin`.

* Installs `Visual Studio Code` with some useful extensions, the `DankMono` font, and some opinionated settings.

* Installs some packages globally (`jest` and `eslint`)

* Installs all of the browsers that we are required to support.

* Offers to set your git username and email.

* Offers the option to clone some of the most popular ASOS repositories.

* Sets `zsh` as the default shell for your machine.

## Prerequisites

* You will be offered the option to download some useful repos, if you wish to do this then you need to [create an access token](https://help.github.com/en/enterprise/2.17/user/articles/creating-a-personal-access-token-for-the-command-line) and use that as your password to install the repos.

* Don't leave your mac as you will be required to enter your password a few times and will be asked to enter/configure git credentials.

## Running the script
* Open the Terminal app and run:
```console
caffeinate sh -c "$(curl -fsSL https://raw.githubusercontent.com/oliver-wilson-dev/settings/master/scripts/setup.sh)"
```
## Manual steps after installation
Disclaimer: you should have some settings files downloaded into the `~/mac-setup-files` directory.

### iTerm2
* Go to `Preferences -> Profiles -> Colors -> Color Presets -> Import...` and select `~/mac-setup-files/iterm2/iterm2-color-preset.itermcolors`. Then select the `iterm2-color-preset` option from the presets.
<img src="https://raw.githubusercontent.com/asos-oliverwilson/setup-mac/master/gifs/set-iterm2-colour-preset.gif">

* Go to `Preferences -> Profiles -> Text -> Font -> Change Font` and select a font that has _for Powerline_ in the name. Change your font size here too if you wish.

* Go to `Preferences -> Profiles -> Keys -> Load Preset...` and select _Natural Text Editing_ - you can now jump around the text using the alt+arrow keys.

### Restart your mac
* `Press the apple button in the top left of the screen -> Restart...`

<img src="https://raw.githubusercontent.com/asos-oliverwilson/setup-mac/master/gifs/reboot-mac.gif" width="400">

## Some useful links
* [Download virtualbox](https://www.virtualbox.org/wiki/Downloads) - the cask requires manual intervention, which is distracting from the rest of the setup script.
* [Microsoft VM download for virtualbox](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/) - this takes quite a while to download.
* [Forward network traffic from mac to VM](https://medium.com/@urubuz/accessing-localhost-in-mac-from-windows-vm-in-virtualbox-312a3de6fedb)
* [Useful iTerm2 keybindings](https://medium.com/@_simon__says/useful-iterm2-keybindings-d9e4e9b8a3ed)
