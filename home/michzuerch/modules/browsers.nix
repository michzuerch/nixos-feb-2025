{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs = {
    chromium = {enable = true;};
    brave = {enable = true;};
    firefox = {
      enable = true;
      package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;
    };
    qutebrowser = {enable = false;};
  };
}
