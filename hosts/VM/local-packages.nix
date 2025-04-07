{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gh
    git
    nh
    yazi
    mc
    #kdePackages.kdenlive
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
