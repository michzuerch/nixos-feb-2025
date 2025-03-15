{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    nm-applet.enable = true;
    zsh.enable = true;
    git.enable = true;
    dconf.enable = true;
    light.enable = true;
    mtr.enable = true;
    hyprland.enable = true;
    #hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
}
