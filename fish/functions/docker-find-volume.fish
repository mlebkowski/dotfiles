function docker-find-volume
	set -l inspect_json (docker inspect-all)
	for volume in $argv;
		set -l result (echo $inspect_json | jq -r --arg volume $volume '.[] | select(.Mounts | .[] | select(.Name == $volume)) | ("\t* " + ((.Mounts | .[] | select(.Name == $volume)) | .Destination) + " at " + .Name)' )
		set -l color (echo -e "\e[0;36m")

		if [ -z "$result" ];
			set color (echo -e "\e[1;31m")
			set result (echo -e "\t! not mounted")
		end

		echo -n $color
		printf "%s (%s):\n" $volume (sudo du -sh /var/lib/docker/volumes/$volume | cut -f 1 2>/dev/null)
		for line in $result;
			echo $line;
		end

	end

	echo -e -n "\e[0m"
#	set_color $fish_color_normal

end
