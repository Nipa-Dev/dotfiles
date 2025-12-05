{
  description = "My Home Manager and NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    
    zen-browser = {
	url = "github:0xc000022070/zen-browser-flake";
	
	# IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
	# to have it up-to-date or simply don't specify the nixpkgs input
	inputs.nixpkgs.follows = "nixpkgs";
	inputs.home-manager.follows = "home-manager";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
  in
  {
    homeConfigurations = {
      nipa = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	extraSpecialArgs = {
	    inherit zen-browser;
	};
        modules = [
	    ./home.nix
	    zen-browser.homeModules.twilight
	];
      };
    };

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

