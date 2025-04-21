{pkgs, ...}: {
  systemd.services.macchanger = {
    enable = false;
    description = "Change MAC address";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.macchanger}/bin/macchanger -r wlp4s0";
      ExecStop = "${pkgs.macchanger}/bin/macchanger -p wlp4s0";
      RemainAfterExit = true;
    };
  };
}
