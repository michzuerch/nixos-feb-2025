{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
        disabled = false;
        vimcmd_symbol = "";
      };
      battery.disabled = false;
      status.disabled = false;
    };
  };
}
