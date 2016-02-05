function select
	set -l column 1

	if [ (count $argv) -gt 0 ]; 
		set column $argv[1]
	end

	percol | awk '{ print $'$column' }'
end
