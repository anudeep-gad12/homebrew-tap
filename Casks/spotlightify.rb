cask "spotlightify" do
  version "0.2.0"
  sha256 "b391a617417f1552fc067b81e340628c508ed318abfa8472b905398a817acca2"

  url "https://github.com/anudeep-gad12/spotlightify/releases/download/v#{version}/Spotlightify.app.zip"
  name "Spotlightify"
  desc "Tiny macOS menu bar app for Spotify search, playback, and queueing"
  homepage "https://github.com/anudeep-gad12/spotlightify"

  depends_on macos: ">= :sonoma"

  preflight do
    system_command "/bin/rm",
                   args: [
                     "-rf",
                     "#{appdir}/Spotlightify.app",
                     "#{Dir.home}/Applications/Spotlightify.app",
                     "#{appdir}/SpotifyTray.app",
                     "#{Dir.home}/Applications/SpotifyTray.app",
                   ],
                   must_succeed: false
  end

  app "Spotlightify.app"

  uninstall quit: "app.spotlightify"

  zap trash: [
    "~/Library/Application Support/Spotlightify",
    "~/Library/Logs/Spotlightify",
    "~/Library/Preferences/app.spotlightify.plist",
    "~/Library/Application Support/SpotifyTray",
    "~/Library/Logs/SpotifyTray",
    "~/Library/Preferences/app.spotifytray.plist",
  ]
end
