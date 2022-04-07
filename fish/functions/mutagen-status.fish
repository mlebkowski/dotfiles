# Defined in /var/folders/8n/4fbjz7dj23jc3g_9y274kk6h0000gn/T//fish.DgeZV4/mutagen-status.fish @ line 2
function mutagen-status
  if [ -z "$MUTAGEN_IDENTIFIER" ]; 
    return 0;
  end

  set mstatus (mutagen sync list "$MUTAGEN_IDENTIFIER" 2>/dev/null)
      
  if [ -n "$mstatus" ]; and not printf "%s\n" "$mstatus" | grep -q "Status: Watching for changes";
        printf "%s\n" "$mstatus" | grep "Status" >&2
        if printf "%s\n" "$mstatus" | grep "Last error" >&2; 
            return 2
        else 
            return 1
        end
    end

    return 0
end
