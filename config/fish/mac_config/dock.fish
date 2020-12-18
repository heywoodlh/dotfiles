function hide-dock
  defaults write com.apple.dock autohide -bool true && killall Dock
  defaults write com.apple.dock autohide-delay -float 1000 && killall Dock
  defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock
end


function show-dock
  defaults write com.apple.dock autohide -bool false && killall Dock
  defaults delete com.apple.dock autohide-delay && killall Dock
  defaults write com.apple.dock no-bouncing -bool FALSE && killall Dock
end
