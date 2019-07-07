# settings
Settings for any mac that I want to use

## Prerequisites
* You will need an asos github account with access to all of the repos in `asosteam`. Contact Dom Green or Tony Gorman if you don't already have access to these repositories in github.

* You will be offered the option to download some of the most popular asos repos, if you wish to do this then you need to [create an access token](https://help.github.com/en/enterprise/2.17/user/articles/creating-a-personal-access-token-for-the-command-line) and use that as your password to install the repos.

* Don't leave your mac as you will be required to enter your password a few times and will be asked to enter/configure git credentials.

## manual steps before installation
* Download [this gist](https://gist.github.com/oliver-wilson-dev/473ff116e6cc56a81e596c3392e65cf8). 

* Open the terminal and go to the directory where you saved [the gist](https://gist.github.com/oliver-wilson-dev/473ff116e6cc56a81e596c3392e65cf8) and run `sh setup.sh`.
  * You might need to extract the file if you've downloaded it as a zip.

## manual steps after installation
You should have some settings files downloaded into the `~/mac-setup-files` directory.

### iTerm2
* Go to `Preferences -> Profiles -> Colors -> Color Presets -> Import...` and select `~/mac-setup-files/iterm2/iterm2-color-preset.itermcolors`. Then select the `iterm2-color-preset` option from the presets.

* Go to `Preferences -> Profiles -> Text -> Font -> Change Font` and select a font that has _for Powerline_ in the name. Change your font size here too if you wish.

* Go to `Preferences -> Profiles -> Keys -> Load Preset...` and select _Natural Text Editing_ - you can now jump around the text using the alt+arrow keys.

### Reboot your mac
* `Press the apple button in the top left of the screen -> Reboot...`
