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

    gitui.enable = true; #Temporary disbled for stylix

    dircolors.enable = true;

    nix-index = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = false;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = false;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = false;
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
    # bandwhich
    bat
    chatgpt-cli
    cowsay
    delta
    direnv
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
