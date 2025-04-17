{
  pkgs,
  config,
  ...
}: {
  home = {
    pointerCursor = {
      package = pkgs.catppuccin-cursors.latteDark;
      name = "catppuccin-latte-dark-cursors";
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };

    packages = with pkgs; [
      papirus-folders
      #kdePackages.qt6ct

      nautilus
    ];
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";

      # catppuccin = {
      #   enable = true;
      #   apply = true;
      #   accent = "blue";
      #   flavor = "macchiato";
      # };
    };
  };

  gtk = {
    enable = true;

    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
      size = 11;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "catppuccin-macchiato-pink-compact";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        variant = "macchiato";
      };
      # name = "adw-gtk3-dark";
      # package = pkgs.adw-gtk3;
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintfull"
        gtk-xft-rgba="rgb"
      '';
    };

    gtk3 = {
      bookmarks = [
        "file://${config.home.homeDirectory}/Documents"
        "file://${config.home.homeDirectory}/Downloads"
        "file://${config.home.homeDirectory}/Music"
        "file://${config.home.homeDirectory}/Pictures"
        "file://${config.home.homeDirectory}/Videos"
      ];

      extraConfig = {
        gtk-application-prefer-dark-theme = 1;

        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-xft-rgba = "rgb";
      };
    };
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  xresources.properties = {
    "Xft.dpi" = 150;
    "*.dpi" = 150;
  };
}
