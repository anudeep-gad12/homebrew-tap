cask "spotify-tray" do
  version "0.3.9"
  sha256 "024ea4d1d9c02cec9a2361ec08ce5bc041541209d96b9bd3b9f862ff4ff242cc"

  url "https://github.com/anudeep-gad12/spotify-tray/releases/download/v#{version}/SpotifyTray.app.zip"
  name "SpotifyTray"
  desc "Tiny macOS menu bar app for Spotify search, playback, and queueing"
  homepage "https://github.com/anudeep-gad12/spotify-tray"

  depends_on macos: ">= :sonoma"

  preflight do
    system_command "/bin/rm",
                   args: ["-rf", "#{appdir}/SpotifyTray.app", "#{Dir.home}/Applications/SpotifyTray.app"],
                   must_succeed: false
  end

  app "SpotifyTray.app"

  uninstall quit: "app.spotifytray"

  zap trash: [
    "~/Library/Application Support/SpotifyTray",
    "~/Library/Logs/SpotifyTray",
    "~/Library/Preferences/app.spotifytray.plist",
  ]
end
