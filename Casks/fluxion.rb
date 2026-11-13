cask "fluxion" do
  version "0.17.0"
  sha256 "ad7232d2843832c5b95f58ba327dd36391bf99f693ab38671715e0fade3ac168"

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
