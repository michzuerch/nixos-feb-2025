{
  pkgs,
  modulesPath,
  lib,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" "bcachefs"];

  nixpkgs.config.pulseaudio = true;

  environment.systemPackages = with pkgs; [
    alacritty
    alejandra
    cryptsetup
    disko
    fastfetch
    fzf
    jql
    pciutils
    parted
    gtop
    neovim
    yazi
    gh
    bat
    ripgrep
    vscode
    tmux
    tree
    nano
    sbctl
    rsync
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = false;
  };

  programs = {
    zsh.enable = true;
    git.enable = true;
    dconf.enable = true;
    light.enable = true;
    mtr.enable = true;
  };

  services.qemuGuest.enable = true;

  time.timeZone = "Europe/Busingen";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  isoImage.volumeID = lib.mkForce "nixos-live-michzuerch";
  isoImage.isoName = lib.mkForce "nixos-live-michzuerch.iso";
  isoImage.squashfsCompression = "zstd -Xcompression-level 6";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}
