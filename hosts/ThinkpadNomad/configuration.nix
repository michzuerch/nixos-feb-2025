{pkgs, ...}: {
  imports = [
    ./disko.nix
    ./bootloader.nix
    ./hardware-configuration.nix
    ./local-packages.nix
    ./users.nix
  ];

  programs.zsh.enable = true;

  environment.systemPackages = [pkgs.home-manager];

  networking.hostName = "thinkpadnomad";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
