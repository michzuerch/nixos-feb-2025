{pkgs, ...}: {
  imports = [
    ./disko.nix
    ./bootloader.nix
    ./hardware-configuration.nix
    ./local-packages.nix
    ./users.nix
  ];
  environment.systemPackages = [pkgs.home-manager];

  networking.hostName = "VM";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
