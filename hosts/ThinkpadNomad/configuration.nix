{lib, ...}: {
  imports = [
    ./disko.nix
    ./bootloader.nix
    ./hardware-configuration.nix
    ./local-packages.nix
    ./users.nix
  ];

  networking.hostName = "ThinkpadNomad";
  networking.networkmanager.enable = true;

  swapDevices = lib.mkForce [];

  programs.nix-ld.enable = true;

  system.stateVersion = "25.11";
}
