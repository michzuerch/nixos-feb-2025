{pkgs, ...}: {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    bat = {
      enable = true;
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --hidden --no-ignore --follow --exclude .git";
      enableZshIntegration = true;
      enableFishIntegration = false;
    };

    jq.enable = true;

    broot.enable = true;

    gitui.enable = true;

    dircolors.enable = true;

    nix-index = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = false;
    };

    direnv = {
      enable = true;
      silent = true;
      # enableFishIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      colors = "always";
      git = true;
      icons = "always";
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
    tealdeer = {
      enableAutoUpdates = true;
      enable = true;
    };
  };

  home.packages = with pkgs; [
    bandwhich
    bat
    chatgpt-cli
    cowsay
    delta
    du-dust
    doggo
    gping
    just
    nix-output-monitor
    hydra-check
    nix-init
    nix-melt
    nix-tree
    fd
    gcc
    gnumake
    grex
    gtop
    krusader
    ncdu
    procs
    pwgen
    sd
    sqlite
    tig
    p7zip
    tokei
    unzip
    zoxide
  ];
}
