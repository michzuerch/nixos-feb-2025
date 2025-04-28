{lib, ...}: {
  stylix = {
    targets = {
      waybar.enable = true;
      hyprland = {
        enable = true;
        hyprpaper.enable = true;
      };
      hyprlock = {
        enable = true;
        # background.path = lib.mkDefault ../Wallpapers/windows11.jpg;
      };
      vscode.enable = true;
      wofi.enable = false;
    };
  };
}
