function mutagen-pause
  set -l name $argv[1]
  if [ -z "$name" ];
    set name (mutagen-session-name)
  end
  mutagen sync pause "$name"
end
