{pkgs, ...}: {
  home.packages = with pkgs; [
    flatpak
    gnome-software
  ];

  services.flatpak = {
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };
    #[ "flathub:app/org.kde.index//stable" "flathub-beta:app/org.kde.kdenlive/x86_64/stable" ]

    packages = ["flathub-beta:app/org.kde.kdenlive/x86_64/stable"];
  };
}
