cask "spotify-tray" do
  version "0.1.11"
  sha256 "51516df850315d1f73d1d982bb8394ce5bffdbfcf2b757ff244a923292ad347d"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SpotifyTray.app"],
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
