{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    git
    gh
    nh
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
