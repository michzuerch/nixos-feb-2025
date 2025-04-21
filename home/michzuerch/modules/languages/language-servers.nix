{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-js-debug
    typescript-language-server
    nil
    hyprls
    htmx-lsp2
    marksman
    yaml-language-server
    vue-language-server
    typescript-language-server
    tailwindcss-language-server
    systemd-language-server
    svelte-language-server
    nodePackages_latest.vscode-json-languageserver
    sumneko-lua-language-server
    emmet-language-server
    dockerfile-language-server-nodejs
    cmake-language-server
    bash-language-server
    astro-language-server
    ansible-language-server
    nixd
  ];
}
