{pkgs, ...}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./local-packages.nix
    ./users.nix
  ];
  programs.zsh.enable = true;
  environment.systemPackages = [pkgs.home-manager];

  networking.hostName = "VM";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
