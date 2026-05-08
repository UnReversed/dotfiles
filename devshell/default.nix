{
  system,
  devenv,
  nixpkgs,
  inputs,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.${system};
in
  devenv.lib.mkShell {
    inherit inputs pkgs;
    modules = [
      ({pkgs, ...}: {
        packages = with pkgs; [
          yazi
          nixd
          git
          alejandra
        ];
        git-hooks = {
          enable = true;
          hooks = {
            alejandra.enable = true;
            deadnix.enable = true;
          };
        };
      })
    ];
  }
