{pkgs, ...}: {
  programs = {
    nm-applet.enable = true;
    git.enable = true;
    dconf.enable = true;
    light.enable = true;
    mtr.enable = true;
    hyprland.enable = true;
  };
}
