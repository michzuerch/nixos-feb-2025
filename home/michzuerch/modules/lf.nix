{pkgs, ...}: {
  #xdg.configFile."lf/icons".source = ./icons;
  programs.lf = {
    enable = true;
  };
}
