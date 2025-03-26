{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = with pkgs.buildPackages; [
    nil
    alejandra
    nh
    libiconv
    nix
    cachix
    home-manager
    git
    just
    pre-commit
    age
    ssh-to-age
    sops
  ];
}
