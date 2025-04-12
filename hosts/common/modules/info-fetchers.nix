{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    macchina
    cpufetch
    octofetch
    htop
    gtop
    kmon
    nmon
    glances
    netdata
    monit
    # vulkan-tools
    # opencl-info
    # clinfo
    # vdpauinfo
    # libva-utils
    # nvtop
    dig
    speedtest-rs
  ];
}
