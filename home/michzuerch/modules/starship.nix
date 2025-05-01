{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 2000;
      character = {
        disabled = false;
        vimcmd_symbol = "";
      };
      battery.disabled = false;
      status.disabled = false;
    };
  };
}
