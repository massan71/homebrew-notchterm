cask "notchterm" do
  version "0.6.1"
  sha256 "b151e9bc0568f377edba334e88737de86924ce60336806856ea2f33f3ff43718"

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
