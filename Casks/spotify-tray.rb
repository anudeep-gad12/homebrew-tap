cask "spotify-tray" do
  version "0.2.1"
  sha256 "7f634c7717d892897539829789e680bc26bea55da7fc251fc09fc316a5da4b86"

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
