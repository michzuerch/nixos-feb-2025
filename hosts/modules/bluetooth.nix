{pkgs, ...}: {
  environment.systemPackages = with pkgs; [bluez];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
  services.blueman.enable = true;
  systemd.user.services.telephony_client.enable = false;
}
