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
