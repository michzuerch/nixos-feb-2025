# *.nix
{
  pkgs,
  inputs,
  ...
}: {
  # Apply the overlay to the package set
  nixpkgs.overlays = [
    #inputs.rust-overlay.overlays.default
    inputs.fenix.overlays.default
  ];
  environment.systemPackages = [pkgs.hyprpanel];
}
