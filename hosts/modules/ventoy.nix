{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ventoy-bin-full
  ];
}
