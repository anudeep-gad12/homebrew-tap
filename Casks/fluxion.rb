cask "fluxion" do
  version "0.1.2"
  sha256 "c7dc99c4d9ad84186293bcd985fcf9e1eb018b94571421caa85ef5cece3aae23"

  url "https://github.com/anudeep-gad12/Fluxion/releases/download/v#{version}/Fluxion-macos-arm64.zip"
  name "Fluxion"
  desc "Local coding agent for the models you choose"
  homepage "https://github.com/anudeep-gad12/Fluxion"

  depends_on macos: :ventura

  app "Fluxion.app"

  preflight do
    system_command "/bin/rm",
                   args: ["-rf", "#{appdir}/Fluxion.app"]
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Fluxion.app"],
                   must_succeed: false
  end
end
