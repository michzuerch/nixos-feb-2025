{
  pkgs,
  config,
  ...
}: {
  boot = {
    consoleLogLevel = 0;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=false"
      "udev.log_priority=3"
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
      "nowatchdog"
      #"nvidia-drm.modeset=1"
      #"nvidia-drm.fbdev=1"
      #"modprobe.blacklist=iTCO_wdt"
      #"nohibernate"
    ];
    kernelModules = ["v4l2loopback"];
    extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
    initrd = {
      verbose = false;
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = ["i915" "kvm-intel"];
    };
  };
}
