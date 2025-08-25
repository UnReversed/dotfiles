{
  pkgs,
  nixpkgs,
  nix-vscode-extensions,
  ...
}: {
  nix = {
    # nixPath = ["nixpkgs=${nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];

      auto-optimise-store = true;
      sandbox = true;

      trusted-users = [
        "@wheel"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://lanzaboote.cachix.org"
      ];

      trusted-public-keys = [
        "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "lanzaboote.cachix.org-1:Nt9//zGmqkg1k5iu+B3bkj3OmHKjSw9pvf3faffLLNk="
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    nvd
    nix-output-monitor
  ];

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 10";
    };
  };

  nixpkgs = {
    config = {
      allowBroken = false;
      allowUnfree = true;
    };
    overlays = [
      # outputs.overlays.vscode-packages
      nix-vscode-extensions.overlays.default
    ];
  };
}
