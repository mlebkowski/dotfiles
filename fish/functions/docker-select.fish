function docker-select
	set -l options -a

	if [ "--no-trunc" = "$argv[1]" ]; 
		set options $options --no-trunc
		set argv $argv[2..(count $argv)]
	end

	docker ps $options | select | xargs -r docker $argv
end
