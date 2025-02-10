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
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # inspired by https://github.com/Misterio77/nix-config/blob/637e5f350a1f82ad2cd3da2a8a028ebf9f39b02e/flake.nix#L45
    firefox-addons = {
      # url = "gitlab:rycee/nur-expressions/79a77a7d0b22e82d52a90055cc8206447ab85285?dir=pkgs/firefox-addons";
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    disko,
    lanzaboote,
    auto-cpufreq,
    nix-index-database,
    nixvim,
    self,
    ...
  } @ inputs: let
    specialArgs = {inherit inputs self;};
    modules = [
      disko.nixosModules.disko
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs self;
          };
          sharedModules = [
            nixvim.homeManagerModules.nixvim
            nix-index-database.hmModules.nix-index
          ];
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
            auto-cpufreq.nixosModules.default
          ]
          ++ modules;
      };
    };
  };
}
