cask "notchterm" do
  version "0.5.0"
  sha256 "8b65d9569a931597f9dec5eeccbf3885ddd4fae8779c63df09982596a96c8dde"

  url "https://github.com/massan71/NotchTerm/releases/download/v#{version}/NotchTerm-#{version}.zip"
  name "NotchTerm"
  desc "Quake-style drop-down terminal that slides out of the notch"
  homepage "https://github.com/massan71/NotchTerm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NotchTerm.app"

  uninstall quit: "net.sangalli.notchterm"

  zap trash: [
    "~/.config/notchterm",
    "~/Library/Application Support/NotchTerm",
  ]

  caveats <<~EOS
    NotchTerm non è notarizzato da Apple: al primo avvio macOS lo blocca.
    Sbloccalo da Impostazioni di Sistema → Privacy e sicurezza → "Apri comunque", oppure:
      xattr -dr com.apple.quarantine #{appdir}/NotchTerm.app
  EOS
end
