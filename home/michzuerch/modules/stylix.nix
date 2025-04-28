{lib, ...}: {
  stylix = {
    targets = {
      alacritty.enable = true;
      bat.enable = true;

      waybar.enable = true;
      hyprpaper.enable = false;
      hyprland = {
        enable = true;
      };
      hyprlock = {
        enable = true;
        # background.path = lib.mkDefault ../Wallpapers/windows11.jpg;
      };
      vscode.enable = true;
      wofi.enable = false;
      firefox = {
        enable = true;
        # colorTheme.enable = true;
        # profileNames = ["michzuerch"];
        # profiles.michzuerch.extensions.force = true;
      };
      librewolf = {
        enable = true;
        # colorTheme.enable = true;
        # profileNames = ["michzuerch"];
        # profiles.michzuerch.extensions.force = true;
      };
      fish.enable = true;
      foot.enable = true;
      fzf.enable = true;
      ghostty.enable = true;
      gitui.enable = true;
    };
  };
}
