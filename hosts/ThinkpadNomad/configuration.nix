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

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
