{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice-qt-fresh
    hyphenDicts.de_DE
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
  ];
}
