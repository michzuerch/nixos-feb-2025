{
  inputs,
  pkgs,
  ...
}: {
  # Apply the overlay to the package set
  nixpkgs.overlays = [
    #inputs.rust-overlay.overlays.default
    inputs.fenix.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly

    # (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
    # lldb_16
    # taplo # toml formatter & lsp
    # cargo-watch
    # cargo-deny
    # cargo-audit
    # cargo-update
    # cargo-edit
    # cargo-outdated
    # cargo-license
    # cargo-tarpaulin
    # cargo-cross
    # cargo-zigbuild
    # cargo-nextest
    # cargo-spellcheck
    # cargo-modules
    # cargo-bloat
    # cargo-unused-features
    # bacon
    # evcxr # rust repl
  ];
}
