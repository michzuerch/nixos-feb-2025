{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    macchina
    cpufetch
    octofetch
    htop
    gtop
    btop
    kmon
    nmon
    glances
    netdata
    #monit
    vulkan-tools
    clinfo
    vdpauinfo
    libva-utils
    #nvtop
    dig
    speedtest-rs
  ];
}
