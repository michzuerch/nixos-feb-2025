{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    pkgs.gcc
    pkgs.git
    pkgs.gh
    pkgs.nh
    pkgs.ripgrep
    pkgs.fzf
    pkgs.yazi
    pkgs.mc
    inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
