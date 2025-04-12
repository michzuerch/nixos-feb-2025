{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];
  #  nixpkgs.config.packageOverrides = pkgs: {
  #    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  #  };

  # OpenGL
  hardware.graphics = {
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
}
