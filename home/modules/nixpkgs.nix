{lib, ...}: {
  nixpkgs = {
    config = {
      # allowUnfree = true;
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "windsurf"
          "cursor"
        ];
    };
  };
}
