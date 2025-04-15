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
    hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprddm.url = "github:maotseantonio/hyprddm";
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
    catppuccin.url = "github:catppuccin/nix";
    alejandra = {
      #url = "github:kamadorueda/alejandra/3.0.0";
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
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
    nixos-anywhere = {
      url = "github:numtide/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.disko.follows = "disko";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    nix-flatpak,
    nvf,
    nixos-cosmic,
    catppuccin,
    sops-nix,
    disko,
    nix-index-database,
    nur,
    chaotic,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    system = "x86_64-linux"; # change to whatever your system should be
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    inherit lib;
    #formatter.${system} = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    formatter.${system} = pkgs.alejandra;

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        git
        gh
        yazi
        ripgrep-all
        jq
        pciutils
        tree
        tealdeer
        fastfetch
        gtop
        sbctl
      ];
    };

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/ThinkpadNomad/configuration.nix
          ./hosts/ThinkpadNomad/modules
          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          nvf.nixosModules.default
          catppuccin.nixosModules.catppuccin
          nix-index-database.nixosModules.nix-index
          nur.modules.nixos.default
          chaotic.nixosModules.default
          nixos-cosmic.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit system outputs inputs;
              };
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
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
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/VM/configuration.nix
          ./hosts/VM/modules
          nvf.nixosModules.default
          catppuccin.nixosModules.catppuccin
          nix-index-database.nixosModules.nix-index
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          chaotic.nixosModules.default
          nixos-cosmic.nixosModules.default
          home-manager.nixosModules.home-manager
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
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
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/installer/configuration.nix
        ];
      };
    };
  };
}
