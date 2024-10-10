function mutagen-status
  set -l session_name $argv[1]

  if [ -z "$session_name" ];
    return 0;
  end

  set mutagen_output (mutagen sync list -- "$session_name" 2>&1)

  if string match -q -- "*unable to locate requested sessions*" "$mutagen_output"; 
    echo "No session named $session_name found" >&2
    return;
  end

  if string match -q -- "*Status: Watching for changes*" "$mutagen_output";
    echo "Waiting for changes" >&2
    echo " ✅"
    return;
  end

  if string match -q -- "*Status: [Paused]*" "$mutagen_output";
    echo "Paused" >&2
    echo " ⏸️"
    return;
  end

  if string match -q -- "*Last error*" "$mutagen_output";
    printf "%s\n" "$mstatus" | grep "Status" >&2
    printf "%s\n" "$mstatus" | grep "Last error" >&2;
    echo " ☠️"
    return;
  end;
  
  printf "%s\n" "$mstatus" | grep "Status" >&2
  echo " 💥"
end
