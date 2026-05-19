cask "fluxion" do
  version "0.1.1"
  sha256 "06c77dd7d81800c2c67ac3999b01c3dcf013c5a62d5e9e2420b64cd155c2c255"

  url "https://github.com/anudeep-gad12/Fluxion/releases/download/v#{version}/Fluxion-macos-arm64.zip"
  name "Fluxion"
  desc "Local coding agent for the models you choose"
  homepage "https://github.com/anudeep-gad12/Fluxion"

  depends_on macos: ">= :ventura"

  app "Fluxion.app"
end
