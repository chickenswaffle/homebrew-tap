cask "vibe-check" do
  version "0.1.0"
  sha256 "23d2980143f0cf63098cf4202a4cf05510fba7b7d5ecf259096d9439f6d9324b"

  url "https://github.com/chickenswaffle/vibe-check/releases/download/v#{version}/Vibe-Check-#{version}-x86_64.dmg",
      verified: "github.com/chickenswaffle/vibe-check/"
  name "Vibe Check"
  desc "Pre-launch security audit for vibe-coded apps"
  homepage "https://chickenswaffle.github.io/vibe-check/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Vibe Check.app"

  caveats <<~EOS
    Vibe Check isn't notarized yet, so macOS Gatekeeper blocks the first launch.
    Clear it once with:
      xattr -dr com.apple.quarantine "/Applications/Vibe Check.app"
    then open it normally (or right-click the app in Applications and choose Open).

    It's a terminal app: it opens Terminal, audits a bundled vulnerable sandbox so you
    can see it work, and prints the command to scan a target of your own.
  EOS
end
