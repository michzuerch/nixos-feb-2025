{pkgs, ...}: {
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    # Find your colorscheme with this gallery https://tinted-theming.github.io/tinted-gallery/
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
    autoEnable = false;
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 32;
    };
    # cursor = {
    #   package = pkgs.bibata-cursors;
    #   name = "Bibata-Modern-Ice";
    #   size = 32;
    # };

    fonts = {
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.8;
      desktop = 0.8;
      popups = 1.0;
    };
    image = ../wallpapers/nixos-dark.jpg;
    polarity = "dark"; #or light
    #targets.plymouth.logo = ./test.jpg;
    #targets.plymouth.logoAnimated
    targets = {
      lightdm = {
        enable = true;
        useWallpaper = true;
      };
      chromium.enable = true;
      console.enable = true;
      plymouth = {
        enable = true;
        # logo
        # logoAnimated
      };
    };
  };
}
