#!/usr/bin/env bash

main() {
  sudo cp org.localhost.alias.plist /Library/LaunchDaemons/org.localhost.alias.plist
  sudo launchctl load /Library/LaunchDaemons/org.localhost.alias.plist
}

main "$@"
