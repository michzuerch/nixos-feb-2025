{pkgs, ...}: {
  imports = [
    ./modules
  ];
  programs.zsh.enable = true;
  home = {
    packages = with pkgs; [
      nautilus
      libsForQt5.dolphin
      libsForQt5.dolphin-plugins
    ];
    username = "michzuerch";
    # homeDirectory = "/home/michzuerch";
    stateVersion = "25.05";
  };
}
