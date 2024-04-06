function brew-install-packages 
  type brew >/dev/null 2>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew install (cat ~/.dotfiles/brew/packages)
end
