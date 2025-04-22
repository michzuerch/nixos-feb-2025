{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      papirus-folders
      kdePackages.qt6ct
      nautilus
    ];
  };

  qt.enable = true;
  gtk.enable = true;
  dconf.enable = true;
}
