# *.nix
{
  pkgs,
  inputs,
  ...
}: {
  # Apply the overlay to the package set
  nixpkgs.overlays = [
    inputs.hyprpanel.overlay
  ];
  environment.systemPackages = [pkgs.hyprpanel];
}
