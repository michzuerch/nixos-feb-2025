{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-plasma5.nix"
    #"${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
  ];

  nixpkgs.config.pulseaudio = true;

  environment.systemPackages = with pkgs; [
    neovim
    disko
    parted
    gtop
    yazi
    fastfetch
    gh
    bat
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = false;
  };

  programs = {
    nm-applet.enable = true;
    zsh.enable = true;
    git.enable = true;
    dconf.enable = true;
    light.enable = true;
    mtr.enable = true;
  };

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

  networking.networkmanager.enable = true;

  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.hostPlatform = "x86_64-linux";
}
