function trace-start
  set socket (mktemp)
  rm "$socket"

  set --export --universal TRACE_CONNECT "$socket"

  echo -e "Tracing over socket started: \e[32m$socket\e[0m"

  nc -lkU "$socket" &
  trap 'set --erase TRACE_CONNECT; kill %1' EXIT INT
  wait
end
