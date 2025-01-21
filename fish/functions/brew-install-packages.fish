function brew-install-packages 
  type brew >/dev/null 2>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew install (cut -f1 -d" " ~/.dotfiles/brew/packages)
end
