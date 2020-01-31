#!/bin/bash

# install home brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew packages
brew update
brew install starship
brew install zsh 
brew install tree
