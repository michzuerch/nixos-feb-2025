{pkgs, ...}: {
  home.packages = with pkgs; [
    flatpak
    gnome-software
  ];

  services.flatpak = {
    update.onActivation = true;
    remotes = [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
    packages = [
      {
        appId = "com.brave.Browser";
        origin = "flathub";
      }
      "com.obsproject.Studio"
      "im.riot.Riot"
    ];
  };
}
