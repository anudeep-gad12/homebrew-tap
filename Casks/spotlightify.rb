cask "spotlightify" do
  version "0.4.1"
  sha256 "fdecb507277443ecd2f8727574b7be7cbe0863753542924178d63bfbc3a6205f"

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
