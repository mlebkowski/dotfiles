defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
defaults write -g NSAllowContinuousSpellChecking -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0

defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock    "wvous-bl-corner" -int 3
defaults write com.apple.dock    "wvous-bl-modifier" -int 0
defaults write com.apple.dock    "wvous-br-corner" -int 1
defaults write com.apple.dock    "wvous-br-modifier" -int 1048576
defaults write com.apple.dock    "wvous-tl-corner" -int 2
defaults write com.apple.dock    "wvous-tl-modifier" -int 0
defaults write com.apple.dock    "wvous-tr-corner" -int 4
defaults write com.apple.dock    "wvous-tr-modifier" -int 0
