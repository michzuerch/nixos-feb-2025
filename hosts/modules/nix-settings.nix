{lib, ...}: {
  nix = {
    settings = {
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["michzuerch"];
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://cosmic.cachix.org/"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "cursor"
          "windsurf"
        ];
      android_sdk.accept_license = true;
    };
    permittedInsecurePackages = ["ventoy-1.1.05"];
  };
}
