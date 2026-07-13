cask "spotify-tray" do
  version "0.3.8"
  sha256 "0f335552fb53020635084fb1733743ed17667517aa81358cd7763218bf78404d"

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
