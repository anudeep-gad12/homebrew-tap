cask "fluxion" do
  version "0.17.1"
  sha256 "fb97b40a0a485647769687ea64010fdbd507901f78012fa4783d9b893d025b2e"

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
