{
  description = "test";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # inspired by https://github.com/Misterio77/nix-config/blob/637e5f350a1f82ad2cd3da2a8a028ebf9f39b02e/flake.nix#L45
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    disko,
    lanzaboote,
    ...
  } @ inputs: let
    specialArgs = {inherit inputs;};
    modules = [
      disko.nixosModules.disko
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
          };
          users.unreversed = import ./home/home.nix;
        };
      }
    ];
  in {
    nixosConfigurations = {
      test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules =
          [
            ./hosts/test/configuration.nix
          ]
          ++ modules;
      };
      reno = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;
        modules =
          [
            ./hosts/reno/configuration.nix
            lanzaboote.nixosModules.lanzaboote
          ]
          ++ modules;
      };
    };
  };
}
