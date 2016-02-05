function cleanup_docker
	
	docker ps -q -a -f status=exited -f status=dead | xargs -r docker rm -v 

	if [ "--force" != "$argv[1]" ]; 
		return;
	end;

	docker images --no-trunc| grep none | awk '{ print $3 }' | xargs -r docker rmi

	find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d \
		| grep -vFf (docker ps -aq | xargs docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)' | psub)
end
