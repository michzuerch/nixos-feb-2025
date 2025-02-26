{pkgs, ...}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./local-packages.nix
  ];

  environment.systemPackages = [pkgs.home-manager];

  networking.hostName = "VM";

  system.stateVersion = "25.05";
}
