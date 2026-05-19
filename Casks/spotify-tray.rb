cask "spotify-tray" do
  version "0.1.7"
  sha256 "0c1fb63b0d4f262837146e8bf6a5e33ad42e590fca6ebe3ff20d5c8ce203230a"

  url "https://github.com/anudeep-gad12/spotify-tray/releases/download/v#{version}/SpotifyTray.app.zip"
  name "SpotifyTray"
  desc "Tiny macOS menu bar app for Spotify search, playback, and queueing"
  homepage "https://github.com/anudeep-gad12/spotify-tray"

  depends_on macos: ">= :sonoma"

  app "SpotifyTray.app"
end
