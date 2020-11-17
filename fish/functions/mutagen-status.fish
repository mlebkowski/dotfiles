# Defined in /var/folders/8n/4fbjz7dj23jc3g_9y274kk6h0000gn/T//fish.2vq3Rk/mutagen-status.fish @ line 2
function mutagen-status
	set directory $argv[1]

    set tmp (mktemp -d -t (echo $directory | md5))
    set current (pwd)
    set code 0

    cd $tmp

    mutagen list | split -p '----------'
    
    set status_file (grep -l "URL: $directory" "$tmp"/x?? | head -1)

    if [ -f "$status_file" ]; and not grep -q "Status: Watching for changes" < "$status_file";
        grep "Status" < "$status_file" >&2
        if grep "Last error" < "$status_file" >&2; 
            set code 2
        else 
            set code 1
        end
    end

    rm "$tmp"/x??
    rmdir "$tmp"
    cd "$current"

    return $code
end
