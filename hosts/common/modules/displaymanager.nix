_: {
  services = {
    xserver = {
      enable = true;
      dpi = 96;
      xkb = {
        layout = "us";
        variant = "";
        options = "";
      };
      displayManager.lightdm.enable = true;
    };
    displayManager.defaultSession = "hyprland";
  };
}
