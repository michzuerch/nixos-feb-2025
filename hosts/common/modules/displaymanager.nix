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
    };

    displayManager = {
      defaultSession = "hyprland";

      sddm = {
        enable = true;
        #package = pkgs.kdePackages.sddm; #expected unique
        theme = "sddm-astronaut-theme";
        autoNumlock = true;
        enableHidpi = true;
        wayland.enable = true;
        extraPackages = with pkgs; [
          kdePackages.qtmultimedia
          kdePackages.qtsvg
          kdePackages.qtvirtualkeyboard
        ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    #catppuccin-sddm
    sddm-astronaut
  ];
}
