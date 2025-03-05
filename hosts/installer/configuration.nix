{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };

  services.displayManager.defaultSession = "xfce";
  environment.systemPackages = with pkgs; [
    neovim
    disko
    parted
    git
    gh
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.hostPlatform = "x86_64-linux";
}
