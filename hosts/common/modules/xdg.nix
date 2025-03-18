{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    # Build error on first try
    # extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
      pantheon = {
        default = [
          "pantheon"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      x-cinnamon = {
        default = [
          "xapp"
          "gtk"
        ];
      };
    };
  };
}
