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

    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        #theme = "catppuccin-sddm";
        theme = "sddm-astronaut-theme";
        extraPackages = [pkgs.kdePackages.qtmultimedia];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    #catppuccin-sddm
    sddm-astronaut
  ];
}
