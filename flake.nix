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
    nvix = {
      url = "github:michzuerch/nvix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/nur";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

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
    nvix,
    nixos-cosmic,
    catppuccin,
    rose-pine-hyprcursor,
    nsearch,
    sops-nix,
    stylix,
    disko,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = ["x86_64-linux"];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system: import nixpkgs {inherit system;});
  in {
    inherit lib;
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          ./hosts/ThinkpadNomad/configuration.nix
          ./hosts/ThinkpadNomad/modules
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
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          #nixos-cosmic.nixosModules.default
          disko.nixosModules.disko
          #sops-nix.nixosModules.sops
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
