{pkgs, ...}: {
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      AllowUsers = ["michzuerch"];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "without-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
}
