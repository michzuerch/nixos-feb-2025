_:{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      bbenoist.nix
      kamadorueda.alejandra
  ];
  };
}