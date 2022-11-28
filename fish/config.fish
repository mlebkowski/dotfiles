set PATH /opt/homebrew/bin ~/bin ~/.composer/vendor/bin ~/.dotfiles/node_modules/.bin ~/.gem/ruby/2.0.0/bin $PATH
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

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
