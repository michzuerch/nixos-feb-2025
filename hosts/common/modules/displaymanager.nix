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
      displayManager.lightdm.enable = true;
    };

    displayManager = {
      defaultSession = "hyprland";
      #   sddm = {
      #     enable = true;
      #     #package = pkgs.kdePackages.sddm; #expected unique
      #     theme = "sddm-astronaut-theme";
      #     autoNumlock = true;
      #     enableHidpi = true;
      #     wayland.enable = true;
      #     extraPackages = with pkgs; [
      #       kdePackages.qtmultimedia
      #       kdePackages.qtsvg
      #       kdePackages.qtvirtualkeyboard
      #     ];
      #   };
    };
  };
  # environment.systemPackages = with pkgs; [
  #   sddm-astronaut
  #   (pkgs.callPackage ./sddm-astronaut-theme.nix {
  #     theme = "black_hole";
  #     themeConfig = {
  #       General = {
  #         HeaderText = "Hi";
  #         Background = "/home/michzuerch/Wallpapers/IMG_20180915_191524.png";
  #         FontSize = "10.0";
  #       };
  #     };
  #   })
  # ];
}
