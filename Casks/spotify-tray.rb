cask "spotify-tray" do
  version "0.3.10"
  sha256 "ba2340fecbe246f4a4ff687a32970fb6514e4a613c2734cbed9dc8c954f02aa9"

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
