{
  description = "My Home Manager and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, niri, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    # User definitions
    users = {
      nipa = {
        name = "nipa";
        fullName = "Nipa";
      };
    };

    # Path to NixOS modules
    nixosModules = ./modules/nixos;
  in
  {
    # Home Manager configuration
    homeConfigurations = {
      nipa = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          niri = niri.packages.${system}.niri-unstable;
          zen-browser = zen-browser;
          userConfig = users.nipa;

          nhModules = ./modules/home;
        };

        modules = [
          ./home/nipa/ideapads340/default.nix
          niri.homeModules.niri
          zen-browser.homeModules.twilight
        ];
      };
    };


    # NixOS configuration
    nixosConfigurations = {
      ideapads340 = nixpkgs.lib.nixosSystem {
        inherit system pkgs;

        modules = [
          ./hosts/ideapads340/default.nix
          niri.nixosModules.niri
          home-manager.nixosModules.home-manager
        ];

        specialArgs = {
          hostname = "ideapads340";
          nixosModules = nixosModules;
          userConfig = users.nipa;
          niriPackage = niri.packages.${system}.niri-unstable;
        };
      };
    };
  };
}
