{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    git
    gh
    nh
    gtop
    ripgrep
    fzf
    yazi
    mc
  ];
}
