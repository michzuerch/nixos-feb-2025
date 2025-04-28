{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = ["~/Wallpapers/nixos-dark.png"];
      wallpaper = [",~/Wallpapers/nixos-dark.png"];
    };
  };
  # Hyprpaper configuration file
  # preload = ~/Wallpapers/Wolf2.jpg
  # wallpaper = ,~/Wallpapers/Wolf2.jpg

  # home.file.".config/hypr/hyprpaper.conf".text = ''
  #   preload = ~/Wallpapers/nixos-wallpaper-catppuccin-mocha.jpg
  #   wallpaper = ,~/Wallpapers/nixos-wallpaper-catppuccin-mocha.jpg
  # '';
}
