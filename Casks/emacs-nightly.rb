cask "emacs-nightly" do
  version :latest
  sha256 :no_check

  url do
    require "open-uri"
    URI("https://emacsformacosx.com/atom/daily").read[/href="([^"]+.dmg)"/, 1]
  end
  name "Emacs"
  desc "GNU Emacs text editor"
  homepage "https://emacsformacosx.com/"

  conflicts_with cask:    [
    "emacs",
    "emacs-pretest",
  ],
                 formula: "emacs"

  app "Emacs.app"
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs", target: "emacs"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin/etags"

  zap trash: [
    "~/Library/Caches/org.gnu.Emacs",
    "~/Library/Preferences/org.gnu.Emacs.plist",
    "~/Library/Saved Application State/org.gnu.Emacs.savedState",
  ]
end
