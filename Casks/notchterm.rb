cask "notchterm" do
  version "0.6.0"
  sha256 "5747bec7fe3cf7a3138085c66e3ea581f1568260ea6ac460d6ea2ec0476ac920"

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
