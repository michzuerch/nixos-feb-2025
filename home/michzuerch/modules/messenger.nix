{pkgs, ...}: {
  home.packages = with pkgs; [
    whatsapp-for-linux
    signal-desktop
  ];
}
