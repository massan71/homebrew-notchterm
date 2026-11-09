cask "notchterm" do
  version "0.4.0"
  sha256 "2829fe4f3cf794a787cfe7c5bc6b5d0de00574c3c397c50254ce450444308204"

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
