{pkgs, ...}: {
  programs.zellij = {
    enable = false;
    package = pkgs.zellij;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      default_shell = "zsh";
      copy_command = "wl-copy";
      copy_on_select = true;
    };
  };
}
