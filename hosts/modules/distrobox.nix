{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    distrobox
    distrobox-tui
    boxbuddy
  ];
}
