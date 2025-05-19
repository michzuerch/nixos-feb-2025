{
  stylix = {
    enableReleaseChecks = false;
    targets = {
      alacritty.enable = true;
      bat.enable = true;
      firefox = {
        enable = true;
        profileNames = ["michzuerch"];
      };
      librewolf = {
        enable = true;
        profileNames = ["michzuerch"];
      };
      fish.enable = true;
      foot.enable = true;
      fzf.enable = true;
      ghostty.enable = true;
      gitui.enable = true;
      gtk.enable = true;
      helix.enable = true;
      hyprland.enable = true;
      hyprpaper.enable = false;
      hyprlock = {
        enable = false;
        useWallpaper = false;
      };
      k9s.enable = true;
      kde = {
        enable = true;
        useWallpaper = false;
        decorations = "org.kde.breeze";
      };
      kitty = {
        enable = true;
        variant256Colors = true;
      };
      kubecolor.enable = true;
      lazygit.enable = true;
      nvf = {
        enable = true;
        plugin = "base16";
        transparentBackground = true;
      };
      qt = {
        enable = true;
        platform = "qtct";
      };
      qutebrowser.enable = true;
      rofi.enable = true;
      starship.enable = false;
      swaync.enable = true;
      tmux.enable = true;
      vscode.enable = true;
      waybar = {
        enable = true;
        addCss = true;
        enableCenterBackColors = false;
        enableLeftBackColors = false;
        enableRightBackColors = false;
        font = "sansSerif";
      };
      xresources.enable = true;
      yazi.enable = true;
      xfce.enable = true;
      zed.enable = true;
      zellij.enable = true;
      wofi.enable = false;
    };
  };
}
