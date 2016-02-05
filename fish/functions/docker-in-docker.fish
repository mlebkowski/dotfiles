function docker-in-docker
	docker run -v /var/run/docker.sock:/var/run/docker.sock $argv
end
