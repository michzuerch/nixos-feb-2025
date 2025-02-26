{pkgs, ...}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./local-packages.nix
  ];

  environment.systemPackages = [pkgs.home-manager];

  networking.hostName = "thinkpadnomad";

  system.stateVersion = "25.05";
}
