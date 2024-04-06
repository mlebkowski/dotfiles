#!/usr/bin/env bash

#        command -v brew >&- && brew install $(cat brew/packages) || echo "Skipping brew install because there is no brew present"
#        pip3 install $(cat requirements.txt)

link_folder() {
	declare source="$1" target="$2"

	mkdir -p "$target"
	for file in "$source"/*; do
		ln -fs $(pwd)/"$file" "$target/${file#$source/}"
	done
}

main () {
	link_folder bin ~/bin

	ln -fs $(pwd)/misc/nanorc ~/.nanorc
	ln -fs $(pwd)/misc/screenrc ~/.screenrc

	ln -fs $(pwd)/misc/mutagen.yml ~/.mutagen.yml

	ln -fs $(pwd)/git/gitignore ~/.gitignore
	ln -fs $(pwd)/git/gitconfig ~/.gitconfig

	mkdir -p ~/.ssh
	ln -fs $(pwd)/ssh/config ~/.ssh/config
	ln -fs $(pwd)/ssh/authorized_keys ~/.ssh/authorized_keys

	link_folder fish ~/.config/fish

	git remote set-url origin git@github.com:mlebkowski/dotfiles.git
}

main "$@"

