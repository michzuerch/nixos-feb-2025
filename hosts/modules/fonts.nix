{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
      };
    };
    packages = with pkgs; [
      cantarell-fonts
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
