{pkgs, ...}: {
  services.clamav.scanner = {
    enable = true;
    interval = "Sat *-*-* 04:00:00";
  };
  environment.systemPackages = with pkgs; [
    vulnix #scan command: vulnix --system
    #clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit #scan command: sudo chkrootkit
  ];
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
    pam.services.hyprlock.text = "auth include login";
    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "${pkgs.systemd}/bin/systemctl suspend";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/reboot";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/poweroff";
              options = ["NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nixos-rebuild";
              options = ["NOPASSWD"];
            }
            {
              command = "${pkgs.systemd}/bin/systemctl";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };
}
