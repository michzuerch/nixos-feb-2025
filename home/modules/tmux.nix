{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 10000;
    clock24 = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.catppuccin
      tmuxPlugins.sensible
      tmuxPlugins.continuum
      tmuxPlugins.yank
      # tmuxPlugins.tmux-fzf
    ];
    extraConfig = ''
      set -g detach-on-destroy off
      set-environment -g COLORTERM "truecolor"
      set-option -g mouse on
      set -g renumber-windows on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      set -g @continuum-restore 'on'
      set -g @continuum-boot 'on'
      set -g @continuum-save-interval '10'

    '';
  };

  home.packages = with pkgs; [byobu];
}
