{pkgs, ...}: {
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 1d --keep 3";
      flake = "/home/michzuerch/Source/nixos-feb-2025";
    };
  };
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
