{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      bbenoist.nix
      kamadorueda.alejandra
    ];
  };
}
