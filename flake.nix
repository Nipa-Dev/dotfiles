{
  description = "My Home Manager and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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

    dms = {
      url = "github:duxlabs-dev/dux-shell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:duxlabs-dev/dux-gop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      zen-browser,
      niri,
      dms,
      dgop,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
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
      formatter.${system} = pkgs.nixfmt-tree;

      # Home Manager configuration
      homeConfigurations = {
        nipa = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit inputs;
            niri = niri.packages.${system}.niri-unstable;
            zen-browser = zen-browser;
            dgop = dgop;
            userConfig = users.nipa;

            nhModules = ./modules/home;
          };

          modules = [
            ./home/nipa/ideapad/default.nix
            niri.homeModules.niri
            zen-browser.homeModules.twilight

            dms.homeModules.dank-material-shell
          ];
        };
      };

      # NixOS configuration
      nixosConfigurations = {
        ideapad = nixpkgs.lib.nixosSystem {
          inherit system pkgs;

          modules = [
            ./hosts/ideapad/default.nix
            niri.nixosModules.niri
            home-manager.nixosModules.home-manager
          ];

          specialArgs = {
            inherit inputs;
            hostname = "ideapad";
            nixosModules = nixosModules;
            userConfig = users.nipa;
            niriPackage = niri.packages.${system}.niri-unstable;
          };
        };
      };
    };
}
