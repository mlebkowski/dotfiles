function git-branch-remove-interactive
  git branch --list | grep -v 'main$' | gum choose --no-limit | xargs git branch -D
end
