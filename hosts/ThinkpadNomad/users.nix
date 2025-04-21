{pkgs, ...}: {
  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;
    users.michzuerch = {
      isNormalUser = true;
      /*
         initialHashedPassword = ''
        $6$NMZRL4Sdxhrxp37V$qoFxGAaRcQ8l73cTZHaD6l40Uo4vIS7Z4gt38A/.Eemfhxi2pFH/JQoL2qWeMcd/S6LCmnGe9K8kogIlrFPal
      '';
      */
      description = "Michi";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "tss"
        "wireshark"
        "podman"
        "input"
        "audio"
      ];
      /*
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILsyEfMjNUlwrf4NG3f6BWpP4uSzCfpC7V5jMqtiLfSQ michzuerch@localhost"
      ];
      */
    };
  };
}
