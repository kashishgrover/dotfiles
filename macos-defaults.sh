#!/bin/bash

# macOS defaults script
# Run: chmod +x macos-defaults.sh && ./macos-defaults.sh

echo "Applying macOS defaults..."

# Finder: Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true

# Dock: Remove auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Dock: Auto-hide dock
# defaults write com.apple.dock autohide -bool true

# Dock: Minimize windows into app icon
# defaults write com.apple.dock minimize-to-application -bool true

# Keyboard: Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Keyboard: Faster key repeat
# defaults write NSGlobalDomain KeyRepeat -int 2
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Screenshots: Save to ~/Screenshots as JPG
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
defaults write com.apple.screencapture type -string "jpg"

# Disable .DS_Store on network/USB drives
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Restart affected apps
killall Finder
killall Dock

echo "Done. Some changes may require a logout to take effect."
