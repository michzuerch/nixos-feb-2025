{pkgs, ...}: {
  hardware = {
    sane.enable = true;
    sane.extraBackends = with pkgs; [sane-airscan hplipWithPlugin epkowa];
  };
  services.udev.packages = [pkgs.sane-airscan];
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
}
