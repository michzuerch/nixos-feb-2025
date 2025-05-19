{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "code-cursor"
      "cursor"
    ];

  home.packages = with pkgs; [
    code-cursor
  ];
}
