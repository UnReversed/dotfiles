{...}: {
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
  programs.home-manager = {
    enable = true;
  };
  programs.nh = {
    enable = true;
    flake = "/home/unreversed/nixos";
  };
  home = {
    username = "unreversed";
    homeDirectory = "/home/unreversed";
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
