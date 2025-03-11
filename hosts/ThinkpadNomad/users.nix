{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users.michzuerch = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$Jua4KwG1voqhAtaM6WsUd1$pzPAn5C5HGeMFaGIFcnkQ8.iPJOZQY/lvZfv/GWYob6
";
      description = "Michi";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "tss"
        "video"
        "wireshark"
        "podman"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILsyEfMjNUlwrf4NG3f6BWpP4uSzCfpC7V5jMqtiLfSQ michzuerch@localhost"
      ];
    };
  };
}
