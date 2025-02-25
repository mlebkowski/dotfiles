function fish-toggle-narrow-prompt
  if set -q __fish_prompt_narrow
    set --erase __fish_prompt_narrow
  else
    : | set --global __fish_prompt_narrow "\n"
  end
end
