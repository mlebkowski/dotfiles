function docker
	switch $argv[1]
	case "inspect-all"
		command docker ps -aq | xargs docker inspect
	case "find-volume"
		if [ (count $argv) -lt 2 ];
			echo "Usage: docker find-volume volume-id [ volume-id... ] " >&2
			return 1
		end
		
		docker-find-volume $argv[2..(count $argv)]
	case '*'
		command docker $argv
	end
end
