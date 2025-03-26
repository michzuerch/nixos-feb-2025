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
/*
{pkgs, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
    nativeBuildInputs = builtins.attrValues {
      inherit
        (pkgs)
        # Required for pre-commit hook 'nixpkgs-fmt' only on Darwin
        # REF: <https://discourse.nixos.org/t/nix-shell-rust-hello-world-ld-linkage-issue/17381/4>
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
        ;
    };
  };
}
*/

