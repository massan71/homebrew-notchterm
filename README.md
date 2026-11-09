# homebrew-notchterm

Tap Homebrew per [NotchTerm](https://github.com/massan71/NotchTerm), il terminale a tendina che esce dal notch.

```bash
brew install --cask massan71/notchterm/notchterm
```

NotchTerm non è notarizzato: al primo avvio sbloccalo da Impostazioni di Sistema → Privacy e sicurezza →
"Apri comunque", oppure con `xattr -dr com.apple.quarantine /Applications/NotchTerm.app`.

Aggiornare: `brew upgrade --cask notchterm` · Disinstallare: `brew uninstall --cask notchterm`
(`--zap` rimuove anche configurazione e integrazione shell).

Il cask viene aggiornato automaticamente dalla CI di NotchTerm a ogni nuova release.
