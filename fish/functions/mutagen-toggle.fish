function mutagen-toggle
  if mutagen-status (mutagen-session-name) 2>&1 >/dev/null | grep -q "Paused"
    mutagen-resume
  else
    mutagen-pause
  end
end
