{
  pkgs,
  inputs,
  stylix,
  ...
}: {
  imports = [
    inputs.nur.modules.homeManager.default
    inputs.chaotic.homeManagerModules.default
    inputs.nix-index-database.hmModules.nix-index
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    stylix.homeManagerModules.stylix
    ./modules
  ];
  home = {
    username = "michzuerch";
    homeDirectory = "/home/michzuerch";
    stateVersion = "25.05";
    packages = with pkgs; [
      nautilus
      libsForQt5.dolphin
      libsForQt5.dolphin-plugins
    ];
  };
}
