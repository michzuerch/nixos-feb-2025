{pkgs, ...}: {
  home.packages = with pkgs; [
    wasistlos
    #signal-desktop
  ];
}
