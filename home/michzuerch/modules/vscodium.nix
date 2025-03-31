{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default.userSettings = {
      "editor.formatOnSave" = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nixpkgs" = {
        "expr" = "import <nixpkgs> {}";
      };
      "formatting" = {
        "command" = ["alejandra"];
      };
    };
    profiles.default.extensions = with pkgs; [


(vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];
  })

    ];



    /*
    catppuccin.catppuccin-vsc-icons
    jnoortheen.nix-ide
    kamadorueda.alejandra
    sumneko.lua
    hashicorp.hcl
    eamodio.gitlens
    mikestead.dotenv
    tyriar.sort-lines
    vspacecode.whichkey
    usernamehw.errorlens
    unifiedjs.vscode-mdx
    svelte.svelte-vscode
    ecmel.vscode-html-css
    wix.vscode-import-cost
    saoudrizwan.claude-dev
    mongodb.mongodb-vscode
    graphql.vscode-graphql
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
    codezombiech.gitignore
    anweber.vscode-httpyac
    yoavbls.pretty-ts-errors
    tauri-apps.tauri-vscode
    tamasfe.even-better-toml
    rust-lang.rust-analyzer
    naumovs.color-highlight
    james-yu.latex-workshop
    astro-build.astro-vscode
    stylelint.vscode-stylelint
    nefrob.vscode-just-syntax
    bradlc.vscode-tailwindcss
    ms-azuretools.vscode-docker
    jeff-hykin.better-nix-syntax
    github.vscode-github-actions
    formulahendry.auto-close-tag
    graphql.vscode-graphql-syntax
    vitaliymaz.vscode-svg-previewer
    ms-kubernetes-tools.vscode-kubernetes-tools
    github.vscode-pull-request-github
    firefox-devtools.vscode-firefox-debug
    christian-kohler.npm-intellisense
    redhat.vscode-yaml
    */
  };
}
