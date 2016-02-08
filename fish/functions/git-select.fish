function git-select
	set -l xargs_flags (if xargs --help 2>&1 | grep -q -- "--no-run-if-empty"; echo "--no-run-if-empty"; else; echo "-t"; end);
	git reflog | select | xargs $xargs_flags git $argv
end
