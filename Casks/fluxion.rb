cask "fluxion" do
  version "0.16.0"
  sha256 "125033e25490c83e8d1ba82bbee59c918683ba0e7e609e272049e13416f6a21b"

  url "https://github.com/anudeep-gad12/fluxion-releases/releases/download/v#{version}/Fluxion-macos-arm64.zip"
  name "Fluxion"
  desc "Local coding agent for the models you choose"
  homepage "https://github.com/anudeep-gad12/fluxion-releases"

  depends_on macos: :ventura

  app "Fluxion.app"
  binary "#{appdir}/Fluxion.app/Contents/MacOS/fluxion-cli", target: "fluxion"

  preflight do
    system_command "/bin/launchctl",
                   args:         ["bootout", "gui/#{Process.uid}/io.fluxion.local"],
                   must_succeed: false
    system_command "/bin/rm",
                   args: ["-f", "#{Dir.home}/Library/LaunchAgents/io.fluxion.local.plist"]
    system_command "/bin/rm",
                   args: ["-rf", "#{appdir}/Fluxion.app"]
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Fluxion.app"],
                   must_succeed: false
  end
end
