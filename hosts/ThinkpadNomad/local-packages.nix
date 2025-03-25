{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    git
    gh
    nh
    gtop
    ripfrep
    fzf
  ];
}
