# Defined in /var/folders/8n/4fbjz7dj23jc3g_9y274kk6h0000gn/T//fish.OBb4jd/is-mutagen-working.fish @ line 2
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

    mutagen-status "$directory" 2>/dev/null
end
