function brew-describe-packages 
  brew info --json (cat ~/.dotfiles/brew/packages) \
    | jq -r '.[] | (.name + "\t" + .desc)' \
    | column -t -s \t
end
