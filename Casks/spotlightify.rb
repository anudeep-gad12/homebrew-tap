cask "spotlightify" do
  version "0.5.0"
  sha256 "12b6f06fd7b7c6b129ab697206ad2eaf5dcc715c5c5cefd7dfe6c868c6415d03"

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
