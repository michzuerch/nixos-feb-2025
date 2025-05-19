{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libva
        vaapiVdpau
        intel-compute-runtime
        libva-utils
        libvdpau-va-gl
      ];
    };
    intel-gpu-tools.enable = true;
  };
}
