function dockermon
	docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock icecrime/docker-mon
end
