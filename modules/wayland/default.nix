{pkgs, ...}: {
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  services.gvfs.enable = true;

  services = {
    hypridle.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --time --asterisks --cmd Hyprland --theme border=blue;container=black;prompt=green;input=red";
          user = "greeter";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    dunst
    alacritty
    rofi-wayland
  ];
}
