# Defined in /var/folders/8n/4fbjz7dj23jc3g_9y274kk6h0000gn/T//fish.VBCI41/node.fish @ line 2
function node
    function __node_get_engine

        set -l dir (pwd)

        while [ ! -z "$dir" ]

            if [ -f "$dir/package.json" ];
                echo (jq -r '.engines.node?' < "$dir/package.json")
                return;
            end

            set -l dir (dirname $dir)

            if [ "/" = "$dir" ]
                return;
            end
        end
    end

    function __node_resolve_version
        set -l node_version $argv[1]
        set -l cache "$HOME/.node_semver/"(echo "$node_version" | base64)

        mkdir -p (dirname "$cache")
        if find (dirname "$cache") -name (basename "$cache") -mtime +1 -print | grep -q (basename "$cache");
            cat "$cache"
            return;
        end;

        curl -s "https://semver.io/node/resolve/$node_version" | tee "$cache"

    end

    set -l node_engine (__node_get_engine)
    if [ -n "$node_engine" ];
        set -l node_version (__node_resolve_version "$node_engine")

        if [ "v$node_version" != (command node --version) ];
            echo "Switching to node v$node_version" >&2
            n $node_version
        end
    end

    command node $argv
end
