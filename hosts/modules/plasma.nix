{pkgs, ...}: {
  services = {
    # xserver.desktopManager.plasma5.enable = true;
    desktopManager = {
      plasma6.enable = true;
    };
  };

  environment.systemPackages = with pkgs.kdePackages; [
    # kde apps
    dolphin
    dolphin-plugins
    gwenview
    ark

    # open with
    kservice
    kde-cli-tools

    # thumbnails
    ffmpegthumbs
    kio
    kio-extras
    kio-fuse
    kimageformats
    kdegraphics-thumbnailers
  ];

  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   plasma-browser-integration
  #   konsole
  #   oxygen
  # ];
}
