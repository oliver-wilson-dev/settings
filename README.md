# settings
Get my developer setup the way that I like it on a new mac.

Installs `git`, `node`, `yarn`, `npm`, `homebrew`, `Google Chrome`, `firefox`, `virtualbox`, `charles`, `copyq`, `docker`, `github for desktop`, `insomnia`, `iterm2`, `postman`, `slack`, `spotify`, `whatsapp`, `zeplin`.

Sets `zsh` as the default shell for your machine.

Installs `Visual Studio Code` with some useful extensions, the `DankMono` font, and some opinionated settings.

## Prerequisites
* Don't leave your mac as you will be required to enter your password a few times and will be asked to enter/configure git credentials.

## manual steps before installation
* Download [this gist](https://gist.github.com/oliver-wilson-dev/473ff116e6cc56a81e596c3392e65cf8). 

* Open the terminal and go to the directory where you saved [the gist](https://gist.github.com/oliver-wilson-dev/473ff116e6cc56a81e596c3392e65cf8) and run `sh setup.sh`.
  * You might need to extract the file if you've downloaded it as a zip.

## manual steps after installation
Disclaimer: you should have some settings files downloaded into the `~/mac-setup-files` directory.

### iTerm2
* Go to `Preferences -> Profiles -> Colors -> Color Presets -> Import...` and select `~/mac-setup-files/iterm2/iterm2-color-preset.itermcolors`. Then select the `iterm2-color-preset` option from the presets.

* Go to `Preferences -> Profiles -> Text -> Font -> Change Font` and select a font that has _for Powerline_ in the name. Change your font size here too if you wish.

* Go to `Preferences -> Profiles -> Keys -> Load Preset...` and select _Natural Text Editing_ - you can now jump around the text using the alt+arrow keys.

### Reboot your mac
* `Press the apple button in the top left of the screen -> Reboot...`
