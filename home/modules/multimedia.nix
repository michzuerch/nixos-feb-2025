{pkgs, ...}: {
  home.packages = with pkgs; [
    digikam
    jellyfin-ffmpeg
    handbrake
    kodi-wayland
    kdePackages.kdenlive
    losslesscut-bin
    qmediathekview
    mpv
    vlc
    yt-dlp
    tartube-yt-dlp
  ];
}
