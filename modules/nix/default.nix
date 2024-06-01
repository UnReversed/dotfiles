{ ... }: {
  nix = {
    gc = {
      automatic = true;
      # options = "--delete-older-than +5";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; 

      auto-optimise-store = true;
      sandbox = true;

      substituters = [
        "https://cache.nixos.org"
        "https://nixpkgs.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];

      trusted-public-keys = [
        "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  system = {
    autoUpgrade.enable = true;
    stateVersion = "23.11";
  };
  nixpkgs.config = { 
    allowBroken = false;
    allowUnfree = true; 
  };
}