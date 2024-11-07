{pkgs,...}: {
  home.username = "unreversed";
  home.homeDirectory = "/home/unreversed";

  imports = [
    ./shell
    ./waybar
    ./packages.nix
    ./editors
    ./containers.nix
    ./hyper
  ];

  gtk = {
    enable = true;
    theme = {
      name = "adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  services.ssh-agent.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
