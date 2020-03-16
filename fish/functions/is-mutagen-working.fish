# Defined in /var/folders/8n/4fbjz7dj23jc3g_9y274kk6h0000gn/T//fish.YW3msR/is-mutagen-working.fish @ line 2
function is-mutagen-working
	set directory (pwd)

    while [ $directory != "/" ]; 
        if [ -f "$directory/docker-compose.yml" ];
            break;
        end

        set directory (dirname "$directory")
    end

    if [ $directory = "/" ];
        return 0
    end

	set sessionId (mutagen sync list | grep "URL: $directory" -B 6 | grep "Identifier" | cut -d" " -f2)

    if [ -z "$sessionId" ];
        return 0
    end

    set state (mutagen sync list $sessionId | grep -c "Connection state: Connected")

    [ "$state" -eq 2 ];
end
