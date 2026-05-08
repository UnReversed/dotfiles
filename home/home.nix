{...}: {
  imports = [
    ./core
    ./gui

    ./packages.nix
    ./terminal
    ./terminal/emulator

    ./programs

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
  home = {
    username = "unreversed";
    homeDirectory = "/home/unreversed";
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
