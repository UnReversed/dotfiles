{inputs, ...}: {
  home.username = "unreversed";
  home.homeDirectory = "/home/unreversed";

  imports = [
    inputs.nix-index-database.hmModules.nix-index
    inputs.nixvim.homeManagerModules.nixvim
    ./core
    ./gui

    ./packages.nix

    ./dev-tools/Azure.nix
    ./dev-tools/terraform.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
