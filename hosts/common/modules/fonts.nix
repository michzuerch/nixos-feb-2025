{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      google-fonts
      material-design-icons
      material-symbols
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      noto-fonts
    ];
  };
  environment.systemPackages = with pkgs; [
    fontforge-gtk
    font-manager
  ];
}
