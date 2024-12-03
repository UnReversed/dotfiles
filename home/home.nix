{...}: {
  home.username = "unreversed";
  home.homeDirectory = "/home/unreversed";

  imports = [
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
