set PATH ~/.n/bin /opt/homebrew/bin ~/bin ~/.composer/vendor/bin ~/.dotfiles/node_modules/.bin ~/.local/bin $PATH
set EDITOR nano

if test -d /Volumes/Dev;
	set CDPATH . /Volumes/Dev
end


. ~/.config/fish/autoenv.fish
_autoenvfish # check for starting directory

for name in conf.d/*.fish;
	. $name
end

# set -e LC_ALL
export LC_ALL=en_US.UTF-8

export N_PREFIX=$HOME/.n

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

test -e {$HOME}/.config/op/plugins.sh ; and source {$HOME}/.config/op/plugins.sh
