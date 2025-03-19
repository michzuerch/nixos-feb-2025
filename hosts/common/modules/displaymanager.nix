{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      dpi = 96;
      xkb = {
        layout = "us";
        variant = "";
        options = "";
      };
      #displayManager.lightdm.enable = true;
      #displayManager.sddm.enable = true;
    };
    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-sddm";
      defaultSession = "hyprland";
    };
  };
  environment.systemPackages = [pkgs.catppuccin-sddm];
}
