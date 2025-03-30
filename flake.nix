{
  description = "nixos michzuerch march 2025";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      #url = "github:nix-community/home-manager/release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nsearch = {
      url = "github:niksingh710/nsearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    nvf,
    nixos-cosmic,
    catppuccin,
    rose-pine-hyprcursor,
    nsearch,
    sops-nix,
    disko,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    #pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    inherit lib;
    formatter.x86_64-linux = nixpkgs.legacyPackages."x86_64-linux".alejandra;

    devShells.x86_64-linux.default = nixpkgs.legacyPackages."x86_64-linux".mkShell {
      packages = with nixpkgs.legacyPackages."x86_64-linux"; [
        git
        gh
        yazi
        fastfetch
        gtop
      ];

      env.LD_LIBRARY_PATH = lib.makeLibraryPath [
        nixpkgs.legacyPackages."x86_64-linux".libz
      ];
    };

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          ./hosts/ThinkpadNomad/configuration.nix
          ./hosts/ThinkpadNomad/modules
          nvf.nixosModules.default
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          nixos-cosmic.nixosModules.default
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
                    catppuccin.homeManagerModules.catppuccin
                    ./home/michzuerch/home.nix
                  ];
                };
              };
            };
          }
        ];
      };

      VM = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          ./hosts/VM/configuration.nix
          ./hosts/VM/modules
          nvf.nixosModules.default
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          nixos-cosmic.nixosModules.default
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
                    catppuccin.homeManagerModules.catppuccin
                    ./home/michzuerch/home.nix
                  ];
                };
              };
            };
          }
        ];
      };

      installer = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          ./hosts/installer/configuration.nix
        ];
      };
    };
  };
}
