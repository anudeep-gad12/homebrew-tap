cask "spotlightify" do
  version "0.6.0"
  sha256 "50e0bc2db760bf0b34cc9a9250d4ba7eec719ab5018705d5a13aa02b5080b7d1"

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
