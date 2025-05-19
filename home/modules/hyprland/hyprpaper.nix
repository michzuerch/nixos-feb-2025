{pkgs, ...}: {
  # Hyprpaper configuration file
  # preload = ~/Wallpapers/Wolf2.jpg
  # wallpaper = ,~/Wallpapers/Wolf2.jpg
  home.packages = [pkgs.hyprpaper];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Wallpapers/nixos-dark.png
    wallpaper = ,~/Wallpapers/nixos-dark.png
  '';
}
