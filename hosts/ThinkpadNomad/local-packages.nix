{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    git
    gh
    nh
    ripgrep
    fzf
    yazi
    mc
  ];
}
