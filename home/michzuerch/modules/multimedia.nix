{pkgs, ...}: {
  home.packages = with pkgs; [
    digikam
    jellyfin-ffmpeg
    handbrake
    kodi-wayland
    libsForQt5.kdenlive
    losslesscut-bin
    qmediathekview
    mpv
    vlc
    yt-dlp
    tartube-yt-dlp
  ];
}
