function mutagen-resume
  set -l name $argv[1]
  if [ -z "$name" ];
    set name (mutagen-session-name)
  end
  mutagen sync resume "$name"
end
