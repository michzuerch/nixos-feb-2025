# nixos

Nixos configuration michzuerch 2024

## Partitioning with disko

Boot from the installer-iso and run
''bash
sudo disko --mode disko --flake github:michzuerch/nixos-feb-2025#<hostname>
''

## nixos-install

After the partitioning run the installer

''bash
sudo nixos-install --root /mnt --flake github:michzuerch/nixos-feb-2025#<hostname>
''

## Set the password for a user

''bash
sudo nixos-enter --root /mnt -c 'passwd <username>'
''

## build iso for installer

''bash
nix build .#nixosConfigurations.installer.config.system.build.isoImage
''

## sops

''bash
sops secrets.yaml
''

## Issues with systemd-boot

1. The default entry is not selected in bootmenu. Press the 'd'-key to select your entry.
2. Timeout doesnt count. Press 't'-key to start the timeout.
