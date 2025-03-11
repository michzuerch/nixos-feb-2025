{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gh
    git
    nh
    #kdePackages.kdenlive
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
