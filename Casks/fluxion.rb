cask "fluxion" do
  version "0.2.0"
  sha256 "11b5cfb42b7f36e4db1357435a1b5b17f722dcd74f4fee37ef1256602650b161"

  url "https://github.com/anudeep-gad12/Fluxion/releases/download/v#{version}/Fluxion-macos-arm64.zip"
  name "Fluxion"
  desc "Local coding agent for the models you choose"
  homepage "https://github.com/anudeep-gad12/Fluxion"

  depends_on macos: :ventura

  app "Fluxion.app"

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
