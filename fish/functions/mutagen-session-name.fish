function mutagen-session-name
  if set -q MUTAGEN_IDENTIFIER; 
    echo $MUTAGEN_IDENTIFIER;
    return 0
  end

  if string match -q -- '/Volumes/Dev/*' (pwd);
    pwd | cut -d/ -f4 | tr . '-'
    return 0
  end
end
