{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
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
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --time --asterisks --remember-session --theme border=blue;container=black;prompt=green;input=red";
          user = "greeter";
        };
      };
      vt = 2;
    };
  };
}
