{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      #theme = "catppuccin-macchiato";
      default_shell = "zsh";
      copy_command = "wl-copy";
      copy_on_select = true;
    };
  };
}
