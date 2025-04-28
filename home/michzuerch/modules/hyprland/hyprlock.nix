{lib, ...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {disable_loading_bar = false;};
      background = {
        path = lib.mkDefault ../Wallpapers/windows11.jpg;
      };
    };
  };
}
