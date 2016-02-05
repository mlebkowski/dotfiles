set PATH /usr/local/php5/bin /opt/local/bin /opt/local/sbin ~/bin ~/.composer/vendor/bin ~/.dotfiles/node_modules/.bin ~/.gem/ruby/2.0.0/bin $PATH
set EDITOR nano

if test -d /Volumes/Dev;
	set CDPATH . /Volumes/Dev
end


. ~/.config/fish/autoenv.fish
_autoenvfish # check for starting directory

for name in conf.d/*.fish;
	. $name
end
