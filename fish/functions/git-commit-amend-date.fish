function git-commit-amend-date
   git commit --no-edit --amend --date="$(date -R)"
end
