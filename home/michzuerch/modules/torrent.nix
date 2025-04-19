{pkgs, ...}: {
  home.packages = with pkgs; [
    qbittorrent
    transmission_4
  ];
}
