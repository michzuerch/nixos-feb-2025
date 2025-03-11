{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    git
    gh
    nh
    #kdePacka
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
