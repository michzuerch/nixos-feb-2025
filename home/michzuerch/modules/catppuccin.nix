{pkgs, ...}: {
  home.packages = with pkgs; [];
  catppuccin = {
    enable = true;
    flavor = "macchiato";
    accent = "mauve";
    # pointerCursor = {
    #   enable = true;
    #   flavor = "macchiato";
    #   accent = "mauve";
    # };
    alacritty.enable = true;
    bat.enable = true;
    delta.enable = true;
    fzf.enable = true;
    helix.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    k9s.enable = true;
    tmux.enable = true;
    zellij.enable = true;
  };
}
